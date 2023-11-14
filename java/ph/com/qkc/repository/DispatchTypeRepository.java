package ph.com.qkc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import jakarta.transaction.Transactional;
import ph.com.qkc.model.DispatchType;


@Repository
public interface DispatchTypeRepository extends JpaRepository<DispatchType, String> {
	
	@Modifying
	@Transactional
	@Query("UPDATE DispatchType d SET d.dispatchTypeCd = ?1, d.dispatchTypeName = ?2 WHERE d.dispatchTypeCd = ?3")
	void updateDispatchType(String newdispatch_type_cd, String newdispatch_type_name, String olddispatch_type_cd);
	
}
