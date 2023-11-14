package ph.com.qkc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import jakarta.transaction.Transactional;
import ph.com.qkc.model.RawMaterial;

public interface RawMaterialRepository extends JpaRepository<RawMaterial, String> {

	@Modifying
	@Transactional
	@Query("UPDATE RawMaterial r SET r.material_cd = ?1, r.material_name = ?2, r.unit_of_measurement = ?3 WHERE r.material_cd = ?4")
	void updateRawMaterial(String newmaterial_cd, String newmaterial_name, String newunit_of_measurement, String oldmaterial_cd);
	
}
