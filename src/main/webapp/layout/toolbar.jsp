<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 	<script type="text/javascript">
   	
   	function history(){
		popWin = window.open("/history.jsp","popWin","left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
	}
	
	function DeveloperWin(){
		alert("저희 비트문고에서는 개발자를 모집하고 있습니다. \n\n연봉은 1억부터 시작합니다.");
		popWin = window.open("http://bftest.wecode.co.kr/","popWin","left=200, top=200, width=1024, height=768, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, location=no, titlebar=no");
	}
	
	function MBTIWin(){
		alert("저희 비트문고에서는 다양한 인재를 모집하고 있습니다. \n\n연봉은 1억부터 시작합니다.");
		popWin = window.open("https://www.16personalities.com/ko/","popWin","left=200, top=200, width=960, height=640, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, location=no");
	}
	
	function Login(){
		$("#userId").focus();

		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("#loginButton").on(
				"click",
				function() {
					var id = $("input:text").val();
					var pw = $("input:password").val();

					if (id == null || id.length < 1) {
						alert('ID 를 입력하지 않으셨습니다.');
						$("#userId").focus();
						return;
					}

					if (pw == null || pw.length < 1) {
						alert('패스워드를 입력하지 않으셨습니다.');
						$("#password").focus();
						return;
					}

					$("form").attr("method", "POST").attr("action",
							"/user/login").attr("target", "_parent").submit();
		});
	}
	
	
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2. $(#id) : 3. $(.className)
	$(function() {	
			
		$("#main").on("click" , function() {
			$(self.location).attr("href","/main.jsp");
		}); 
		
		$("a:contains('로그인')").on("click" , function() {
			
			$('#loginModal').modal('show');
		  	$(function () {
		    	$('[data-toggle="tooltip"]').tooltip()
		  	})
		  	Login();
			
		});
		
		$("a:contains('회원가입')").on("click" , function() {
			$(self.location).attr("href","/user/addUserView.jsp");
		}); 
			
	 	$("a:contains('로그아웃')").on("click" , function() {
			$(self.location).attr("href","/user/logout");
		}); 
	
	 	$("a:contains('회원정보조회')").on("click" , function() {
			self.location = "/user/listUser"
		}); 
		 
		$( "a:contains('개인정보조회')" ).on("click" , function() {
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});
		
	 	$( "a:contains('판매상품등록')" ).on("click" , function() {
	 		$(self.location).attr("href","../product/addProductView.jsp");
		}); 
	 	
	 	$("a:contains('판매상품관리')" ).on("click" , function() {
	 		$(self.location).attr("href","/product/listProduct?menu=manage");
		}); 
	 	
	 	$( "a:contains('상 품 검 색')" ).on("click" , function() {
	 		$(self.location).attr("href","/product/listProduct?menu=search");
		}); 
	 	
	 	$( "a:contains('구매이력조회')" ).on("click" , function() {
	 		$(self.location).attr("href","/purchase/listPurchase");
		}); 
	 	
	 	$( "a:contains('최근 본 상품')" ).on("click" , function() {
	 		history();
		}); 
	 	
	 	$( "a:contains('도서요청 결과')" ).on("click" , function() {
	 		$(self.location).attr("href","/product/listRequest");
		}); 
	 		 	
	 	$("a:contains('개발자채용')").on("click" , function() {
	 		DeveloperWin(); 			
		}); 
	 	
	 	$("a:contains('인재채용')").on("click" , function() {
	 		MBTIWin();
		});
	 	
	});
		
	</script>  
	
	<style>
.navbar.navbar-inverse.navbar-fixed-top {
    background-color: green;
}
	</style>


<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar  navbar-inverse navbar-fixed-top">
	
	<div class="container">
	       
		<a class="navbar-brand" id="main">
			<img src="/images/logo.png" alt="Brand" class="img-rounded" width="100%" align="top"/>
		</a>
		
		<!-- toolBar Button Start //////////////////////// -->
		<div class="navbar-header">
		    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		    </button>
		</div>
		<!-- toolBar Button End //////////////////////// -->
		
	    <!--  dropdown hover Start -->
	    

		<div class="collapse navbar-collapse" id="target" 
	       			data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
	         
	         <!-- Tool Bar 를 다양하게 사용하면.... -->
	         <ul class="nav navbar-nav">
	             
	         	<c:if test="${ !empty user.userId}">
	             
	            	<!--  회원관리 DrowDown -->
	              	<li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >회원관리</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">개인정보조회</a></li>
	                         
	                         <c:if test="${sessionScope.user.role == 'admin'}">
	                         	<li><a href="#">회원정보조회</a></li>
	                         </c:if>                         
	                        
	                     </ul>
	                 </li>
	                 
	              	<!-- 판매상품관리 DrowDown  -->
	               	<c:if test="${sessionScope.user.role == 'admin'}">
		            	<li class="dropdown">
		                	<a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                    	<span >판매상품관리</span>
		                        <span class="caret"></span>
		                    </a>
		                    <ul class="dropdown-menu">
		                        <li><a href="#">판매상품등록</a></li>
		                        <li><a href="#">판매상품관리</a></li>
		                     </ul>
		                </li>
	                 </c:if>
	                 
	            	<!-- 구매관리 DrowDown -->
	            	<li class="dropdown">
	                	<a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                    	<span >상품구매</span>
	                        <span class="caret"></span>
	                    </a>
	                    <ul class="dropdown-menu">
	                        <li><a href="#">상 품 검 색</a></li>
	                         
	                       
	                    	<li><a href="#">구매이력조회</a></li>
	                       
	                         
	                        <li><a href="#">최근 본 상품</a></li>
	                        
	                     </ul>
	                 </li>  
	                 
	                 <li class="dropdown">
		                	<a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                    	<span >도서요청</span>
		                        <span class="caret"></span>
		                    </a>
		                    <ul class="dropdown-menu">
		                        <li><a href="#">도서요청 결과</a></li>
		                    </ul>
		              </li>   
	                
	            </c:if>	
	       </ul>	             
	             
	            <c:if test="${ !empty user.userId}">		
        	   		<ul class="nav navbar-nav navbar-right">
	               		<li><a href="#">로그아웃</a></li>
	            	</ul>
				</c:if>		            
				
				<c:if test="${ empty user.userId}">
	            	<ul class="nav navbar-nav navbar-right">
	                	<li><a href="#">로그인</a></li>
	            	</ul>
	            </c:if>
	             
	            <ul class="nav navbar-nav navbar-right">
	                <li><a href="#">개발자채용</a></li>
	            </ul>
	            
	            <ul class="nav navbar-nav navbar-right">
	                <li><a href="#">인재채용</a></li>
	            </ul>	             
	            
		</div>
		<!-- dropdown hover END -->	       
	    
	</div>
</div>

<!-- login Start -->	
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
 		<div class="modal-dialog modal-dialog-centered" role="document">
    		<div class="modal-content">
      			<div class="modal-header border-bottom-0">
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          				<span aria-hidden="true">×</span>
        			</button>
    			</div>
     		 	<div class="modal-body">
        <div class="form-title text-center">
          <span><img alt="loginimg" src="/images/login.png" width="180" height="90" ></span>
          <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4>
        </div>
       
        <div class="d-flex flex-column text-center">
          	<form>
            	<div class="form-group">
              		<input type="text" class="form-control form-control-color" id="userId" name="userId" placeholder="ID">
            	</div>
            	<div class="form-group">
              		<input type="password" class="form-control" id="password" name="password" placeholder="Password">
            	</div>
           		<button type="button" id="loginButton" class="btn btn-primary btn-block ">Login</button>
          	</form>
           	<div class="modal-footer d-flex justify-content-center">
        		<div class="signup-section"> <a href="#" class="text-info">회원가입</a></div>
      		</div>
        </div>
        
     	 	</div>
    		</div>
  		</div>
	</div>
<!-- login End -->	
	
<!-- ToolBar End /////////////////////////////////////-->
 	
   	
   	
  