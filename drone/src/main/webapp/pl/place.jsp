<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	String nickname = (String)session.getAttribute("nickname");
	Integer authority = (Integer)session.getAttribute("authority");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>

<body>
<div class="jumbotron" style="padding-top: 5px;padding-bottom: 5px;margin-bottom: 5px;">
	<!-- 지도-->
	<div class="row" style="background-color:rgba(192,192,192,0.3);">
		<div class="col-sm-12">
			<jsp:include page="place_map_naver.jsp" />
		</div>
	</div>
	<!-- 날씨 -->
<!-- <div class="row" style="background-color: grey;">
		<div class="col-sm-12" style="background-color: PALETURQUOISE;">
			<div style="border-style: solid; border-color: coral">
				<p>날씨를 어쩔꼬 ㅠ</p>
			</div>
		</div>
	</div> -->
</div><!-- class="jumbotron" -->

<div class="container">
	<div class="row" style="background-color:rgba(192,150,150,0.3);">
		<div class="col-sm-12">
			<jsp:include page="place_list.jsp" />
		</div>
	</div>
</div> <!-- class="container" -->

</body>


<!-- Jquery -->
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css"
	integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B"
	crossorigin="anonymous">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"
	integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em"
	crossorigin="anonymous"></script>


</html>