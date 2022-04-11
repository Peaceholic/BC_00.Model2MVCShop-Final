<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">

	<link rel="stylesheet" href="https://cssslider.com/styles.min.css" type="text/css" />
	<link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon" />
	<link rel="icon" href="/images/favicon.ico" type="image/x-icon" />

	<!-- Kakao API -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<!-- Bootstrap, jQuery CDN -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<!-- Bootstrap Dropdown Hover CSS -->
	<link href="/css/animate.min.css" rel="stylesheet">
	<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

	<!-- Bootstrap Dropdown Hover JS -->
	<script src="/javascript/bootstrap-dropdownhover.min.js"></script>


	<!-- jQuery UI toolTip 사용 CSS-->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

	<!-- jQuery UI toolTip 사용 JS-->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<style type="text/css">
	
	@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);
	.np{font-family: 'Nanum Pen Script', cursive;}
	
		#top {		
			padding-top: 50px;
			text-align: center;		
			z-index: 1;
		}

		#middle {
			margin: 30px;
			text-align: center;					
			z-index: 1;
		}

		#buttom {
			text-align: center;
			z-index: 1;
		}

		.sticky {
			background-color: white;
			position: sticky;
			top: 50px;
		}

		#c1 {
			color: blue;
		}

		#c2 {
			color: red;
		}

		#searchbutton {
			border-radius: 200px;
			border: 2px solid gray;
			cursor: pointer;
			line-height: 1;
			margin: 10px;
			padding: 12px 25px;
			text-align: center;
			-webkit-transition: all 0.2s ease-in-out 0s;
			-moz-transition: all 0.2s ease-in-out 0s;
			-ms-transition: all 0.2s ease-in-out 0s;
			transition: all 0.2s ease-in-out 0s;
		}

		input[type=search] {
			width: 400px;
			height: 40px;
			font-size: 16px;
			padding: 0px 20px 0px 40px;
			border-radius: 40px;
			outline: none;
			border: solid gray 2px;
			background: url('Search.png') 7px center no-repeat;
		}

		.slider-container {
			padding: 40px 0;
		}

		.slider-container .csslider1 {
			position: relative;
			display: block;
			max-width: 100%;
			height: 600px;
			overflow: hidden;
		}
		
		html {
   			 background: #fff;
		}
		
	</style>


	<script>
	
		$(document).ready(function () {
			
			$("body").on("click","#url",function (e) {
				e.preventDefault();
		        var url = $(this).attr("data-url");
		        window.open(url, "popWin","left=0, top=200, width=1024, height=768, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, location=no, titlebar=no");  
		    });
			
			$("body").on("click",".requestbook",function (e) {
								
				var vtitle = $(this).find('input[name=title]').val();
				var vauthors = $(this).find('input[name=authors]').val();
				var vpublisher = $(this).find('input[name=publisher]').val();
				var vprice = $(this).find('input[name=price]').val();
				var visbn = $(this).find('input[name=isbn]').val();
				var vstatus = $(this).find('input[name=status]').val();
				
				if( vstatus == "" ) {
					alert("판매중지된 도서입니다. 다른도서를 선택해주세요.");
				} else {
									
					var tempBook = '\n\n'
						+"제목 : "+ vtitle + '\n'
						+"저자 : "+ vauthors + '\n'
						+"출판 : "+ vpublisher + '\n'
						+"가격 : "+ vprice + '\n'
						+"ISBN : "+ visbn
				
					var qbresult = confirm("\n 선택하신 도서를 요청하시겠습니까?" + tempBook);
				
					if(qbresult){
				    	alert("\n 요청이 완료되었습니다. \n\n '도서요청' 메뉴에서 결과 확인이 가능합니다.");		
				    	$("form").attr("method" , "POST").attr("action" , "/product/requestProduct").submit();
					}
				}
			});
			
			var pageNum = 1;

			$("#searchbutton").click(function () {

				$.ajax({
					method: "GET",
					url: "https://dapi.kakao.com/v3/search/book?target=title",
					data: { query: $("#query").val(), page: pageNum },
					headers: { Authorization: "KakaoAK 909dba15fd1c9a43102697fc403b3d88" }
				})
					.done(function (msg) {
						console.log(msg);

						for (var i = 0; i < 10; i++) {
							$("#request").append(
								
								"<div class='row'>"

								+ "<form id='" + msg.documents[3 * i].isbn + "' class='requestbook'>"	
								+ "<div class='col-sm-6 col-md-4'>"
								+ "<div class='thumbnail'>"
								+ "<img src='" + msg.documents[3 * i].thumbnail + "'" + " onerror=this.src='/images/nocover.png' >"
								+ "<div class='caption'>"
								+ "<h5><a href='" + msg.documents[3 * i].url + "'>" + msg.documents[3 * i].title + "</a></h5>"
								+ "<p>"
								+ "<strong>ISBN : </strong> " + msg.documents[3 * i].isbn + "<br>"
								+ "<strong>출판사 : </strong> " + msg.documents[3 * i].publisher + "<br>"
								+ "<strong>저 자 : </strong> " + msg.documents[3 * i].authors + "<br>"
								+ "<strong>가 격 : </strong> " + msg.documents[3 * i].price + "<br>"
								+ "<strong>상 태 : </strong> " + msg.documents[3 * i].status
								+ "</p>"
								+ "<p>"
								+ "<a href='" + msg.documents[3 * i].url + "' class='btn btn-primary' id='url' role='button' data-url='"+ msg.documents[3 * i].url +"'>상세정보</a>"
								+ "<a href='#' class='btn btn-default' id='rq' role='button'>입고요청</a>"
								+ "</p>"
								+ "</div></div></div>"
								+ "<input type='hidden' name='title' value='"+ msg.documents[3 * i].title +"'/>"
								+ "<input type='hidden' name='authors' value='"+ msg.documents[3 * i].authors +"'/>"
								+ "<input type='hidden' name='publisher' value='"+ msg.documents[3 * i].publisher +"'/>"
								+ "<input type='hidden' name='price' value='"+ msg.documents[3 * i].price +"'/>"
								+ "<input type='hidden' name='datetime' value='"+ msg.documents[3 * i].datetime +"'/>"
								+ "<input type='hidden' name='thumbnail' value='"+ msg.documents[3 * i].thumbnail +"'/>"
								+ "<input type='hidden' name='isbn' value='"+ msg.documents[3 * i].isbn +"'/>"
								+ "<input type='hidden' name='status' value='"+ msg.documents[3 * i].status +"'/>"	
							    + "</form>"

							    + "<form id='" + msg.documents[3 * i+1].isbn + "' class='requestbook'>"	
								+ "<div class='col-sm-6 col-md-4'>"
								+ "<div class='thumbnail'>"
								+ "<img src='" + msg.documents[3 * i + 1].thumbnail + "'" + " onerror=this.src='/images/nocover.png' >"
								+ "<div class='caption'>"
								+ "<h5><a href='" + msg.documents[3 * i + 1].url + "'>" + msg.documents[3 * i + 1].title + "</a></h5>"
								+ "<p>"
								+ "<strong>ISBN : </strong> " + msg.documents[3 * i + 1].isbn + "<br>"
								+ "<strong>출판사 : </strong> " + msg.documents[3 * i + 1].publisher + "<br>"
								+ "<strong>저 자 : </strong> " + msg.documents[3 * i + 1].authors + "<br>"
								+ "<strong>가 격 : </strong> " + msg.documents[3 * i + 1].price + "<br>"
								+ "<strong>상 태 : </strong> " + msg.documents[3 * i + 1].status
								+ "</p>"
								+ "<p>"
								+ "<a href='" + msg.documents[3 * i + 1].url + "' class='btn btn-primary' id='url' role='button' data-url='"+ msg.documents[3 * i + 1].url +"'>상세정보</a>"
								+ "<a href='#' class='btn btn-default' id='rq' role='button'>입고요청</a>"
								+ "</p>"
								+ "</div></div></div>"
								+ "<input type='hidden' name='title' value='"+ msg.documents[3 * i + 1].title +"'/>"
								+ "<input type='hidden' name='authors' value='"+ msg.documents[3 * i + 1].authors +"'/>"
								+ "<input type='hidden' name='publisher' value='"+ msg.documents[3 * i + 1].publisher +"'/>"
								+ "<input type='hidden' name='price' value='"+ msg.documents[3 * i + 1].price +"'/>"
								+ "<input type='hidden' name='datetime' value='"+ msg.documents[3 * i + 1].datetime +"'/>"
								+ "<input type='hidden' name='thumbnail' value='"+ msg.documents[3 * i + 1].thumbnail +"'/>"
								+ "<input type='hidden' name='isbn' value='"+ msg.documents[3 * i + 1].isbn +"'/>"
								+ "<input type='hidden' name='status' value='"+ msg.documents[3 * i + 1].status +"'/>"	
								+ "</form>"

								+ "<form id='" + msg.documents[3 * i + 2].isbn + "' class='requestbook'>"	
								+ "<div class='col-sm-6 col-md-4'>"
								+ "<div class='thumbnail'>"
								+ "<img src='" + msg.documents[3 * i + 2].thumbnail + "'" + " onerror=this.src='/images/nocover.png' >"
								+ "<div class='caption'>"
								+ "<h5><a href='" + msg.documents[3 * i + 2].url + "'>" + msg.documents[3 * i + 2].title + "</a></h5>"
								+ "<p>"
								+ "<strong>ISBN : </strong> " + msg.documents[3 * i + 2].isbn + "<br>"
								+ "<strong>출판사 : </strong> " + msg.documents[3 * i + 2].publisher + "<br>"
								+ "<strong>저 자 : </strong> " + msg.documents[3 * i + 2].authors + "<br>"
								+ "<strong>가 격 : </strong> " + msg.documents[3 * i + 2].price + "<br>"
								+ "<strong>상 태 : </strong> " + msg.documents[3 * i + 2].status
								+ "</p>"
								+ "<p>"
								+ "<a href='" + msg.documents[3 * i + 2].url + "' class='btn btn-primary' id='url' role='button' data-url='"+ msg.documents[3 * i + 2].url +"'>상세정보</a>"
								+ "<a href='#' class='btn btn-default' id='rq' role='button'>입고요청</a>"
								+ "</p>"
								+ "</div></div></div>"
								+ "<input type='hidden' name='title' value='"+ msg.documents[3 * i + 2].title +"'/>"
								+ "<input type='hidden' name='authors' value='"+ msg.documents[3 * i + 2].authors +"'/>"
								+ "<input type='hidden' name='publisher' value='"+ msg.documents[3 * i + 2].publisher +"'/>"
								+ "<input type='hidden' name='price' value='"+ msg.documents[3 * i + 2].price +"'/>"
								+ "<input type='hidden' name='datetime' value='"+ msg.documents[3 * i + 2].datetime +"'/>"
								+ "<input type='hidden' name='thumbnail' value='"+ msg.documents[3 * i + 2].thumbnail +"'/>"
								+ "<input type='hidden' name='isbn' value='"+ msg.documents[3 * i + 2].isbn +"'/>"
								+ "<input type='hidden' name='status' value='"+ msg.documents[3 * i + 2].status +"'/>"	
								+ "</form>"	

								+ "</div>"
							);
						}
					});
			})

			$(window).scroll(function () {

				if (Math.ceil($(window).scrollTop()) + $(window).height() >= $(document).height()) {
					pageNum++;

					$.ajax({
						method: "GET",
						url: "https://dapi.kakao.com/v3/search/book?target=title",
						data: { query: $("#query").val(), page: pageNum },
						headers: { Authorization: "KakaoAK 909dba15fd1c9a43102697fc403b3d88" }
					})
						.done(function (msg) {
							console.log(msg);

							for (var i = 0; i < 10; i++) {
								$("#request").append(
									
									"<div class='row'>"

									+ "<form id='" + msg.documents[3 * i].isbn + "' class='requestbook'>"
									+ "<div class='col-sm-6 col-md-4'>"
									+ "<div class='thumbnail'>"
									+ "<img src='" + msg.documents[3 * i].thumbnail + "'" + " onerror=this.src='/images/nocover.png' >"
									+ "<div class='caption'>"
									+ "<h5><a href='" + msg.documents[3 * i].url + "'>" + msg.documents[3 * i].title + "</a></h5>"
									+ "<p>"
									+ "<strong>ISBN : </strong> " + msg.documents[3 * i].isbn + "<br>"
									+ "<strong>출판사 : </strong> " + msg.documents[3 * i].publisher + "<br>"
									+ "<strong>저 자 : </strong> " + msg.documents[3 * i].authors + "<br>"
									+ "<strong>가 격 : </strong> " + msg.documents[3 * i].price + "<br>"
									+ "<strong>상 태 : </strong> " + msg.documents[3 * i].status
									+ "</p>"
									+ "<p>"
									+ "<a href='" + msg.documents[3 * i].url + "' class='btn btn-primary' id='url' role='button' data-url='"+ msg.documents[3 * i].url +"'>상세정보</a>"
									+ "<a href='#' class='btn btn-default' id='rq' role='button'>입고요청</a>"
									+ "</p>"
									+ "</div></div></div>"
									+ "<input type='hidden' name='title' value='"+ msg.documents[3 * i].title +"'/>"
									+ "<input type='hidden' name='authors' value='"+ msg.documents[3 * i].authors +"'/>"
									+ "<input type='hidden' name='publisher' value='"+ msg.documents[3 * i].publisher +"'/>"
									+ "<input type='hidden' name='price' value='"+ msg.documents[3 * i].price +"'/>"
									+ "<input type='hidden' name='datetime' value='"+ msg.documents[3 * i].datetime +"'/>"
									+ "<input type='hidden' name='thumbnail' value='"+ msg.documents[3 * i].thumbnail +"'/>"
									+ "<input type='hidden' name='isbn' value='"+ msg.documents[3 * i].isbn +"'/>"
									+ "<input type='hidden' name='status' value='"+ msg.documents[3 * i].status +"'/>"	
								    + "</form>"

								    + "<form id='" + msg.documents[3 * i + 1].isbn + "' class='requestbook'>"	
									+ "<div class='col-sm-6 col-md-4'>"
									+ "<div class='thumbnail'>"
									+ "<img src='" + msg.documents[3 * i + 1].thumbnail + "'" + " onerror=this.src='/images/nocover.png' >"
									+ "<div class='caption'>"
									+ "<h5><a href='" + msg.documents[3 * i + 1].url + "'>" + msg.documents[3 * i + 1].title + "</a></h5>"
									+ "<p>"
									+ "<strong>ISBN : </strong> " + msg.documents[3 * i + 1].isbn + "<br>"
									+ "<strong>출판사 : </strong> " + msg.documents[3 * i + 1].publisher + "<br>"
									+ "<strong>저 자 : </strong> " + msg.documents[3 * i + 1].authors + "<br>"
									+ "<strong>가 격 : </strong> " + msg.documents[3 * i + 1].price + "<br>"
									+ "<strong>상 태 : </strong> " + msg.documents[3 * i + 1].status
									+ "</p>"
									+ "<p>"
									+ "<a href='" + msg.documents[3 * i + 1].url + "' class='btn btn-primary' id='url' role='button' data-url='"+ msg.documents[3 * i + 1].url +"'>상세정보</a>"
									+ "<a href='#' class='btn btn-default' id='rq' role='button'>입고요청</a>"
									+ "</p>"
									+ "</div></div></div>"
									+ "<input type='hidden' name='title' value='"+ msg.documents[3 * i + 1].title +"'/>"
									+ "<input type='hidden' name='authors' value='"+ msg.documents[3 * i + 1].authors +"'/>"
									+ "<input type='hidden' name='publisher' value='"+ msg.documents[3 * i + 1].publisher +"'/>"
									+ "<input type='hidden' name='price' value='"+ msg.documents[3 * i + 1].price +"'/>"
									+ "<input type='hidden' name='datetime' value='"+ msg.documents[3 * i + 1].datetime +"'/>"
									+ "<input type='hidden' name='thumbnail' value='"+ msg.documents[3 * i + 1].thumbnail +"'/>"
									+ "<input type='hidden' name='isbn' value='"+ msg.documents[3 * i + 1].isbn +"'/>"
									+ "<input type='hidden' name='status' value='"+ msg.documents[3 * i + 1].status +"'/>"	
									+ "</form>"

									+ "<form id='" + msg.documents[3 * i + 2].isbn + "' class='requestbook'>"
									+ "<div class='col-sm-6 col-md-4'>"
									+ "<div class='thumbnail'>"
									+ "<img src='" + msg.documents[3 * i + 2].thumbnail + "'" + " onerror=this.src='/images/nocover.png' >"
									+ "<div class='caption'>"
									+ "<h5><a href='" + msg.documents[3 * i + 2].url + "'>" + msg.documents[3 * i + 2].title + "</a></h5>"
									+ "<p>"
									+ "<strong>ISBN : </strong> " + msg.documents[3 * i + 2].isbn + "<br>"
									+ "<strong>출판사 : </strong> " + msg.documents[3 * i + 2].publisher + "<br>"
									+ "<strong>저 자 : </strong> " + msg.documents[3 * i + 2].authors + "<br>"
									+ "<strong>가 격 : </strong> " + msg.documents[3 * i + 2].price + "<br>"
									+ "<strong>상 태 : </strong> " + msg.documents[3 * i + 2].status
									+ "</p>"
									+ "<p>"
									+ "<a href='" + msg.documents[3 * i + 2].url + "' class='btn btn-primary' id='url' role='button' data-url='"+ msg.documents[3 * i + 2].url +"'>상세정보</a>"
									+ "<a href='#' class='btn btn-default' id='rq' role='button'>입고요청</a>"
									+ "</p>"
									+ "</div></div></div>"
									+ "<input type='hidden' name='title' value='"+ msg.documents[3 * i + 2].title +"'/>"
									+ "<input type='hidden' name='authors' value='"+ msg.documents[3 * i + 2].authors +"'/>"
									+ "<input type='hidden' name='publisher' value='"+ msg.documents[3 * i + 2].publisher +"'/>"
									+ "<input type='hidden' name='price' value='"+ msg.documents[3 * i + 2].price +"'/>"
									+ "<input type='hidden' name='datetime' value='"+ msg.documents[3 * i + 2].datetime +"'/>"
									+ "<input type='hidden' name='thumbnail' value='"+ msg.documents[3 * i + 2].thumbnail +"'/>"
									+ "<input type='hidden' name='isbn' value='"+ msg.documents[3 * i + 2].isbn +"'/>"
									+ "<input type='hidden' name='status' value='"+ msg.documents[3 * i + 2].status +"'/>"	
									+ "</form>"	

									+ "</div>"
								);
							}
						});
				}
			});
		})
		
	</script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />

		<div id="top" class="container">		
			<div class="rt-container slider-container">
				<link rel="stylesheet" href="https://cssslider.com/sliders/demo-33/engine1/style.css">
				<script type="text/javascript"
					src="https://cssslider.com/sliders/demo-33/engine1/gestures.js"></script>
				<div class='csslider1 autoplay '>
					<input name="cs_anchor1" id='cs_slide1_0' type="radio" class='cs_anchor slide'>
					<input name="cs_anchor1" id='cs_slide1_1' type="radio" class='cs_anchor slide'>
					<input name="cs_anchor1" id='cs_slide1_2' type="radio" class='cs_anchor slide'>
					<input name="cs_anchor1" id='cs_play1' type="radio" class='cs_anchor' checked>
					<input name="cs_anchor1" id='cs_pause1_0' type="radio" class='cs_anchor pause'>
					<input name="cs_anchor1" id='cs_pause1_1' type="radio" class='cs_anchor pause'>
					<input name="cs_anchor1" id='cs_pause1_2' type="radio" class='cs_anchor pause'>
					<ul>
						<li class="cs_skeleton">
						<img src="https://cssslider.com/sliders/demo-33/data1/images/forest653448_1280.jpg"></li>
						
						<li class='num0 img slide'> 
						<img src="https://cssslider.com/sliders/demo-33/data1/images/forest653448_1280.jpg" alt='Forest' title='Forest' /></li>
						
						<li class='num1 img slide'> 
						<img src="https://cssslider.com/sliders/demo-33/data1/images/plant690145_1280.jpg" alt='Plant' title='Plant' /></li>
						
						<li class='num2 img slide'> 
						<img src="https://cssslider.com/sliders/demo-33/data1/images/forestfloor473844_1280.jpg" alt='Forest Floor' title='Forest Floor' /></li>
					</ul>
					<div class='cs_description'>
						<label class='num0'>
							<span class="cs_title">
								<span class="cs_wrapper">Forest</span>
							</span><br/>
							<span class="cs_descr">
								<span class="cs_wrapper">숲속에서 독서를 해보세요</span>
							</span>
						</label>
						
						<label class='num1'>
							<span class="cs_title">
								<span class="cs_wrapper">Field</span>
							</span><br/>
							<span class="cs_descr">
								<span class="cs_wrapper">한적한 장소에서 독서를 해보세요</span>
							</span>
						</label>
						
						<label class='num2'>
							<span class="cs_title">
								<span class="cs_wrapper">Private</span>
							</span><br/>
							<span class="cs_descr">
								<span class="cs_wrapper">나만의 장소에서 독서를 해보세요</span>
							</span>
						</label>
					</div>
					<div class='cs_play_pause'>
						<label class='cs_play' for='cs_play1'><span><i></i><b></b></span></label>
						<label class='cs_pause num0' for='cs_pause1_0'><span><i></i><b></b></span></label>
						<label class='cs_pause num1' for='cs_pause1_1'><span><i></i><b></b></span></label>
						<label class='cs_pause num2' for='cs_pause1_2'><span><i></i><b></b></span></label>
					</div>
					<div class='cs_arrowprev'>
						<label class='num0' for='cs_slide1_0'><span><i></i><b></b></span><img
								src="https://cssslider.com/sliders/demo-33/data1/images/forest653448_1280.jpg"
								alt='Forest' title='Forest' /></label>
						<label class='num1' for='cs_slide1_1'><span><i></i><b></b></span><img
								src="https://cssslider.com/sliders/demo-33/data1/images/plant690145_1280.jpg"
								alt='Plant' title='Plant' /></label>
						<label class='num2' for='cs_slide1_2'><span><i></i><b></b></span><img
								src="https://cssslider.com/sliders/demo-33/data1/images/forestfloor473844_1280.jpg"
								alt='Forest Floor' title='Forest Floor' /></label>
					</div>
					<div class='cs_arrownext'>
						<label class='num0' for='cs_slide1_0'><span><i></i><b></b></span><img
								src="https://cssslider.com/sliders/demo-33/data1/images/forest653448_1280.jpg"
								alt='Forest' title='Forest' /></label>
						<label class='num1' for='cs_slide1_1'><span><i></i><b></b></span><img
								src="https://cssslider.com/sliders/demo-33/data1/images/plant690145_1280.jpg"
								alt='Plant' title='Plant' /></label>
						<label class='num2' for='cs_slide1_2'><span><i></i><b></b></span><img
								src="https://cssslider.com/sliders/demo-33/data1/images/forestfloor473844_1280.jpg"
								alt='Forest Floor' title='Forest Floor' /></label>
					</div>
					<div class='cs_bullets'>
						<label class='num0' for='cs_slide1_0'> <span class='cs_point'></span>
							<span class='cs_thumb'><img
									src="https://cssslider.com/sliders/demo-33/data1/tooltips/forest653448_1280.jpg"
									alt='Forest' title='Forest' /></span></label>
						<label class='num1' for='cs_slide1_1'> <span class='cs_point'></span>
							<span class='cs_thumb'><img
									src="https://cssslider.com/sliders/demo-33/data1/tooltips/plant690145_1280.jpg"
									alt='Plant' title='Plant' /></span></label>
						<label class='num2' for='cs_slide1_2'> <span class='cs_point'></span>
							<span class='cs_thumb'><img
									src="https://cssslider.com/sliders/demo-33/data1/tooltips/forestfloor473844_1280.jpg"
									alt='Forest Floor' title='Forest Floor' /></span></label>
					</div>
				</div>


				<div class="clear"></div>
			</div>
		</div>


	<div id="middle" role="alert">
		<h1 class="np" id="c1">원하시는 도서가 있나요? <small class="np"> &nbsp;&nbsp; 검색하시면 요청가능합니다.</small></h1>
	</div>

	<c:choose>
		<c:when test="${ !empty user.userId}">
			<div id="buttom" class="sticky" class="container">
				<input type="search" id="query" placeholder="제목을 입력하세요. ">
				<button id="searchbutton" class="btn">검색</button>
				<br><br>
			</div>
		</c:when>
		<c:otherwise>
			<div id="buttom" class="container">
				<h1 id="c2" class="np">로그인을 하시면 검색창이 여기에 표시됩니다.</h1>
			</div>
		</c:otherwise>
	</c:choose>





	<div id="request" class="container"></div>


</body>

</html>