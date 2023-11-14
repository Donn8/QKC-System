package ph.com.qkc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ph.com.qkc.model.DispatchType;
import ph.com.qkc.repository.DispatchTypeRepository;
import ph.com.qkc.service.DispatchTypeService;

@Service
public class DispatchTypeServiceImpl implements DispatchTypeService {
	
	@Autowired
	DispatchTypeRepository dispatchTypeRepo;
	
	@Override
	public List<DispatchType> getAllDispatchTypes() {
		return dispatchTypeRepo.findAll();
	}

	
}
