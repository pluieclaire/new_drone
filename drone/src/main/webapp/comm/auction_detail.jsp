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
		<div class="row line_color_yellow_b mt-1 mb-1 pt-5">
			<div class="col-lg-12 text_align_center">
				 <p class="small_logo">AUCTION</p>
				 <p class="korean_center">중고 장터에서 드론을 팔아보세요</p>
			</div>
		</div>
		<div class="row mt-1 mb-1 pt-5">
			<div class="col-lg-12 text_align_center">
				 <p class="korean_center"><a href="template.templ?page=auction_main.co">게시판 목록으로 돌아가기</a></p>
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
	<div class="row">
		<div class="col-sm-12 m-2 justify-content-center align-items-center"  style="font-size: 15px; text-align: left; font-weight: bold; line-height: 1.5em;">
			<table class="table">
  				<thead class="thead-dark">
    				<tr>
      					<th scope="col">#제목 헐값에 팝니다...ㅜ</th>
    				</tr>
  				</thead>
  				<tbody>
    				<tr>
      					<th scope="row">
      						#아이디 droneseller
      					</th>
    				</tr>
    				<tr>
    					<th scope="row">
							<div class="row justify-content-center">
								<div class="col-sm-6 align-items-center ml-5" style="font-size: 12px; text-align: right; font-weight: bold; line-height: 1.5em;">
									<img src="${pageContext.request.contextPath}/resources/img/ex1.jpg" width="100%" />
								</div>
								<div class="col-sm-4 text-dark">
  								<table class="table table-sm">
  									<thead>
    									<tr>
      										<th scope="col">판매중</th>
    									</tr>
  									</thead>
  									<tbody>
    									<tr>
      										<th scope="row">헐값에 팝니다...ㅜ</th>
    									</tr>
    									<tr>
      										<th scope="row">300,000원</th>
    									</tr>
    									<tr>
      										<th scope="row">판매자정보  010-3333-3333</th>
										</tr>
  									</tbody>
  								</table>
    							</div>
    						</div>
						</th>
					</tr>
					<tr>
					<th>
					우리의 청춘이 가장 많이 품고 있는 이상! 이것이야말로 무한한 가치를 가진 것이다 사람은 크고 작고 간에 이상이 있음으로써 용감하고 굳세게 살 수 있는 것이다 석가는 무엇을 위하여 설산에서 고행을 하였으며 예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇을 위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여서 미인을 구하기 위하여서 그리하였는가? 아니다 그들은 커다란 이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을 행복스럽고 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다
이것이야말로 무한한 가치를 가진 것이다 사람은 크고 작고 간에 이상이 있음으로써 용감하고 굳세게 살 수 있는 것이다 석가는 무엇을 위하여 설산에서 고행을 하였으며 예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇을 위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여서 미인을 구하기 위하여서 그리하였는가? 아니다 그들은 커다란 이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을 행복스럽고 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다 그러므
					</th>
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