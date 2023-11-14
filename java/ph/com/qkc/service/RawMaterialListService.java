package ph.com.qkc.service;

import java.util.List;

import ph.com.qkc.model.CurrentRawMaterialInventory;
import ph.com.qkc.model.RawMaterialList;
import ph.com.qkc.model.UniqueRawMaterial;

public interface RawMaterialListService {

	public List<RawMaterialList> getRawMaterialList();
	public List<RawMaterialList> getRawMaterialListByBranchId(Integer branch_id);
	public List<RawMaterialList> getRmlByDateReceivedAndBranchId(Integer branch_id, String fromDate, String toDate);
	public List<UniqueRawMaterial> getUniqueRawMaterialByBranchId(Integer branch_id);
	public List<CurrentRawMaterialInventory> findCurrentRmInventoryByBranchId(Integer branch_id);
	
	public void addRawMaterialList(RawMaterialList rawMaterialList);
	
	public RawMaterialList getExistRawMaterialListById(Integer materialListId);
	public void updateRawMaterialList(RawMaterialList rawMaterialList);
	
	public void deleteRawMaterialList(Integer delmaterialListId);
}
