package com.model2.mvc.service.product.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Book;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductDao;

@Repository("productDaoImpl")
public class ProductDaoImpl implements ProductDao {
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public ProductDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addProduct(Product product) throws Exception {
		sqlSession.insert("ProductMapper.addProduct", product);
	}

	public Product getProduct(int prodNo) throws Exception {
		return sqlSession.selectOne("ProductMapper.getProduct", prodNo);
	}

	public List<Product> getProductList(Search search) throws Exception {
		return sqlSession.selectList("ProductMapper.getProductList", search);
	}

	public void updateProduct(Product product) throws Exception {
		sqlSession.update("ProductMapper.updateProduct", product);
	}

	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("ProductMapper.getTotalCount", search);
	}
	
	public Product findLastProduct() throws Exception {
		return sqlSession.selectOne("ProductMapper.findLastProduct");
	}
	
	public void requestProduct(Book book) throws Exception {
		sqlSession.insert("ProductMapper.requestProduct", book);
	}
	
	public List<Product> getRequestList(Search search) throws Exception {
		return sqlSession.selectList("ProductMapper.getRequestList", search);
	}
	
	public int getRequestTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("ProductMapper.getRequestTotalCount", search);
	}
	
	public Book getRequest(int bookNo) throws Exception {
		return sqlSession.selectOne("ProductMapper.getRequest", bookNo);
	}
	
	public void doneRequest(Book book) throws Exception{
		sqlSession.update("ProductMapper.doneRequest", book);
	}
}
