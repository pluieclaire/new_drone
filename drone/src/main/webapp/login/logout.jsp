<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%
request.setCharacterEncoding("UTF-8");


session.removeAttribute("nickname");
//nickname 으로 들어온 session을 제거
    
response.sendRedirect("https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://localhost:8800/drone/template.templ?page=main.templ");
// 페이지의 메인으로 이동
%>