<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
<head>

<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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

<script type="text/javascript" src="../javascript/calendar.js"></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">


$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
	 $("#send" ).on("click" , function() {
		 $("form").attr("method" , "POST").attr("action" , "/purchase/updatePurchase").submit();
	});

	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
	 $( "#back" ).on("click" , function() {
		 $(self.location).attr("href","/purchase/listPurchase");
	});
});	

</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script>
  $( function() {
    $( "#divyDate" ).datepicker({
    	showOn: "button",
        dateFormat: 'yy-mm-dd',
        buttonImage: "../images/ct_icon_date.gif",
        buttonImageOnly: true
    });
  } );
</script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">구매정보 수정</h3>
	       <h5 class="text-muted">확인을 누르시면 선택하신 <strong class="text-danger">구매정보가 수정됩니다.</strong></h5>
	    </div>

		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		<input type="hidden" value="${purchase.tranNo}" name="tranNo">
		
		  <div class="form-group">
		    <label for="purchaseProd.prodNo" class="col-sm-offset-1 col-sm-3 control-label">도서번호</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="purchaseProd.prodNo" name="purchaseProd.prodNo" value="${purchase.purchaseProd.prodNo}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="buyer.userId" class="col-sm-offset-1 col-sm-3 control-label">구매자ID</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="buyer.userId" name="buyer.userId" value="${user.userId}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
		    <div class="col-sm-4">			   					
		   			 <c:choose>
						<c:when test="${purchase.paymentOption == '1'}"> 
							<!-- <input type="text" class="form-control" id="paymentOption" name="paymentOption" value="현금구매"> -->
							<select  name="paymentOption" 	class="form-control">
								<option value="1" selected="selected">현금구매</option>
								<option value="2">신용구매</option>
							</select>
						</c:when>								
						<c:otherwise>
							<!-- <input type="text" class="form-control" id="paymentOption" name="paymentOption" value="신용구매"> -->
							<select  name="paymentOption" 	class="form-control">
								<option value="1" >현금구매</option>
								<option value="2" selected="selected">신용구매</option>
							</select>
						</c:otherwise>
					</c:choose>		  		
		    </div>
		  </div>
		  		  
		  <div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">받는사람 이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverName" name="receiverName" value="${purchase.receiverName}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">받는사람 연락처</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${purchase.receiverPhone}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">배송 주소</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyAddr" name="divyAddr" value="${purchase.divyAddr}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">배송 요청사항</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyRequest" name="divyRequest" value="${purchase.divyRequest}">
		      <%-- <input type="hidden" name="buyer.userId" value="${user.userId}" /> --%>
		    </div>
		  </div>
		  	  
		  <div class="form-group">
		    <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">배송 희망일자</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyDate" name="divyDate" value="${purchase.divyDate}">
		    </div>
		  </div>
		  

		  		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" id="send" class="btn btn-primary"  >수&nbsp;정</button>
		      <button type="button" id="back" class="btn btn-primary"  >취&nbsp;소</button>			  
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>
