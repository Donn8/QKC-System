package ph.com.qkc.service;

import java.util.List;

import ph.com.qkc.model.RawMaterial;

public interface RawMaterialService {
	
	public List<RawMaterial> getRawMaterials();
	public void addRawMaterial(RawMaterial rawMaterial);
	public void updateRawMaterial(RawMaterial rawMaterial);
//	public Integer deleteRawMaterial(RawMaterial rawMaterial);

}
