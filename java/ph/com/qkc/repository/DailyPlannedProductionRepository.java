package ph.com.qkc.repository;



import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import ph.com.qkc.model.DailyPlannedProduction;


public interface DailyPlannedProductionRepository extends JpaRepository<DailyPlannedProduction, Integer> {
	
	
	@Query("FROM DailyPlannedProduction d WHERE d.dpp_id = (SELECT MAX(dpp_id) FROM DailyPlannedProduction)")
	DailyPlannedProduction findLatestDppId();
	
	@Query("FROM DailyPlannedProduction d WHERE d.branch.branchId = ?1 ORDER BY d.dpp_id")
	List<DailyPlannedProduction> findDppListByBranchId(Integer branch_id);
	
	@Query(value ="SELECT * FROM grp2_daily_planned_production WHERE branch_id = :branchId "
			+ "AND TO_DATE(production_date, 'MM-DD-YYYY HH24:MI:SS') >= TO_DATE(:fromDate, 'YYYY-MM-DD') "
			+ "AND TO_DATE(production_date, 'MM-DD-YYYY HH24:MI:SS') <= TO_DATE(:toDate, 'YYYY-MM-DD')", nativeQuery = true)
    List<DailyPlannedProduction> getDppListByProductionDateAndBranchId(@Param("branchId")Integer branch_id, @Param("fromDate") String fromDate, @Param("toDate") String toDate);

}
