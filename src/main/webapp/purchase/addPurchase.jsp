<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@page import="com.model2.mvc.service.domain.Purchase"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!DOCTYPE html>

<html lang="ko">
<head>

<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
		<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<style>
       body > div.container{
        	margin-top: 70px;
        }
    </style>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
	 $( "#back" ).on("click" , function() {
		 $(self.location).attr("href","/purchase/listPurchase");
	});
});	

</script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	    	<h1 class="text-info">�����Ͻ� ��ǰ�� ���Ű� �Ϸ�Ǿ����ϴ�.</h1>
	    </div>
	
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���� ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.purchaseProd.prodNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>������ ���̵�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.buyer.userId}</div>
		</div>
			
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���� ���</strong></div>
	  		<c:choose>
				<c:when test="${ purchase.paymentOption == '1'}"> 
					<div class="col-xs-8 col-md-4">���ݱ���</div>
				</c:when>
				<c:otherwise>
					<div class="col-xs-8 col-md-4">�ſ뱸��</div>
				</c:otherwise>
			</c:choose>		
		</div>
			
		<hr/>
			
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�޴»�� �̸�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverName}</div>
		</div>
			
		<hr/>
			
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�޴»�� ����ó</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverPhone}</div>
		</div>
			
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>����� �ּ�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyAddr}</div>
		</div>
			
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��� ��û����</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyRequest}</div>
		</div>
			
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��� �������</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyDate}</div>
		</div>
			
		<hr/>
		
		
		<div class="form-group">
	    	<div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" id="back" class="btn btn-primary"  >Ȯ&nbsp;��</button> 
		    </div>
		 </div>
		  		  
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
	
</body>

</html>