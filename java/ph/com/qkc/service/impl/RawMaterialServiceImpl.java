package ph.com.qkc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ph.com.qkc.model.RawMaterial;
import ph.com.qkc.repository.RawMaterialRepository;
import ph.com.qkc.service.RawMaterialService;

@Service
public class RawMaterialServiceImpl implements RawMaterialService {
	
	@Autowired
	RawMaterialRepository rawMatRepo;
	
	@Override
	public List<RawMaterial> getRawMaterials() {
		// TODO Auto-generated method stub
		return rawMatRepo.findAll();
	}

	@Override
	public void addRawMaterial(RawMaterial rawMaterial) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateRawMaterial(RawMaterial rawMaterial) {
		// TODO Auto-generated method stub
	}


}
