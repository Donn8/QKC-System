package ph.com.qkc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ph.com.qkc.model.ProductionMaterial;
import ph.com.qkc.repository.ProductionMaterialRepository;
import ph.com.qkc.service.ProductionMaterialService;

@Service
public class ProductionMaterialServiceImpl implements ProductionMaterialService {

	@Autowired
	private ProductionMaterialRepository prodMatRepo;
	@Override
	public ProductionMaterial addProdMatList(ProductionMaterial pm) {
		return prodMatRepo.save(pm);
	}
	@Override
	public List<ProductionMaterial> getPmByDppId(Integer dppId) {
		return prodMatRepo.findPmByDppId(dppId);
	}
	@Override
	public void delPrevListByDppId(Integer dppId) {
		List<ProductionMaterial> productionMaterials = prodMatRepo.getPmByDppId(dppId);
		prodMatRepo.deleteAll(productionMaterials);
	}
}
