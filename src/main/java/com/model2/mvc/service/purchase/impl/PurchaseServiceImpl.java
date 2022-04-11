package com.model2.mvc.service.purchase.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.purchase.PurchaseDao;

@Service("purchaseServiceImpl")
public class PurchaseServiceImpl implements PurchaseService {
	
	@Autowired
	@Qualifier("purchaseDaoImpl")
	private PurchaseDao purchaseDao;

	public void setPurchaseDao(PurchaseDao purchaseDao) {
		this.purchaseDao = purchaseDao;
	}
	
	public PurchaseServiceImpl() {
		System.out.println(this.getClass());
	}		

	public void addPurchase(Purchase purchase) throws Exception {
		purchaseDao.addPurchase(purchase);
	}

	public Map<String, Object> getPurchaseList(Map map) throws Exception {
		List<Purchase> list= purchaseDao.getPurchaseList(map);
		int totalCount = purchaseDao.getTotalCount(map);
			
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", list );
		result.put("totalCount", new Integer(totalCount));
		
		return result;
	}
	
	public Purchase getPurchaseByTran(int tranNo) throws Exception {
		return purchaseDao.getPurchaseByTran(tranNo);
	}
	
	public Purchase getPurchaseByProd(int prodNo) throws Exception {
		return purchaseDao.getPurchaseByProd(prodNo);
	}
	
	public void updatePurchase(Purchase purchase) throws Exception {
		purchaseDao.updatePurchase(purchase);
	}
	
	public void updateTranCode(Purchase purchase) throws Exception {
		purchaseDao.updateTranCode(purchase);
	}
	
	
}