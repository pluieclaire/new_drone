<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.spring.drone.news.NewsVO"%>
<%@ page import="com.spring.drone.news.NewsPaginationVO"%> 
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	ArrayList<NewsVO> newsList = (ArrayList<NewsVO>)request.getAttribute("newsList");
	NewsPaginationVO newsPaginationVO = (NewsPaginationVO)request.getAttribute("newsPaginationVO");

	String id = (String)session.getAttribute("id");
	String nickname = (String)session.getAttribute("nickname");
	Integer authority = (Integer)session.getAttribute("authority");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>드론 뉴스</title>
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

   
</head>
<body>

<div class="container">
	<div class="row mt-1 mb-1 pt-5"
		style="background-image: url('${pageContext.request.contextPath}/resources/img/logo_pic/15.jpg'); background-size: cover; background-position: center; ">
		<div class="col-lg-12 line_color_yellow_b text_align_center mb-5">
			<p class="small_logo text_border">NEWS</p>
			<p class="korean_center text_border">최신 드론 뉴스를 확인하세요</p>
		</div>
		<br /> <br />
	</div>
	
	<div class="row mt-1 mb-1 pt-5">
		<div class="col-lg-12 text_align_center">
			 <p class="korean_center">일반드론뉴스 │ 공모전/대회 소식 │ 드론레저상품모음 │ 드론구직란</p>
		</div>
	</div>
<div class="row justify-content-center mt-5 p-2">
	<div class="col-lg-5 pt-4 orange_border" style="height: 400px;">
		<table class="table table-condensed table-sm table_fixed">
			<thead>
			<tr class="d-flex board_font">
				<td class="col-9" style="font-size: 20px; text-align: left; font-weight: bold; line-height: 1.5em;">최신 드론 기사</td>
				<td class="col-3" ><p class="bottom_line"><a href="template.templ?page=list.news">더보기</a></p></td>
			</tr>
			</thead>
			<tbody class="korean">
 			<%
			for(int i=0;i < 10;i++){
				NewsVO vo = newsList.get(i);	
			%>
			<tr class="d-flex">
				<td class="col-9 td_no_overflow"><a href="template.templ?page=getNews.news?num=<%=vo.getNum() %>&pageNum=<%=newsPaginationVO.getCurrentPage() %>&number=<%=newsPaginationVO.getNumber() %>&readcount=<%=vo.getReadcount()%>"><%=vo.getTitle() %></a></td>
				<td class="col-3 td_no_overflow"><%=vo.getSource() %></td>
			</tr>
			<%
			}
			%>
			</tbody>
		</table>
	</div>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<div class="col-lg-5 pt-4 orange_border" style="height: 400px;">
		<table class="table table-condensed table-sm table_fixed">
			<thead>
			<tr class="d-flex board_font">
				<td class="col-9" style="font-size: 20px; text-align: left; font-weight: bold; line-height: 1.5em;">최신 드론 기사</td>
				<td class="col-3" ><p class="bottom_line"><a href="list.news">더보기</a></p></td>
			</tr>
			</thead>
			<tbody class="korean">
 			<%
			for(int i=0;i < 10;i++){
				NewsVO vo = newsList.get(i);	
			%>
			<tr class="d-flex">
				<td class="col-9 td_no_overflow"><a href="template.templ?page=getNews.news?num=<%=vo.getNum() %>&pageNum=<%=newsPaginationVO.getCurrentPage() %>&number=<%=newsPaginationVO.getNumber() %>&readcount=<%=vo.getReadcount()%>"><%=vo.getTitle() %></a></td>
				<td class="col-3 td_no_overflow"><%=vo.getSource() %></td>
			</tr>
			<%
			}
			%>
			</tbody>
		</table>
	</div>
</div>
  
<div class="row mt-2 p-2 justify-content-center">
	<div class="col-lg-5 pt-4 orange_border" style="height: 400px;">
		<table class="table table-condensed table-sm table_fixed">
			<thead>
			<tr class="d-flex board_font">
				<td class="col-9" style="font-size: 20px; text-align: left; font-weight: bold; line-height: 1.5em;">최신 드론 기사</td>
				<td class="col-3" ><p class="bottom_line"><a href="list.news">더보기</a></p></td>
			</tr>
			</thead>
			<tbody class="korean">
 			<%
			for(int i=0;i < 10;i++){
				NewsVO vo = newsList.get(i);	
			%>
			<tr class="d-flex">
				<td class="col-9 td_no_overflow"><a href="template.templ?page=getNews.news?num=<%=vo.getNum() %>&pageNum=<%=newsPaginationVO.getCurrentPage() %>&number=<%=newsPaginationVO.getNumber() %>&readcount=<%=vo.getReadcount()%>"><%=vo.getTitle() %></a></td>
				<td class="col-3 td_no_overflow"><%=vo.getSource() %></td>
			</tr>
			<%
			}
			%>
			</tbody>
		</table>
	</div>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<div class="col-lg-5 pt-4 orange_border" style="height: 400px;">
		<table class="table table-condensed table-sm table_fixed">
			<thead>
			<tr class="d-flex board_font">
				<td class="col-9" style="font-size: 20px; text-align: left; font-weight: bold; line-height: 1.5em;">최신 드론 기사</td>
				<td class="col-3" ><p class="bottom_line"><a href="list.news">더보기</a></p></td>
			</tr>
			</thead>
			<tbody class="korean">
 			<%
			for(int i=0;i < 10;i++){
				NewsVO vo = newsList.get(i);	
			%>
			<tr class="d-flex">
				<td class="col-9 td_no_overflow"><a href="template.templ?page=getNews.news?num=<%=vo.getNum() %>&pageNum=<%=newsPaginationVO.getCurrentPage() %>&number=<%=newsPaginationVO.getNumber() %>&readcount=<%=vo.getReadcount()%>"><%=vo.getTitle() %></a></td>
				<td class="col-3 td_no_overflow"><%=vo.getSource() %></td>
			</tr>
			<%
			}
			%>
			</tbody>
		</table>
	</div>
	</div>
</div>
<br />
<br />
<br />
</body>
</html>