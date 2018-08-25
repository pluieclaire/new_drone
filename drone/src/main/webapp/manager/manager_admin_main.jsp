<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.drone.so.SomoimVO"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%
	ArrayList<SomoimVO> soList = (ArrayList<SomoimVO>)request.getAttribute("soList");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	String id = (String)session.getAttribute("id");
	String nickname = (String)session.getAttribute("nickname");
	Integer authority = (Integer)session.getAttribute("authority");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 관리 페이지</title>
</head>
<body>
	<%-- 	<img src="<spring:url value='/image/${storedFileName }' />
	<img src="/drone/image/${storedFileName }" /> --%>
<div class="row text_align_center p-3">
	<div class="col-sm-5 m-1" >
		<div class="row">
			<div class="col-sm-12 border border-secondary text_align_center">
				<br />
				<img src="${pageContext.request.contextPath}/resources/img/user.png" width="80px"/>
				<br /><br />
				<span class="text_button">회원정보수정</span><br /><br /><br />
				<span class="text_button">회원탈퇴</span>
				<br />
				<br />
				<br />
			</div>
		</div>
		<br />
		<div class="row">
			<div class="col-sm-12 border border-secondary text_align_center">
				<br />
				<span class="text_button">회원목록</span><br /><br />
				<br />
				<br />
				
				<table class="table table-sm table-light">
					<thead>
						<tr>
							<td scope="col">no.</td>
							<td scope="col">회원아이디</td>
							<td scope="col">이메일</td>
							<td scope="col">권한</td>
						</tr>
					</thead>
					<tbody>
						<tr>
	      					<th scope="row">1</th>
	      					<td>jiwon</td>
	     					<td>pyogo@naver.com</td>
	     					<td>최고관리자</td>
    				</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="col-sm-5 m-1 text_align_center border border-secondary">
		<br />
		<span class="text_button">소모임 목록</span><br /><br />
		<br />
		<br />
		<table class="table table-sm table-light">
					<thead>
						<tr>
							<td scope="col">no.</td>
							<td scope="col">소모임이름</td>
							<td scope="col">방장</td>
							<td scope="col">개설날짜</td>
						</tr>
					</thead>
					<tbody>
					<%
						for(int i=0;i < soList.size();i++){
						SomoimVO somoimVO = soList.get(i);	
					%>
						<tr>
	      					<th scope="row">1</th>
	      					<td><a href="template.templ?page=somoim_detail.somo?num=<%=somoimVO.getNum()%>"><%=somoimVO.getName() %></a></td>
	     					<td><%=somoimVO.getFounder() %></td>
	     					<td><%=sdf.format(somoimVO.getFoundingdate()) %></td>
    					</tr>
    				<%
						}
    				%>
					</tbody>
				</table>
	</div>
</div>
</body>
</html>