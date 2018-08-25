<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import="com.spring.drone.so.SomoimVO"%>
<%
	String id = (String)session.getAttribute("id");
	String nickname = (String)session.getAttribute("nickname");
	Integer authority = (Integer)session.getAttribute("authority");
	System.out.println("아이디 : " + id);
%>
<head>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
function logout(){
      var con = confirm("님, 로그아웃 허쉴?");
      if(con == true){
    
       location.href="template.templ?page=logout.me";
       //logout을 위해 세션을 제거하는 페이지 호출
      }else{}
     }
</script>
</head>
<body class="header_body" >

<!-- Header -->


	<div class="row line_color_b pt-4">
		<div class="col-lg-12 text_align_center">
		<a class="logo" href="template.templ?page=main.templ">DRONE PICNIC</a>
		</div>
	</div>

	<div class="row line_color_tb mt-1 mb-1 pb-1 p-0" style="background-color:#fceff0;">
		<div class="col-lg-12 text_align_center">
		 	<a class="menu_font" href="template.templ?page=place.pl">나들이</a>&nbsp;
      		<a class="menu_font" href="template.templ?page=guide.gu">가이드</a>&nbsp;
       		<a class="menu_font" href="template.templ?page=main.co">커뮤니티</a>&nbsp;
       		<a class="menu_font" href="template.templ?page=news_main.news">뉴스</a>
		</div>
	</div>
	<div class="row mt-1 mb-2 pt-1">
		<div class="col-lg-12 korean_text_center">
			<%
			if(id == null){
			%>
			<a href="template.templ?page=login_form.me">로그인</a>
			<%
			}
			else if(id != null){
			%>		
			<a href="template.templ?page=manager_main.ma"><%=nickname %><span class="badge badge-light">9</span></a>
		 	&nbsp;|&nbsp;&nbsp;<a href="#" onClick="logout(); return false;">로그아웃</a>
		 	<%
			}
			else{
		 	%>
      		<a class="korean_text" href="template.templ?page=manager_main.ma"><%=nickname %><span class="badge badge-light">9</span></a>
      		<%
			}
      		%>
		</div>
	</div>
	

        
<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
</body>