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
		 $(self.location).attr("href","/purchase/updatePurchaseView?tranNo=${purchase.tranNo}");
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
	    	<h1 class="text-info">구매 상세정보</h1>
	    </div>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>도서 번호</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.purchaseProd.prodNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매자 아이디</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.buyer.userId}</div>
		</div>
			
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매 방법</strong></div>
	  		<c:choose>
				<c:when test="${ purchase.paymentOption == '1'}"> 
					<div class="col-xs-8 col-md-4">현금구매</div>
				</c:when>
				<c:otherwise>
					<div class="col-xs-8 col-md-4">신용구매</div>
				</c:otherwise>
			</c:choose>		
		</div>
			
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>받는사람 이름</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverName}</div>
		</div>
			
		<hr/>
			
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>받는사람 연락처</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverPhone}</div>
		</div>
			
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>배송지 주소</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyAddr}</div>
		</div>
			
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>배송 요청사항</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyRequest}</div>
		</div>
			
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>배송 희망일자</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyDate}</div>
		</div>
			
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매 일자</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.orderDate}</div>
		</div>
			
		<hr/>
		
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" id="send" class="btn btn-primary"  >수&nbsp;정</button>
		      <button type="button" id="back" class="btn btn-primary"  >확&nbsp;인</button>			  
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>
