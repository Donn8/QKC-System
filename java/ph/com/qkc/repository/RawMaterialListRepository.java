package ph.com.qkc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import ph.com.qkc.model.CurrentRawMaterialInventory;
import ph.com.qkc.model.RawMaterialList;
import ph.com.qkc.model.UniqueRawMaterial;

public interface RawMaterialListRepository extends JpaRepository<RawMaterialList, Integer> {

	@Query("FROM RawMaterialList r WHERE r.branch.branchId = ?1 ORDER BY r.material_list_id")
	List<RawMaterialList> findAllByBranchId(Integer branch_id);
	
	@Query("SELECT new ph.com.qkc.model.UniqueRawMaterial(DISTINCT(l.rawMaterial.material_cd), r.material_name, (SUM(l.quantity)-NVL((SELECT SUM(p.quantity_to_use) FROM ProductionMaterial p WHERE p.rawMaterial.material_cd = l.rawMaterial.material_cd),0))) FROM RawMaterial r, RawMaterialList l WHERE r.material_cd = l.rawMaterial.material_cd AND l.branch.branchId = ?1 GROUP BY l.rawMaterial.material_cd, r.material_name ORDER BY l.rawMaterial.material_cd")
	List<UniqueRawMaterial> findUniqueRawMaterialByBranchId(Integer branch_id);
	
	//For Report Generation Module
	@Query("SELECT new ph.com.qkc.model.CurrentRawMaterialInventory(l.rawMaterial.material_cd, r.material_name, "
	        + "SUM(l.quantity) - COALESCE((SELECT SUM(pm.quantity_to_use)FROM ProductionMaterial pm WHERE pm.rawMaterial.material_cd = l.rawMaterial.material_cd), 0), "
			+ "r.unit_of_measurement, br.branch_name) "
	        + "FROM RawMaterial r "
	        + "JOIN RawMaterialList l ON l.rawMaterial.material_cd = r.material_cd "
	        + "JOIN Branch br ON l.branch.branchId = br.branchId "
	        + "WHERE l.branch.branchId = :branchId "
	        + "GROUP BY l.rawMaterial.material_cd, r.material_name, r.unit_of_measurement, br.branch_name "
	        + "ORDER BY l.rawMaterial.material_cd")
	List<CurrentRawMaterialInventory> findCurrentRmInventoryByBranchId(@Param("branchId")Integer branch_id);
	
	@Query(value ="SELECT * FROM grp2_raw_material_list WHERE branch_id = :branchId "
			+ "AND TO_DATE(date_receive, 'MM-DD-YYYY HH24:MI:SS') >= TO_DATE(:fromDate, 'YYYY-MM-DD') "
			+ "AND TO_DATE(date_receive, 'MM-DD-YYYY HH24:MI:SS') <= TO_DATE(:toDate, 'YYYY-MM-DD')", nativeQuery = true)
    List<RawMaterialList> getRmlByDateReceivedBetween(@Param("branchId")Integer branch_id, @Param("fromDate") String fromDate, @Param("toDate") String toDate);

}
