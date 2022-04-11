<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<% System.out.println("* [ listPurchase.jsp ] "); %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">

<head>

	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/  -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!-- Bootstrap, jQuery CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
 	<link href="/css/animate.min.css" rel="stylesheet">
  	<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
	<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   	<!-- jQuery UI toolTip 사용 CSS-->
  	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<!-- jQuery UI toolTip 사용 JS-->
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  	<style>
	  body {
            padding-top : 50px;
        }
    </style>
  
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<script type="text/javascript">


function fncGetPurchaseList(currentPage) {
	$("#currentPage").val(currentPage)
   	$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
}

$(function() {
	
	/* $("#tranNo").on("click" , function() {*/
		
	$( "td:nth-child(1)" ).on("click" , function() {
		self.location ="/purchase/getPurchase?tranNo="+$(this).attr("data-tranNo");
	});  
	
	$("#userId").on("click" , function() {
		self.location ="/user/getUser?userId="+$(this).attr("data-userId");
	});  
	
	$("#deliveried").on("click" , function() {
		self.location ="/purchase/updateTranCodeByTran?tranNo="+$(this).attr("data-tranNo")+"&tranCode=" +$(this).attr("data-tranCode");
	}); 
	
	$( "td:nth-child(1)" ).css("color" , "red");
	$( "td:nth-child(3)" ).css("color" , "red");
	
});

	
$(function() {
	 console.log($(  "td:nth-child(7)" ));
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$(  "td:nth-child(7) > i" ).on("mouseover" , function() {
	
		var tranNo =  $(this).next().val();

		$.ajax( 
				{
				url : "/purchase/json/getPurchase/"+tranNo,
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData , status) {

				var displayValue = "<h6>"
								+" 배송주소 : "+(JSONData.divyAddr == null ? "" : JSONData.divyAddr)+"<br/>"							
								+" 배송일자 : "+(JSONData.divyDate == null ? "" : JSONData.divyDate)+"<br/>"
								+" 요청사항 : "+(JSONData.divyRequest == null ? "" : JSONData.divyRequest)+"<br/>"
								+" 구매일자 : "+(JSONData.orderDate == null ? "" : JSONData.orderDate)+"<br/>"								
								+" 구매방법 : "+(JSONData.paymentOption == 1 ? "현금구매" : "신용구매")+"<br/>"
								+" 도서정보 : "+(JSONData.purchaseProd.prodName == null ? "" : JSONData.purchaseProd.prodName)+"<br/>"				
								+" 받는사람 : "+(JSONData.receiverName == null ? "" : JSONData.receiverName)+"<br/>"
								+" 연락처&nbsp; : "+(JSONData.receiverPhone == null ? "" : JSONData.receiverPhone)+"<br/>"
								+"</h6>";
							$("h6").remove();
							$( "#"+tranNo+"" ).html(displayValue);
			}
	});
});
	
	//==> userId LINK Event End User 에게 보일수 있도록 
	$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
	$("h7").css("color" , "blue");

	//==> 아래와 같이 정의한 이유는 ??				
	$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");		
	
});

	</script>

</head>

<body>

	<!-- ToolBar Start -->
	<jsp:include page="/layout/toolbar.jsp" />
	
	<!-- 화면구성 div Start -->
	<div class="container">
		<div class="page-header text-info">
			<h3>구매 목록</h3>
	    </div>
	    
	    <!-- table 위쪽 Start -->
	    <div class="row">
	    
	    <div class="col-md-6 text-left">
			<p class="text-primary">
		    	전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    </p>
		</div>
		
		<div class="col-md-6 text-right">
			<form class="form-inline" name="detailForm">
			    		  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
			</form>
	    </div>
	    
	    </div>
	    
	    <!-- table Start -->
		<table class="table table-hover table-striped" >
      
			<thead>
				<tr>
            		<th align="center">거래번호</th>
            		<th align="center">회원ID</th>
          			<th align="left" >회원명</th>
            		<th align="left">전화번호</th>
           			<th align="left">배송현황</th>
          			<th align="left">상세정보보기</th>
         		 </tr>
       		</thead>
       		
       		<tbody>
       		
       		<c:set var="i" value="0" />
		  		<c:forEach var="purchase" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<tr>
			  			<td align="left" id="tranNo" data-tranNo="${purchase.tranNo}">
							<%-- <a href="/purchase/getPurchase?tranNo=${purchase.tranNo}">${purchase.tranNo}</a> --%>
							${purchase.tranNo}							
						</td>
						<input type="hidden" name="prodNo" value="${purchase.tranNo}">
					
						<td align="left" id="userId" data-userId="${user.userId}">
							${user.userId}
							<span id= "${purchase.tranNo}" ></span>
							
						</td>
						<td align="left">${purchase.receiverName}</td>
						<td align="left">${purchase.receiverPhone}</td>
						<td align="left">
				
							<c:choose>
								<c:when test="${purchase.tranCode == '1'}"> 
									구매완료
								</c:when>
								<c:when test="${purchase.tranCode == '2'}"> 
									배송중&nbsp;&nbsp;
									<c:if test="${purchase.tranCode == '2'}">		
										<span id="deliveried" align="left" data-tranNo="${purchase.tranNo}" data-tranCode="3">[ 물건도착 ]</span>
									</c:if>	
								</c:when>				
								<c:otherwise>
									배송완료
								</c:otherwise>
							</c:choose>				
						
						</td>
					
						<td>
			  				<i class="glyphicon glyphicon-ok"></i>
			  				<input type="hidden" value="${purchase.tranNo}">
			  			</td>
					</tr>
          		</c:forEach>
        	</tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_newPurchase.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>
	