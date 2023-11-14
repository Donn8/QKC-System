package ph.com.qkc.service;

import java.util.Date;
import java.util.List;

import ph.com.qkc.model.DailyPlannedProduction;

public interface DailyPlannedProductionService {

	public DailyPlannedProduction getLatestDppId();
	public List<DailyPlannedProduction> getDppListByBranchId(Integer branch_id); 
	public List<DailyPlannedProduction> getDppListByProductionDateAndBranchId(Integer branch_id, String fromDate, String toDate); 
	public DailyPlannedProduction addDppList(DailyPlannedProduction dpp);
	public DailyPlannedProduction getDppByDppId(Integer dppId);
	public void updateDppStatus(DailyPlannedProduction dpp);
	public void deleteProductionPlanById(Integer dppId);
	public void updateDppList(DailyPlannedProduction dpp);
}
