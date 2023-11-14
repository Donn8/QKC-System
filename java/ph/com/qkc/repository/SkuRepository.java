package ph.com.qkc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import jakarta.transaction.Transactional;
import ph.com.qkc.model.Sku;

public interface SkuRepository extends JpaRepository<Sku, String> {

	@Modifying
	@Transactional
	@Query("UPDATE Sku s SET s.sku_cd = ?1, s.sku_name = ?2 WHERE s.sku_cd = ?3")
	void updateSku(String newsku_cd, String newsku_name, String oldsku_cd);
	
}
