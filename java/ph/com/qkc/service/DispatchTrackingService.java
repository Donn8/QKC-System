package ph.com.qkc.service;

import java.util.List;

import ph.com.qkc.model.DispatchTracking;
import ph.com.qkc.model.UniqueSku;

public interface DispatchTrackingService {

	public List<DispatchTracking> getAllDispatchTrackings();
	public List<DispatchTracking> findAllOrderedById(Integer branchId);
	public Integer addDispatchTracking(DispatchTracking dispatch);
	public Integer updateDispatchTracking(DispatchTracking dispatch);
	public DispatchTracking findDispatchById(Integer dispatchTrackingId);
	public Integer deleteDispatchTracking(DispatchTracking dispatchTracking);
	public void deleteDispList(Integer deldispatchTrackingId);
	public List<UniqueSku> findUniqueSku(Integer branch_id); // Query for /dispatch
}