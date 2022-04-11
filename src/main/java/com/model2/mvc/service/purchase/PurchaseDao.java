package com.model2.mvc.service.purchase;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;

public interface PurchaseDao {

	public void addPurchase(Purchase purchase) throws Exception; 

	public Purchase getPurchaseByTran(int tranNo) throws Exception;
	
	public Purchase getPurchaseByProd(int prodNo) throws Exception; 

	public void updatePurchase(Purchase purchase) throws Exception; 

	public void updateTranCode(Purchase purchase) throws Exception; 
	
	public List<Purchase> getPurchaseList(Map map) throws Exception;
	
	public int getTotalCount(Map map) throws Exception; 
	
		
}