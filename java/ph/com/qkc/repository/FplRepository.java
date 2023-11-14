package ph.com.qkc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import ph.com.qkc.model.CurrentInventoryProducts;
import ph.com.qkc.model.Fpl;

@Repository
public interface FplRepository extends JpaRepository<Fpl, Integer> {

	@Query(value = "SELECT * FROM grp2_finished_product_list "
            + "WHERE branch_id = :branchId "
			+ "AND TO_DATE(date_finished, 'MM-DD-YYYY HH24:MI:SS') >= TO_DATE(:fromDate, 'YYYY-MM-DD') "
            + "AND TO_DATE(date_finished, 'MM-DD-YYYY HH24:MI:SS') <= TO_DATE(:toDate, 'YYYY-MM-DD')", nativeQuery = true)
	List<Fpl> getFplByDateFinishedBetween(@Param("branchId")Integer branch_id, @Param("fromDate") String fromDate, @Param("toDate") String toDate);

	@Query("SELECT new ph.com.qkc.model.CurrentInventoryProducts(fpl.sku.sku_cd, sku.sku_name, "
	        + "SUM(fpl.quantity - COALESCE((SELECT SUM(dt.quantity) FROM DispatchTracking dt WHERE dt.fplId.fplId = fpl.fplId), 0)), "
	        + "sku.unit_of_measurement, br.branch_name) "
	        + "FROM Fpl fpl "
	        + "JOIN Sku sku ON fpl.sku.sku_cd = sku.sku_cd "
	        + "JOIN Branch br ON fpl.branch.branchId = br.branchId "
	        + "WHERE fpl.branch.branchId = ?1 "
	        + "GROUP BY fpl.sku.sku_cd, sku.sku_name, sku.unit_of_measurement, br.branch_name "
	        + "ORDER BY fpl.sku.sku_cd")
	List<CurrentInventoryProducts> findCurrentInventoryProducts(Integer branch_id);
	
	@Query("FROM Fpl f WHERE f.branch.branchId = ?1 ORDER BY f.fplId")
	List<Fpl> findFplByBranchId(Integer branchID);

}
