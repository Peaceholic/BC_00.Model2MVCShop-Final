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
 		body {
            padding-top : 50px;
        }
    </style>
         
	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

	// 확인
	 $(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( "button.btn.btn-primary" ).on("click" , function() {
			self.location = "/product/listRequest"
		});
	});	
	
	
	// 추가등록
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[href='#' ]").on("click" , function() {
			self.location = "/main.jsp"
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
	       <h3 class=" text-info">상품요청 결과</h3>
	       <h5 class="text-muted">상품요청이 접수대기 상태입니다. <strong class="text-danger">관리자 승인까지 하루가 소요됩니다.</strong></h5>
	    </div>
	    	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>요청 번호</strong></div>
			<div class="col-xs-8 col-md-4">${book.bookNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>처리 상태</strong></div>	  		
	  		<div class="col-xs-8 col-md-4">
    			<c:if test="${ book.requestNo == '0' }"> 	
    				요청접수완료
    			</c:if>
    			<c:if test="${ book.requestNo == '1' }"> 	
    				요청접수완료
    			</c:if>
    		</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>접수요청 일자</strong></div>
			<div class="col-xs-8 col-md-4">${book.reqDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>처리완료 일자</strong></div>
			<div class="col-xs-8 col-md-4">${book.doneDate}</div>
		</div>
		
		<hr/>
				
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>도서 제목</strong></div>
			<div class="col-xs-8 col-md-4">${book.title}</div>
		</div>
				
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>도서 내용</strong></div>
			<div class="col-xs-8 col-md-4">${book.contents}</div>
		</div>
				
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>도서정보 상세링크</strong></div>
			<div class="col-xs-8 col-md-4">${book.url}</div>
		</div>
		
		<hr/>
				
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>도서 ISBN</strong></div>
			<div class="col-xs-8 col-md-4">${book.isbn}</div>
		</div>
				
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>도서 출판일자</strong></div>
			<div class="col-xs-8 col-md-4">${book.datetime}</div>
		</div>
				
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>도서 저자</strong></div>
			<div class="col-xs-8 col-md-4">${book.authors}</div>
		</div>
				
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>도서 저자</strong></div>
			<div class="col-xs-8 col-md-4">${book.authors}</div>
		</div>
				
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>도서 출판사</strong></div>
			<div class="col-xs-8 col-md-4">${book.publisher}</div>
		</div>
				
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>도서 번역가</strong></div>
			<div class="col-xs-8 col-md-4">${book.translators}</div>
		</div>
				
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>도서 정가</strong></div>
			<div class="col-xs-8 col-md-4">${book.price}</div>
		</div>
				
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>도서 판매가격</strong></div>
			<div class="col-xs-8 col-md-4">${book.sale_price}</div>
		</div>		
				
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>도서 판매상태</strong></div>
			<div class="col-xs-8 col-md-4">${book.status}</div>
		</div>		
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>도서 표지</strong></div>
			<img src="${book.thumbnail}" />
		</div>
		  		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >확인</button>
			  <a class="btn btn-primary btn" href="#" role="button">추가등록</a>
		    </div>
		  </div>
		
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>