package ph.com.qkc.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import ph.com.qkc.model.DispatchTracking;
import ph.com.qkc.model.UniqueSku;

@Repository
public interface DispatchTrackingRepository extends JpaRepository<DispatchTracking, Integer> {
	@Query("FROM DispatchTracking dt WHERE dt.branch.branchId = ?1 ORDER BY dt.dispatchTrackingId ASC")
	
	List<DispatchTracking> findAllOrderedById(Integer branch_id);
	@Query("SELECT new ph.com.qkc.model.UniqueSku(fpl.fplId, sku.sku_name, "
	        + "fpl.quantity - COALESCE((SELECT SUM(dt.quantity) FROM DispatchTracking dt WHERE dt.fplId.fplId = fpl.fplId), 0), "
	        + "sku.unit_of_measurement, br.branch_name) "
	        + "FROM Fpl fpl "
	        + "JOIN Sku sku ON fpl.sku.sku_cd = sku.sku_cd "
	        + "JOIN Branch br ON fpl.branch.branchId = br.branchId "
	        + "WHERE fpl.branch.branchId = ?1 "
	        + "ORDER BY fpl.fplId")
	List<UniqueSku> findUniqueSku(Integer branch_id); //For /dispatch
}

	