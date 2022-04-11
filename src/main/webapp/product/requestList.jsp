<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<% System.out.println("* [ requestlist.jsp ] "); %>

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



function fncGetRequestList(currentPage) {
	$("#currentPage").val(currentPage)
   	$("form").attr("method" , "POST").attr("action" , "/product/listRequest").submit();
}

$(function() {
	
	$("body").on("click","#getBookNo",function (e) {
		self.location ="/product/getRequest?bookNo="+$(this).attr("data-bookNo");	 
	});
	
	$("body").on("click","#makeitdone",function (e) {
		self.location ="/product/registerProduct?bookNo="+$(this).attr("data-bookNo");
	});
		
	$( "td:nth-child(1)" ).css("color" , "red");
		
});

	
$(function() {
	 console.log($(  "td:nth-child(7)" ));

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
			<h3>요청 목록</h3>
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
            		<th align="center">요청번호</th>
            		<th align="center">요청일자</th>          			
            		<th align="left">제목</th>
           			<th align="left">저자</th>
           			<th align="center">처리내용</th>
           			<th align="center" >완료처리일자</th>
         		 </tr>
       		</thead>
       		
       		<tbody>
       		
       		<c:set var="i" value="0" />
		  		<c:forEach var="book" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<tr>
			  			<td align="left" id="getBookNo" data-bookNo="${book.bookNo}">
			  				${book.bookNo}							
						</td>					
						<td align="left">${book.reqDate}</td>
						<td align="left">${book.title}</td>
						<td align="left">${book.authors}</td>
						<td align="left">
				
							<c:choose>
								<c:when test="${book.requestNo == '0'}"> 
									접수완료&nbsp;&nbsp;
									<c:if test="${book.requestNo == '0'}">											
											<span id="makeitdone" align="left" data-bookNo="${book.bookNo}">[ 요청승인 ]</span>									
									</c:if>	
								</c:when>				
								<c:otherwise>
									처리완료
								</c:otherwise>
							</c:choose>				
						
						</td>
						<td align="left">${book.doneDate}</td>
					
						<td>
			  				<input type="hidden" value="${book.bookNo}">
			  			</td>
					</tr>
          		</c:forEach>
        	</tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_newRequest.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>
	