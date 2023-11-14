package ph.com.qkc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ph.com.qkc.repository.BranchRepository;
import ph.com.qkc.repository.DispatchTypeRepository;
import ph.com.qkc.repository.RawMaterialRepository;
import ph.com.qkc.repository.SkuRepository;

import ph.com.qkc.model.Branch;
import ph.com.qkc.model.DispatchType;
import ph.com.qkc.model.RawMaterial;
import ph.com.qkc.model.Sku;
import ph.com.qkc.service.MaintenanceService;

@Service
public class MaintenanceServiceImpl implements MaintenanceService {
	
	@Autowired
	BranchRepository branchRepo;
	
	@Autowired
	DispatchTypeRepository dtRepo;
	
	@Autowired
	RawMaterialRepository rmRepo;
	
	@Autowired
	SkuRepository skuRepo;

	@Override
	public List<Branch> getBranches() {
		// TODO Auto-generated method stub
		return branchRepo.findAll();
	}

	@Override
	public List<RawMaterial> getRawMaterials() {
		// TODO Auto-generated method stub
		return rmRepo.findAll();
	}

	@Override
	public List<DispatchType> getDispatchTypes() {
		// TODO Auto-generated method stub
		return dtRepo.findAll();
	}

	@Override
	public List<Sku> getSkus() {
		// TODO Auto-generated method stub
		return skuRepo.findAll();
	}
	
	
	@Override
	public void addBranch(Branch branch) {
		branchRepo.save(branch);
	}
	
	
	@Override
	public void editBranch(Branch branch) {
		branchRepo.save(branch);
		
	}
	@Override
	public Branch getBranchByBranchId(Integer branch_id) {
		return branchRepo.findById(branch_id).get();
	}
	
	@Override
	public void deleteBranchByBranchId(Integer branch_id) {
		branchRepo.deleteById(branch_id);
	}


	@Override
	public void addDispatchType(DispatchType dispatchtype) {
		dtRepo.save(dispatchtype);
	}

	@Override
	public void editDispatchType(String newdispatch_type_cd, String newdispatch_type_name,
			String olddispatch_type_cd) {
		dtRepo.updateDispatchType(newdispatch_type_cd, newdispatch_type_name, olddispatch_type_cd);
	}
	
	@Override
	public void deleteDispatchTypeByDispTypCd(String dispatch_type_cd) {
		dtRepo.deleteById(dispatch_type_cd);
	}


	@Override
	public void addRawMaterial(RawMaterial rawmaterial) {
		rmRepo.save(rawmaterial);
	}

	@Override
	public void editRawMaterial(String newmaterial_cd, String newmaterial_name, String newunit_of_measurement, String oldmaterial_cd) {
		rmRepo.updateRawMaterial(newmaterial_cd, newmaterial_name, newunit_of_measurement, oldmaterial_cd);
	}
	
	@Override
	public void deleteRawMaterialByRawMatCd(String material_cd) {
		rmRepo.deleteById(material_cd);
	}

	@Override
	public void addSku(Sku sku) {
		skuRepo.save(sku);
	}

	@Override
	public void editSku(String newsku_cd, String newsku_name, String newunit_of_measurement, String oldsku_cd) {
		skuRepo.updateSku(newsku_cd, newsku_name, oldsku_cd);
	}
	
	@Override
	public void deleteSkuBySkuCd(String sku_cd) {
		skuRepo.deleteById(sku_cd);
	}
	
	
}
