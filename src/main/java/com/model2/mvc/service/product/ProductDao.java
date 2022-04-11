package com.model2.mvc.service.product;

import java.util.List;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Book;
import com.model2.mvc.service.domain.Product;


public interface ProductDao {
	
	public void addProduct(Product product) throws Exception;

	public Product getProduct(int prodNo) throws Exception;

	public List<Product> getProductList(Search search) throws Exception;
	
	public void updateProduct(Product product) throws Exception;
	
	// 게시판 Page 처리를 위한 전체Row(totalCount)  return
	public int getTotalCount(Search search) throws Exception ;
	
	public Product findLastProduct() throws Exception;
	
	public void requestProduct(Book book) throws Exception;
	
	public List<Product> getRequestList(Search search) throws Exception;
	
	public int getRequestTotalCount(Search search) throws Exception ;
	
	public Book getRequest(int bookNo) throws Exception;	
	
	public void doneRequest(Book book) throws Exception;
	
}