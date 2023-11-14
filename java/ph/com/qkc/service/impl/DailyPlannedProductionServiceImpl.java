package ph.com.qkc.service.impl;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ph.com.qkc.model.DailyPlannedProduction;
import ph.com.qkc.repository.DailyPlannedProductionRepository;
import ph.com.qkc.service.DailyPlannedProductionService;

@Service
public class DailyPlannedProductionServiceImpl implements DailyPlannedProductionService {

	@Autowired
	DailyPlannedProductionRepository dppRepo;

	@Override
	public DailyPlannedProduction getLatestDppId() {
		return dppRepo.findLatestDppId();
	}

	@Override
	public List<DailyPlannedProduction> getDppListByBranchId(Integer branch_id) {
		return dppRepo.findDppListByBranchId(branch_id);
	}

	@Override
	public DailyPlannedProduction addDppList(DailyPlannedProduction dpp) {
		return dppRepo.save(dpp);
	}
	@Override
	public List<DailyPlannedProduction> getDppListByProductionDateAndBranchId(Integer branch_id, String fromDate, String toDate) {
		return dppRepo.getDppListByProductionDateAndBranchId(branch_id, fromDate, toDate);
	}

	@Override
	public void deleteProductionPlanById(Integer dppId) {
		dppRepo.deleteById(dppId);
		
	}

	@Override
	public DailyPlannedProduction getDppByDppId(Integer dppId) {
		return dppRepo.findById(dppId).get();
	}

	@Override
	public void updateDppStatus(DailyPlannedProduction dpp) {
		dppRepo.save(dpp);
	}

	@Override
	public void updateDppList(DailyPlannedProduction dpp) {
		dppRepo.save(dpp);
		
	}
	

}
