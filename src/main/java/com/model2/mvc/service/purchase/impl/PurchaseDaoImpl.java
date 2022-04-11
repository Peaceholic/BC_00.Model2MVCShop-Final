package com.model2.mvc.service.purchase.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseDao;

@Repository("purchaseDaoImpl")
public class PurchaseDaoImpl implements PurchaseDao {

	/// Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public PurchaseDaoImpl() {
		System.out.println(this.getClass());
	}

	public void addPurchase(Purchase purchase) throws Exception {
		sqlSession.insert("PurchaseMapper.addPurchase", purchase);
	}

	public Purchase getPurchaseByTran(int tranNo) throws Exception {
		return sqlSession.selectOne("PurchaseMapper.getPurchaseByTran", tranNo);
	}

	public Purchase getPurchaseByProd(int prodNo) throws Exception {
		return sqlSession.selectOne("PurchaseMapper.getPurchaseByProd", prodNo);
	}

	public void updatePurchase(Purchase purchase) throws Exception {
		sqlSession.update("PurchaseMapper.updatePurchase", purchase);
	}

	public void updateTranCode(Purchase purchase) throws Exception {
		sqlSession.update("PurchaseMapper.updateTranCode", purchase);
	}		

	public List<Purchase> getPurchaseList(Map map) throws Exception {
		return sqlSession.selectList("PurchaseMapper.getPurchaseList", map);
	}
	
	public int getTotalCount(Map map) throws Exception {
		return sqlSession.selectOne("PurchaseMapper.getTotalCount", map);
	}	
}