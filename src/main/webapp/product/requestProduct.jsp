<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
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
	   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
    </style>
         
	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

	// Ȯ��
	 $(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( "button.btn.btn-primary" ).on("click" , function() {
			self.location = "/product/listRequest"
		});
	});	
	
	
	// �߰����
	$(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
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
	

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
	
		<div class="page-header">
	       <h3 class=" text-info">��ǰ��û ���</h3>
	       <h5 class="text-muted">��ǰ��û�� ������� �����Դϴ�. <strong class="text-danger">������ ���α��� �Ϸ簡 �ҿ�˴ϴ�.</strong></h5>
	    </div>
	    	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��û ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${book.bookNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>ó�� ����</strong></div>	  		
	  		<div class="col-xs-8 col-md-4">
    			<c:if test="${ book.requestNo == '0' }"> 	
    				��û�����Ϸ�
    			</c:if>
    			<c:if test="${ book.requestNo == '1' }"> 	
    				��û�����Ϸ�
    			</c:if>
    		</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>������û ����</strong></div>
			<div class="col-xs-8 col-md-4">${book.reqDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>ó���Ϸ� ����</strong></div>
			<div class="col-xs-8 col-md-4">${book.doneDate}</div>
		</div>
		
		<hr/>
				
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���� ����</strong></div>
			<div class="col-xs-8 col-md-4">${book.title}</div>
		</div>
				
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���� ����</strong></div>
			<div class="col-xs-8 col-md-4">${book.contents}</div>
		</div>
				
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�������� �󼼸�ũ</strong></div>
			<div class="col-xs-8 col-md-4">${book.url}</div>
		</div>
		
		<hr/>
				
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���� ISBN</strong></div>
			<div class="col-xs-8 col-md-4">${book.isbn}</div>
		</div>
				
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���� ��������</strong></div>
			<div class="col-xs-8 col-md-4">${book.datetime}</div>
		</div>
				
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���� ����</strong></div>
			<div class="col-xs-8 col-md-4">${book.authors}</div>
		</div>
				
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���� ����</strong></div>
			<div class="col-xs-8 col-md-4">${book.authors}</div>
		</div>
				
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���� ���ǻ�</strong></div>
			<div class="col-xs-8 col-md-4">${book.publisher}</div>
		</div>
				
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���� ������</strong></div>
			<div class="col-xs-8 col-md-4">${book.translators}</div>
		</div>
				
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���� ����</strong></div>
			<div class="col-xs-8 col-md-4">${book.price}</div>
		</div>
				
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���� �ǸŰ���</strong></div>
			<div class="col-xs-8 col-md-4">${book.sale_price}</div>
		</div>		
				
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���� �ǸŻ���</strong></div>
			<div class="col-xs-8 col-md-4">${book.status}</div>
		</div>		
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���� ǥ��</strong></div>
			<img src="${book.thumbnail}" />
		</div>
		  		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >Ȯ��</button>
			  <a class="btn btn-primary btn" href="#" role="button">�߰����</a>
		    </div>
		  </div>
		
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
	
</body>

</html>