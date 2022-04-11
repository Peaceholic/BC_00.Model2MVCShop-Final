<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
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
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
           margin-top: 70px;
        }
    </style>

    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

	// 구매
	 $(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( "button.btn.btn-primary" ).on("click" , function() {
			self.location = "/purchase/addPurchaseView?prod_no=${product.prodNo}"
		});
	});	
	
	
	// 이전
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[href='#' ]").on("click" , function() {
			$(self.location).attr("href","/product/listProduct?menu=search");
		});
	});	
				

	</script>		
	    
</head>

<body>


	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	    	<h1 class="text-info">상품 상세 조회</h1>
	    </div>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		
			<div class="row">
	  			<div class="col-xs-4 col-md-2"><strong>도서 번호</strong></div>
				<div class="col-xs-8 col-md-4">${product.prodNo}</div>
			</div>
			
			<hr/>
			
			<div class="row">
	  			<div class="col-xs-4 col-md-2"><strong>도서 제목</strong></div>
				<div class="col-xs-8 col-md-4">${product.prodName}</div>
			</div>
			
			<hr/>
			
			<div class="row">
	  			<div class="col-xs-4 col-md-2"><strong>도서 상세정보</strong></div>
				<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
			</div>
			
			<hr/>
			
			<div class="row">
	  			<div class="col-xs-4 col-md-2"><strong>도서 출판일자</strong></div>
				<div class="col-xs-8 col-md-4">${product.manuDate}</div>
			</div>
			
			<hr/>
			
			<div class="row">
	  			<div class="col-xs-4 col-md-2"><strong>도서 판매가격</strong></div>
				<div class="col-xs-8 col-md-4">${product.price}</div>
			</div>
			
			<hr/>
			
			<div class="row">
	  			<div class="col-xs-4 col-md-2"><strong>도서 이미지</strong></div>
				<img src="/images/uploadFiles/${product.fileName}" />
			</div>
			
			<hr/>
			

		  
		  <div class="form-group">
		    <label for="sale" class="col-sm-offset-1 col-sm-3 control-label"></label>
		    <div class="col-sm-4">
		      <c:if test="${product.proTranCode > '0'}">		
					판매완료된 상품입니다.
				</c:if>	
		    </div>
		  </div>		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		       
		    	<c:if test="${ empty product.proTranCode || product.proTranCode == '0'}">		
					<button type="button" class="btn btn-primary"  >구매&nbsp;하기</button>
				</c:if>	
				
			  <a class="btn btn-primary btn" href="#" role="button">상품&nbsp;목록</a>

		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>