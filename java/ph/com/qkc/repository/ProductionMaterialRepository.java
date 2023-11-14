package ph.com.qkc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import ph.com.qkc.model.ProductionMaterial;

public interface ProductionMaterialRepository extends JpaRepository<ProductionMaterial, Integer> {

	@Query("FROM ProductionMaterial p WHERE p.dailyPlannedProduction.dpp_id = ?1 ORDER BY p.pm_id")
	public List<ProductionMaterial> findPmByDppId(Integer dppId);
	
	@Query("FROM ProductionMaterial p WHERE p.dailyPlannedProduction.dpp_id = ?1")
	public List<ProductionMaterial> getPmByDppId(Integer dppId);
	
//	@Query("DELETE FROM ProductionMaterial p WHERE p.dailyPlannedProduction.dpp_id = ?1")
//	public void delByDppId(Integer dppId);
	
}
