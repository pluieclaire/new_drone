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
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<div class="row line_color_yellow_b mt-1 mb-1 pt-5">
			<div class="col-lg-12 text_align_center">
				 <p class="small_logo">AUCTION</p>
				 <p class="korean_center">중고 장터에서 드론을 팔아보세요</p>
			</div>
		</div>
		<div class="row mt-1 mb-1 pt-5">
			<div class="col-lg-12 text_align_center">
				 <p class="korean_center"><a href="template.templ?page=auction_write.co">중고게시판에 글쓰기</a></p>
			</div>
		</div>
	
	<div class="row text_align_center mb-3">
		<div class="col-sm-3 text-right offset-3" style="font-size: 12px; font-weight: bold; line-height: 1.5em;">
			
			<select class="form-control form-control-sm">
  				<option>낮은 가격</option>
  				<option>높은 가격</option>
  				<option>판매유무</option>
  				<option>게시일</option>
			</select>
			
		</div>
		<div class="col-sm-6 text-dark" style="font-size: 12px; text-align: right;">
  			<form class="form-inline">
    		<input class="form-control form-control-sm mr-sm-2" type="search" placeholder="드론검색" aria-label="Search">
    		<button class="btn btn-outline-secondary my-2 my-sm-0" type="submit">Search</button>
  			</form>
    	</div>
	</div>
	<div class="row justify-content-center">
		<div class="col-sm-12 m-2 justify-content-center align-items-center"  style="font-size: 15px; text-align: center; font-weight: bold; line-height: 1.5em;">
			<table class="table table-sm table-light">
  				<thead>
    				<tr>
      					<th scope="col">no.</th>
      					<th scope="col">제목</th>
     					<th scope="col">제품명</th>
     					<th scope="col">가격</th>
     					<th scope="col">작성자</th>
     					<th scope="col">판매유무</th>
     					<th scope="col">조회수</th>
    				</tr>
  				</thead>
  				<tbody>
   					<tr>
      					<th scope="row">1</th>
      					<td><a href="template.templ?page=auction_detail.co">안녕..내 팬텀4..</a></td>
     					<td>Phantom 4 Advanced</td>
     					<td>3,000,000</td>
     					<td>헤헷</td>
     					<td>판매중</td>
     					<td>300</td>
    				</tr>
    				<tr>
      					<th scope="row">1</th>
      					<td>제발 좀 사가...</td>
     					<td>Phantom 4 Advanced</td>
     					<td>2,000,000</td>
     					<td>헤헷</td>
     					<td>판매중</td>
     					<td>300</td>
    				</tr>
    				<tr>
      					<th scope="row">1</th>
      					<td>헐값</td>
     					<td>Phantom 4 Advanced</td>
     					<td>헐값</td>
     					<td>헤헷</td>
     					<td>판매중</td>
     					<td>300</td>
    				</tr>
    				<tr>
      					<th scope="row">1</th>
      					<td>헐값</td>
     					<td>Phantom 4 Advanced</td>
     					<td>헐값</td>
     					<td>헤헷</td>
     					<td>판매중</td>
     					<td>300</td>
    				</tr>
    			</tbody>
    		</table>
		</div>
	</div>
	<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item disabled">
      <a class="page-link" href="#" tabindex="-1">Previous</a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#">Next</a>
    </li>
  </ul>
</nav>
</div>
</body>
</html>