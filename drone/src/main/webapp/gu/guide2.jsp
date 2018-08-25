<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.drone.gu.GuideVO"%>
<%@ page import = "java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ArrayList<GuideVO> guideList = (ArrayList<GuideVO>)request.getAttribute("guideList3333");

	String id = (String)session.getAttribute("id");
	String nickname = (String)session.getAttribute("nickname");
	int authority = 1;

%>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script> 
<script type="text/javascript">
function getGuide(num){
	
	$('#output').empty();
	/* alert('params : ' + num); */
	$.ajax({
		url:'/drone/getGuideJSON.gu?num=' + num,
		type:'GET',
		dataType: "json",
		contentType: 'application/x-www-form-urlencoded; charset=utf-8',
		success: function(data){
			$.each(data, function(index, item){
				var output = '';
				output += '<br />';
				output += '<p>' + item.num + '</p>';
				output += '<p>' + item.title + '</p>';
				output += '<p>' + item.body + '</p>';
				console.log("output: " + output);
				$('#output').append(output);
			});
		},
		error: function(){
			alert("ajax 통신 실패");
		}
	});
}
$(document).ready(function(){
	//목록
	

});

</script>
</head>
<body>

<div class="container">
	<div class="row mt-1 mb-1 pt-5"
			style="background-image: url('${pageContext.request.contextPath}/resources/img/logo_pic/4.jpg'); background-size: cover; background-position: center; ">
			<div class="col-lg-12 line_color_yellow_b text_align_center mb-5">
				<p class="small_logo text_border">GUIDE</p>
				<p class="korean_center text_border">드론을 날리는데 필요한 모든 지식을 한 페이지에서 만나보세요</p>
			</div>
			<br /> <br />
	</div>
	<div class="row mt-1 mb-1 pt-5">
		<div class="col-lg-12 text_align_center">
		<% 
		if(id != null & authority == 1){
		%>	
			<p class="korean_center"><a href="template.templ?page=guide_write_form.gu">가이드 작성하기</a></p>
		<%
		}
		else{
		%>
			<p class="korean_center"><a href="template.templ?page=guide_write_form.gu">너는 가이드 작성권한이 없다..</a></p>
		<%
		}
		%>
		</div>
	</div>

	<div class="row mt-4 justify-content-center align-items-center" >

	<%
		if (guideList.size() != 0){
			for(int i=0;i < guideList.size();i++){
				GuideVO vo = guideList.get(i);
	%>	

		<div class="col-lg-3 m-2 text_align_center">
			<div class="thumbnail-wrappper">
				<img src="${pageContext.request.contextPath}/resources/img/g3.jpg" />
			</div>
			<form id="getEachGuide" method="post" action="javascript:getGuide(<%=vo.getNum() %>);" class="p-2">
			<input type="hidden" id="num" name="num" value="<%=vo.getNum() %>" />
			<button class="btn btn-outline-dark korean_center btn-block" type="submit" id="button_click"><%=vo.getTitle() %></button>
			<h6><a href="template.templ?page=guide_write.gu" class="korean">글수정하기</a></h6>
			</form>
		</div>
	<%
			}
		}
		if (guideList.size() == 0){
	%>
	<div class="row mt-1 mb-1 pt-5">
		<div class="col-lg-12 text_align_center">
				<p class="korean_center">작성된 가이드가 없습니다</p>
			 <p class="korean_center"><a href="template.templ?page=guide_write_form.gu">가이드 작성하기</a></p>
		</div>
	</div>
	<%
		}
	%>
</div>
<!-- 가이드 세부 메뉴 박스 끝 -->
<div class="container" id="articleDetail">
	<div class="row mt-4 line_color_yellow_t" >
		<div class="col-lg-8 m-4 korean" id="output">
		</div>
	</div>		
</div>
</div>

</body>
</html>