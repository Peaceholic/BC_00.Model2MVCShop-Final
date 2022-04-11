package com.model2.mvc.service.product;

import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Book;
import com.model2.mvc.service.domain.Product;


public interface ProductService {
	
	public void addProduct(Product product) throws Exception;

	public Product getProduct(int prodNo) throws Exception;

	public Map<String,Object> getProductList(Search search) throws Exception;

	public void updateProduct(Product product) throws Exception;
	
	public Product findLastProduct() throws Exception;
	
	public void requestProduct(Book book) throws Exception;
	
	public Map<String,Object> getRequestList(Search search) throws Exception;
	
	public Book getRequest(int bookNo) throws Exception;
	
	public void doneRequest(Book book) throws Exception;
	
}