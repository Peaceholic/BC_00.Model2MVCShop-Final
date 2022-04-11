package com.model2.mvc.service.purchase;

import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;


public interface PurchaseService {

	public void addPurchase(Purchase purchase) throws Exception;
	
	public Purchase getPurchaseByTran(int tranNo) throws Exception;
	
	public Purchase getPurchaseByProd(int prodNo) throws Exception;
	
	public Map<String,Object> getPurchaseList(Map map) throws Exception;
	
	public void updatePurchase(Purchase purchase) throws Exception;
	
	public void updateTranCode(Purchase purchase) throws Exception;	
		
}