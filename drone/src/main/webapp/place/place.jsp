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
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="row mt-1 mb-1 pt-5"
			style="background-image: url('${pageContext.request.contextPath}/resources/img/logo_pic/11.jpg'); background-size: cover; background-position: center; ">
			<div class="col-lg-12 line_color_yellow_b text_align_center mb-5">
				<p class="small_logo text_border">FAVORITE PLACES</p>
				<p class="korean_center text_border">드론을 날리기 좋은 장소는 생각보다 가까이 있습니다. 날씨도 같이 확인해보세요</p>

			</div>
			<br /> <br />
	</div>
<div class="row mt-4 korean align-items-center justify-content-center">
	
    <div class="col-sm-5 bg-light text-dark m-2">
      	<img src="${pageContext.request.contextPath}/resources/img/main_map_img.png" width="500px" height= "auto" />
    </div>
    <div class="col-sm-5 bg-light text-dark m-2">
      	<img src="${pageContext.request.contextPath}/resources/img/main_right_img.png" width="500px" height= "auto" />
    </div>
</div>

<div class="row mt-4 align-items-center justify-content-center korean">
	
    <div class="col-sm-4 text-dark m-2">
      	<img src="${pageContext.request.contextPath}/resources/img/compass.png" width="40px" />&nbsp;&nbsp;<button type="button" class="btn btn-outline-secondary">현재 위치 찾기</button>
    </div>
    <div class="col-sm-4 text-dark m-2">
    	<nav class="navbar navbar-light">
  			<form class="form-inline">
    		<input class="form-control mr-sm-2" type="search" placeholder="장소검색" aria-label="Search">
    		<button class="btn btn-outline-secondary my-2 my-sm-0" type="submit">Search</button>
  			</form>
		</nav>
    </div>
</div>


<div class="row mt-4 justify-content-center align-items-center korean">
	<div class="verticalalign col-sm-2 mr-2 mb-2" align="center">
		<h6 class="menu_font">장소추천</h6>
	</div>
	<div class="verticalalign col-sm-6 mb-2" align="center">
		<h6 class="menu_font">상세설명</h6>
	</div>
</div>
<div class="row mt-2 justify-content-center align-items-center korean">
	<div class="col-sm-2 mr-1 mb-2" align="center">
		<h6><a href="#" class="menu_font btn btn-primary align-items-center justify-content-left">광나루 한강공원</a></h6>
	</div>
	<div class="korean col-sm-5 align-items-center justify-content-left">
		<h6 class="menu_font">가족 나들이에 좋고, 교통편이 좋아서 추천!</h6>
	</div>
	<div class="col-sm-1 align-items-center justify-content-left">
	<div class="custom-control custom-checkbox">
  		<input type="checkbox" class="custom-control-input" id="customCheck1">
  		<label class="custom-control-label" for="customCheck1"><span class="small_letters">자주 가는 장소로 저장해보세요!</span></label>
	</div>
	</div>
</div>
<div class="row mt-2 justify-content-center align-items-center">
	<div class="col-sm-2 mr-1 mb-2" align="center">
		<h6 class="menu_font"><a href="#" class="menu_font btn btn-primary align-items-center justify-content-left">서초 RC 비행장</a></h6>
	</div>
	<div class="col-sm-5 align-items-center justify-content-left">
		<h6 class="menu_font">실내 비행장이어서 바람 부는 오늘 같은 날에 추천!</h6>
	</div>
	<div class="col-sm-1 align-items-center justify-content-left">
	<div class="custom-control custom-checkbox">
  		<input type="checkbox" class="custom-control-input" id="customCheck1">
  		<label class="custom-control-label" for="customCheck1"><span class="small_letters">자주 가는 장소로 저장해보세요!</span></label>
	</div>
	</div>
</div>
<div class="row mt-2 justify-content-center align-items-center">
	<div class="col-sm-2 mr-1 mb-2" align="center">
		<h6 class="menu_font"><a href="#" class="menu_font btn btn-primary align-items-center justify-content-left">서초 RC 비행장</a></h6>
	</div>
	<div class="col-sm-5 align-items-center justify-content-left">
		<h6 class="menu_font">실내 비행장이어서 바람 부는 오늘 같은 날에 추천!</h6>
	</div>
	<div class="col-sm-1 align-items-center justify-content-left">
	<div class="custom-control custom-checkbox">
  		<input type="checkbox" class="custom-control-input" id="customCheck1">
  		<label class="custom-control-label" for="customCheck1"><span class="small_letters">자주 가는 장소로 저장해보세요!</span></label>
	</div>
	</div>
</div>
<div class="row mt-2 justify-content-center align-items-center">
	<div class="col-sm-2 mr-1 mb-2" align="center">
		<h6 class="menu_font"><a href="#" class="menu_font btn btn-primary align-items-center justify-content-left">서초 RC 비행장</a></h6>
	</div>
	<div class="col-sm-5 align-items-center justify-content-left">
		<h6 class="menu_font">실내 비행장이어서 바람 부는 오늘 같은 날에 추천!</h6>
	</div>
	<div class="col-sm-1 align-items-center justify-content-left">
	<div class="custom-control custom-checkbox">
  		<input type="checkbox" class="custom-control-input" id="customCheck1">
  		<label class="custom-control-label" for="customCheck1"><span class="small_letters">자주 가는 장소로 저장해보세요!</span></label>
	</div>
	</div>
</div>
<div class="row mt-2 justify-content-center align-items-center">
	<div class="col-sm-2 mr-1 mb-2" align="center">
		<h6 class="menu_font"><a href="#" class="menu_font btn btn-primary align-items-center justify-content-left">서초 RC 비행장</a></h6>
	</div>
	<div class="col-sm-5 align-items-center justify-content-left">
		<h6 class="menu_font">실내 비행장이어서 바람 부는 오늘 같은 날에 추천!</h6>
	</div>
	<div class="col-sm-1 align-items-center justify-content-left">
	<div class="custom-control custom-checkbox">
  		<input type="checkbox" class="custom-control-input" id="customCheck1">
  		<label class="custom-control-label" for="customCheck1"><span class="small_letters">자주 가는 장소로 저장해보세요!</span></label>
	</div>
	</div>
</div>
<div class="row mt-2 justify-content-center align-items-center">
	<div class="col-sm-2 mr-1 mb-2" align="center">
		<h6 class="menu_font"><a href="#" class="menu_font btn btn-primary align-items-center justify-content-left">서초 RC 비행장</a></h6>
	</div>
	<div class="col-sm-5 align-items-center justify-content-left">
		<h6 class="menu_font">실내 비행장이어서 바람 부는 오늘 같은 날에 추천!</h6>
	</div>
	<div class="col-sm-1 align-items-center justify-content-left">
	<div class="custom-control custom-checkbox">
  		<input type="checkbox" class="custom-control-input" id="customCheck1">
  		<label class="custom-control-label" for="customCheck1"><span class="small_letters">자주 가는 장소로 저장해보세요!</span></label>
	</div>
	</div>
</div>
</div>
<br />
<br />
<br />
<br />
<br />
<br />
</body>
</html>