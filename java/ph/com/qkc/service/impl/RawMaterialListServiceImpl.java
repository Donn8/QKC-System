package ph.com.qkc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ph.com.qkc.model.CurrentRawMaterialInventory;
import ph.com.qkc.model.RawMaterialList;
import ph.com.qkc.model.UniqueRawMaterial;
import ph.com.qkc.repository.RawMaterialListRepository;
import ph.com.qkc.service.RawMaterialListService;

@Service
public class RawMaterialListServiceImpl implements RawMaterialListService {
	
	@Autowired
	RawMaterialListRepository rawMatListRepo;

	@Override
	public List<RawMaterialList> getRawMaterialList() {
		return rawMatListRepo.findAll();
	}
	
	@Override
	public List<RawMaterialList> getRawMaterialListByBranchId(Integer branch_id) {
		return rawMatListRepo.findAllByBranchId(branch_id);
	}

	@Override
	public void addRawMaterialList(RawMaterialList rawMaterialList) {
		rawMatListRepo.save(rawMaterialList);
		
	}

	@Override
	public void updateRawMaterialList(RawMaterialList rawMaterialList) {
		rawMatListRepo.save(rawMaterialList);
	
	}

	@Override
	public RawMaterialList getExistRawMaterialListById(Integer materialListId) {
		return rawMatListRepo.findById(materialListId).get();
	}

	@Override
	public void deleteRawMaterialList(Integer delmaterialListId) {
		rawMatListRepo.deleteById(delmaterialListId);
		
	}

	@Override
	public List<UniqueRawMaterial> getUniqueRawMaterialByBranchId(Integer branch_id) {
		return rawMatListRepo.findUniqueRawMaterialByBranchId(branch_id);
	}

	@Override
	public List<RawMaterialList> getRmlByDateReceivedAndBranchId(Integer branch_id, String fromDate, String toDate) {
		// TODO Auto-generated method stub
		return rawMatListRepo.getRmlByDateReceivedBetween(branch_id, fromDate, toDate);
	}

	@Override
	public List<CurrentRawMaterialInventory> findCurrentRmInventoryByBranchId(Integer branch_id) {
		return rawMatListRepo.findCurrentRmInventoryByBranchId(branch_id);
	}

}
