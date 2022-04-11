package com.model2.mvc.service.domain;

import java.sql.Date;

public class Product {

	private int prodNo;
	private String prodName;
	private String prodDetail;
	private String manuDate;
	private int price;	
	private String fileName;	
	private Date regDate;
	private String proTranCode;
	
	private String regDateString;

	public Product() {
	}
	
	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public String getProdDetail() {
		return prodDetail;
	}

	public void setProdDetail(String prodDetail) {
		this.prodDetail = prodDetail;
	}

	public String getManuDate() {
		return manuDate;
	}

	public void setManuDate(String manuDate) {
		this.manuDate = manuDate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
		
		if(regDate !=null) {
			// JSON ==> Domain Object  Binding을 위해 추가된 부분
			this.setRegDateString( regDate.toString().split("-")[0]
													+"-"+ regDate.toString().split("-")[1]
													+ "-" +regDate.toString().split("-")[2] );
		}
	
	}

	
	public String getProTranCode() {
		return proTranCode;
	}

	public void setProTranCode(String proTranCode) {
		if (proTranCode == null) {
			this.proTranCode = proTranCode;
		} else {
			this.proTranCode = proTranCode.trim();
		}
	}
	

	// Override
	public String toString() {
		return "\n -- ProductVO --"
				+ "\n [prodNo] : " + prodNo
				+ "\n [prodName] : " + prodName 
				+ "\n [prodDetail] : " + prodDetail
				+ "\n [manuDate] :" + manuDate
				+ "\n [price] : " + price 
				+ "\n [fileName] : " + fileName
				+ "\n [regDate] : " + regDate
				+ "\n [proTranCode] : " + proTranCode				
				+ "\n ---------------- \n";
	}	
	
	public String getRegDateString() {
		return regDateString;
	}

	public void setRegDateString(String regDateString) {
		this.regDateString = regDateString;
	}

}