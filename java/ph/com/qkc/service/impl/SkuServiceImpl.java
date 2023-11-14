package ph.com.qkc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ph.com.qkc.model.Sku;
import ph.com.qkc.repository.SkuRepository;
import ph.com.qkc.service.SkuService;

@Service
public class SkuServiceImpl implements SkuService {

	@Autowired
	private SkuRepository skuRepo;
	
	@Override
	public List<Sku> getSkuList() {
		return skuRepo.findAll();
	}

}
