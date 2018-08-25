<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.spring.drone.news.NewsVO"%>
<%@ page import="com.spring.drone.news.NewsPaginationVO"%> 
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%
	ArrayList<NewsVO> newsList = (ArrayList<NewsVO>)request.getAttribute("newsList");
	NewsPaginationVO newsPaginationVO = (NewsPaginationVO)request.getAttribute("newsPaginationVO");
%>

<!-- 이미지 슬라이더 시작 -->
<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100"  height="400" src="${pageContext.request.contextPath}/resources/img/guide_logo1.png" alt="First slide">
	  	<div class="logo carousel-caption d-none d-md-block">
			<h1>DRONE</h1><h1>PICNIC</h1>
        	<p>FIND BEST FLYING SPOTS ANYWHERE ANYTIME</p>
  		</div>    
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" height="400" src="${pageContext.request.contextPath}/resources/img/guide_logo2.png" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" height="400" src="${pageContext.request.contextPath}/resources/img/guide_logo3.png" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<!-- 이미지 슬라이더 끝 -->

<!-- 메인 디브 시작 -->

<div class="row mt-4 div_center" style="width:85%;">
	<div class="col-lg-4" >
    	<table class="table table-condensed table-sm table_fixed">
			<thead>
			<tr class="d-flex board_font">
				<td class="col-9" style="font-size: 20px; text-align: left; font-weight: bold; line-height: 1.5em;">최신 드론 기사</td>
				<td class="col-3" ><p class="bottom_line"><a href="list.news">더보기</a></p></td>
			</tr>
			</thead>
			<tbody class="korean">
 			<%
 			if (newsList.size() == 0){
 			%>
 			<tr class="d-flex">
				<td class="col-9 td_no_overflow" colspan="2">아직 기사가 크롤링되지 않았습니다.<br /><a href="template.templ?page=insert.news">여기</a>를 눌러 크롤링을 시작해주세요.</td>
			</tr>
 				<%
 			}
 			else{
			for(int i=0;i < 6;i++){
				NewsVO vo = newsList.get(i);
				
			%>
			<tr class="d-flex">
				<td class="col-9 td_no_overflow"><a href="template.templ?page=getNews.news?num=<%=vo.getNum() %>&pageNum=<%=newsPaginationVO.getCurrentPage() %>&number=<%=newsPaginationVO.getNumber() %>&readcount=<%=vo.getReadcount()%>"><%=vo.getTitle() %></a></td>
				<td class="col-3 td_no_overflow"><%=vo.getSource() %></td>
			</tr>
			<%
			}
 			}
			%>
			</tbody>
		</table>
    </div>
    <div class="col-lg-4 main_map_img">
      	<img src="${pageContext.request.contextPath}/resources/img/main_map_img.png" width="100%" height= "auto" />
    </div>
    <div class="col-lg-4">
      	<img src="${pageContext.request.contextPath}/resources/img/main_right_img.png" width="100%" height= "auto" />
    </div>
</div>
<br />
<br />
<!-- 메인 디브 끝 -->


