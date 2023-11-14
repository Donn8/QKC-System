package ph.com.qkc.service;

import java.util.List;

import ph.com.qkc.model.Fpl;
import ph.com.qkc.model.CurrentInventoryProducts;

public interface FplService {

	public List<Fpl> getFpl();
	
	public List<Fpl> findByDateFinishedBetween(Integer branch_id, String fromDate, String toDate);
	
	public List<CurrentInventoryProducts> findCurrentInventoryProducts(Integer branch_id);

	public List<Fpl> getFplByBranchId(Integer branchID);
	public void addFinishedProduct(Fpl fpl);
}
