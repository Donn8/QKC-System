package ph.com.qkc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ph.com.qkc.model.CurrentInventoryProducts;
import ph.com.qkc.model.Fpl;
import ph.com.qkc.repository.FplRepository;
import ph.com.qkc.service.FplService;

@Service
public class FplServiceImpl implements FplService {

	@Autowired
	private FplRepository fplRepo;
	
	@Override
	public List<Fpl> getFpl() {
		return fplRepo.findAll();
	}

	@Override
	public List<Fpl> findByDateFinishedBetween(Integer branch_id, String fromDate, String toDate) {

		return fplRepo.getFplByDateFinishedBetween(branch_id, fromDate, toDate);
	}

	@Override
	public List<CurrentInventoryProducts> findCurrentInventoryProducts(Integer branch_id) {
		return fplRepo.findCurrentInventoryProducts(branch_id);
	}
	@Override
	public List<Fpl> getFplByBranchId(Integer branchID) {
		return fplRepo.findFplByBranchId(branchID);
	}

	@Override
	public void addFinishedProduct(Fpl fpl) {
		fplRepo.save(fpl);
	}
}
