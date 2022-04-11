package com.model2.mvc.service.domain;

import java.sql.Date;

public class Book {
	
	private int bookNo;
	private int requestNo;
	private Date reqDate;
	private Date doneDate;	
	private String title;
	private String contents;
	private String url;
	private String isbn;
	private String datetime;	
	private String authors;
	private String publisher;
	private String translators;
	private String price;
	private String sale_price;
	private String thumbnail;
	private String status;

	public Book() {
		
	}
	
	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}
	
	public int getRequestNo() {
		return requestNo;
	}

	public void setRequestNo(int requestNo) {
		this.requestNo = requestNo;
	}	
	
	public Date getReqDate() {
		return reqDate;
	}

	public void setReqDate(Date reqDate) {
		this.reqDate = reqDate;
	}

	public Date getDoneDate() {
		return doneDate;
	}

	public void setDoneDate(Date doneDate) {
		this.doneDate = doneDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getDatetime() {
		return datetime;
	}

	public void setDatetime(String datetime) {	
		
		if(datetime != null) {
			this.datetime = datetime.substring(0, 10);
		} else {
			this.datetime = datetime;
		}
		
	}

	public String getAuthors() {
		return authors;
	}

	public void setAuthors(String authors) {
		this.authors = authors;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getTranslators() {
		return translators;
	}

	public void setTranslators(String translators) {
		this.translators = translators;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getSale_price() {
		return sale_price;
	}

	public void setSale_price(String sale_price) {
		this.sale_price = sale_price;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	// Override
	public String toString() {
		return "\n -- BookVO --"
				+ "\n [bookNo] : " + bookNo
				+ "\n [requestNo] : " + requestNo
				+ "\n [reqDate] : " + reqDate
				+ "\n [doneDate] : " + doneDate				
				+ "\n [title] : " + title
				+ "\n [contents] : " + contents 
				+ "\n [url] : " + url 
				+ "\n [isbn] : " + isbn 
				+ "\n [datetime] : " + datetime 
				+ "\n [authors] : " + authors 
				+ "\n [publisher] : " + publisher 
				+ "\n [translators] : " + translators 
				+ "\n [price] : " + price
				+ "\n [sale_price] :" + sale_price
				+ "\n [thumbnail] : " + thumbnail
				+ "\n [status] : " + status
				+ "\n ---------------- \n";
	}	
			
}
