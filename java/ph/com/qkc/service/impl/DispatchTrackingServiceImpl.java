package ph.com.qkc.service.impl;

import org.springframework.stereotype.Service;

import ph.com.qkc.repository.DispatchTrackingRepository;
import ph.com.qkc.repository.FplRepository;
import ph.com.qkc.repository.SkuRepository;
import ph.com.qkc.model.DispatchTracking;
import ph.com.qkc.model.UniqueSku;
import ph.com.qkc.service.DispatchTrackingService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

@Service
public class DispatchTrackingServiceImpl implements DispatchTrackingService {

	@Autowired
	DispatchTrackingRepository dispTrackRepo;

	@Autowired
	SkuRepository SkuRepo;

	@Autowired
	FplRepository FplRepo;

	@Override
	public List<DispatchTracking> getAllDispatchTrackings() {
		return dispTrackRepo.findAll();
	}

	@Override
	public Integer addDispatchTracking(DispatchTracking dispatch) {
		dispTrackRepo.save(dispatch);
		return 0;
	}

	@Override
	public Integer updateDispatchTracking(DispatchTracking dispatch) {
		dispTrackRepo.save(dispatch);
		return 0;
	}

	@Override
    public Integer deleteDispatchTracking(DispatchTracking dispatchTracking) {
        dispTrackRepo.delete(dispatchTracking);
        return 0;
    }
	  

	@Override
	public DispatchTracking findDispatchById(Integer dispatchTrackingId) {
		return dispTrackRepo.findById(dispatchTrackingId).orElse(null);
	}

	@Override
	public List<DispatchTracking> findAllOrderedById(Integer branchId) {
        return dispTrackRepo.findAllOrderedById(branchId);
    }
	
	public void deleteDispList(Integer dispatchTrackingId) {
		dispTrackRepo.deleteById(dispatchTrackingId);
	}
	
	@Override
	public List<UniqueSku> findUniqueSku(Integer branch_id) {
		return dispTrackRepo.findUniqueSku(branch_id);
	}
	

}