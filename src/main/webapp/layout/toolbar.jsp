<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 	<script type="text/javascript">
   	
   	function history(){
		popWin = window.open("/history.jsp","popWin","left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
	}
	
	function DeveloperWin(){
		alert("���� ��Ʈ�������� �����ڸ� �����ϰ� �ֽ��ϴ�. \n\n������ 1����� �����մϴ�.");
		popWin = window.open("http://bftest.wecode.co.kr/","popWin","left=200, top=200, width=1024, height=768, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, location=no, titlebar=no");
	}
	
	function MBTIWin(){
		alert("���� ��Ʈ�������� �پ��� ���縦 �����ϰ� �ֽ��ϴ�. \n\n������ 1����� �����մϴ�.");
		popWin = window.open("https://www.16personalities.com/ko/","popWin","left=200, top=200, width=960, height=640, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, location=no");
	}
	
	function Login(){
		$("#userId").focus();

		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("#loginButton").on(
				"click",
				function() {
					var id = $("input:text").val();
					var pw = $("input:password").val();

					if (id == null || id.length < 1) {
						alert('ID �� �Է����� �����̽��ϴ�.');
						$("#userId").focus();
						return;
					}

					if (pw == null || pw.length < 1) {
						alert('�н����带 �Է����� �����̽��ϴ�.');
						$("#password").focus();
						return;
					}

					$("form").attr("method", "POST").attr("action",
							"/user/login").attr("target", "_parent").submit();
		});
	}
	
	
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2. $(#id) : 3. $(.className)
	$(function() {	
			
		$("#main").on("click" , function() {
			$(self.location).attr("href","/main.jsp");
		}); 
		
		$("a:contains('�α���')").on("click" , function() {
			
			$('#loginModal').modal('show');
		  	$(function () {
		    	$('[data-toggle="tooltip"]').tooltip()
		  	})
		  	Login();
			
		});
		
		$("a:contains('ȸ������')").on("click" , function() {
			$(self.location).attr("href","/user/addUserView.jsp");
		}); 
			
	 	$("a:contains('�α׾ƿ�')").on("click" , function() {
			$(self.location).attr("href","/user/logout");
		}); 
	
	 	$("a:contains('ȸ��������ȸ')").on("click" , function() {
			self.location = "/user/listUser"
		}); 
		 
		$( "a:contains('����������ȸ')" ).on("click" , function() {
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});
		
	 	$( "a:contains('�ǸŻ�ǰ���')" ).on("click" , function() {
	 		$(self.location).attr("href","../product/addProductView.jsp");
		}); 
	 	
	 	$("a:contains('�ǸŻ�ǰ����')" ).on("click" , function() {
	 		$(self.location).attr("href","/product/listProduct?menu=manage");
		}); 
	 	
	 	$( "a:contains('�� ǰ �� ��')" ).on("click" , function() {
	 		$(self.location).attr("href","/product/listProduct?menu=search");
		}); 
	 	
	 	$( "a:contains('�����̷���ȸ')" ).on("click" , function() {
	 		$(self.location).attr("href","/purchase/listPurchase");
		}); 
	 	
	 	$( "a:contains('�ֱ� �� ��ǰ')" ).on("click" , function() {
	 		history();
		}); 
	 	
	 	$( "a:contains('������û ���')" ).on("click" , function() {
	 		$(self.location).attr("href","/product/listRequest");
		}); 
	 		 	
	 	$("a:contains('������ä��')").on("click" , function() {
	 		DeveloperWin(); 			
		}); 
	 	
	 	$("a:contains('����ä��')").on("click" , function() {
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
	         
	         <!-- Tool Bar �� �پ��ϰ� ����ϸ�.... -->
	         <ul class="nav navbar-nav">
	             
	         	<c:if test="${ !empty user.userId}">
	             
	            	<!--  ȸ������ DrowDown -->
	              	<li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >ȸ������</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">����������ȸ</a></li>
	                         
	                         <c:if test="${sessionScope.user.role == 'admin'}">
	                         	<li><a href="#">ȸ��������ȸ</a></li>
	                         </c:if>                         
	                        
	                     </ul>
	                 </li>
	                 
	              	<!-- �ǸŻ�ǰ���� DrowDown  -->
	               	<c:if test="${sessionScope.user.role == 'admin'}">
		            	<li class="dropdown">
		                	<a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                    	<span >�ǸŻ�ǰ����</span>
		                        <span class="caret"></span>
		                    </a>
		                    <ul class="dropdown-menu">
		                        <li><a href="#">�ǸŻ�ǰ���</a></li>
		                        <li><a href="#">�ǸŻ�ǰ����</a></li>
		                     </ul>
		                </li>
	                 </c:if>
	                 
	            	<!-- ���Ű��� DrowDown -->
	            	<li class="dropdown">
	                	<a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                    	<span >��ǰ����</span>
	                        <span class="caret"></span>
	                    </a>
	                    <ul class="dropdown-menu">
	                        <li><a href="#">�� ǰ �� ��</a></li>
	                         
	                       
	                    	<li><a href="#">�����̷���ȸ</a></li>
	                       
	                         
	                        <li><a href="#">�ֱ� �� ��ǰ</a></li>
	                        
	                     </ul>
	                 </li>  
	                 
	                 <li class="dropdown">
		                	<a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                    	<span >������û</span>
		                        <span class="caret"></span>
		                    </a>
		                    <ul class="dropdown-menu">
		                        <li><a href="#">������û ���</a></li>
		                    </ul>
		              </li>   
	                
	            </c:if>	
	       </ul>	             
	             
	            <c:if test="${ !empty user.userId}">		
        	   		<ul class="nav navbar-nav navbar-right">
	               		<li><a href="#">�α׾ƿ�</a></li>
	            	</ul>
				</c:if>		            
				
				<c:if test="${ empty user.userId}">
	            	<ul class="nav navbar-nav navbar-right">
	                	<li><a href="#">�α���</a></li>
	            	</ul>
	            </c:if>
	             
	            <ul class="nav navbar-nav navbar-right">
	                <li><a href="#">������ä��</a></li>
	            </ul>
	            
	            <ul class="nav navbar-nav navbar-right">
	                <li><a href="#">����ä��</a></li>
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
          				<span aria-hidden="true">��</span>
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
        		<div class="signup-section"> <a href="#" class="text-info">ȸ������</a></div>
      		</div>
        </div>
        
     	 	</div>
    		</div>
  		</div>
	</div>
<!-- login End -->	
	
<!-- ToolBar End /////////////////////////////////////-->
 	
   	
   	
  