package ph.com.qkc.service;

import java.util.List;

import ph.com.qkc.model.Branch;
import ph.com.qkc.model.DispatchType;
import ph.com.qkc.model.RawMaterial;
import ph.com.qkc.model.Sku;

public interface MaintenanceService {

	public List<Branch> getBranches();
	public List<RawMaterial> getRawMaterials();
	public List<DispatchType> getDispatchTypes();
	public List<Sku> getSkus();
	
	
	public void addBranch(Branch branch);
	public void editBranch(Branch branch);
	public Branch getBranchByBranchId(Integer branch_id);
	public void deleteBranchByBranchId(Integer branch_id);
	
	public void addDispatchType(DispatchType dispatchtype);
	public void editDispatchType(String newdispatch_type_cd, String newdispatch_type_name, String olddispatch_type_cd);
	public void deleteDispatchTypeByDispTypCd(String dispatch_type_cd);
	
	public void addRawMaterial(RawMaterial rawmaterial);
	public void editRawMaterial(String newmaterial_cd, String newmaterial_name, String newunit_of_measurement, String oldmaterial_cd);
	public void deleteRawMaterialByRawMatCd(String material_cd);
	
	public void addSku(Sku sku);
	public void editSku(String newsku_cd, String newsku_name, String newunit_of_measurement, String oldsku_cd);
	public void deleteSkuBySkuCd(String sku_cd);
	
	
	
}
