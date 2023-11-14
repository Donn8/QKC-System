package ph.com.qkc.service;

import java.util.List;

import ph.com.qkc.model.ProductionMaterial;


public interface ProductionMaterialService {

	public ProductionMaterial addProdMatList(ProductionMaterial pm);
	public List<ProductionMaterial> getPmByDppId(Integer dppId);
	public void delPrevListByDppId(Integer dppId);
	
}
