<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.drone.gu.GuideVO"%>
<%-- <%@ page import="com.spring.drone.gu.PaginationVO"%> --%>
<%@ page import="com.spring.drone.news.ReplyVO"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>


<!DOCTYPE html>
<html>
<head>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.css" />

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row mt-1 mb-1 pt-5"
			style="background-image: url('${pageContext.request.contextPath}/resources/img/logo_pic/7.jpg'); background-size: cover;">
			<div class="col-lg-12 line_color_yellow_b text_align_center mb-3">
				<p class="small_logo text_border">GUIDE WRITER</p>
				<p class="korean_center text_border">가이드를 작성해주세요</p>
			</div>
			<br /> <br />
		</div>

		<div class="row mt-1 mb-1 pt-5">
			<div class="col-lg-12 text_align_center">
				<p class="korean_center">가이드 목록으로 돌아가기</p>
			</div>
		</div>
<div class="row justify-content-center">
<div class="col-sm-10 m-2 mt-10">
<form id="guide_write" method="post" action="template.templ?page=guide_write.gu">
  	<div class="form-group row">
    	<label for="id" class="col-sm-2 col-form-label">아이디</label>
    	<div class="col-sm-10">
      	<input type="text" class="form-control" name="id" id="id" value="jiwon" readonly/>
    	</div>
  	</div>
	
	<div class="form-group row">
    	<label for="nickname" class="col-sm-2 col-form-label">이름</label>
    	<div class="col-sm-10">
      	<input type="text" class="form-control" name="nickname" id="nickname" value="지원" readonly/>
    	</div>
  	</div>
  	
  <div class="form-group row">
    <label for="title" class="col-sm-2 col-form-label">제목</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="title" id="title" placeholder="제목작성" >
    </div>
  </div>
  <div class="form-group row">
    <label for="body" class="col-sm-2 col-form-label">내용</label>
    <div class="col-sm-10" style="height:400px;">
      <textarea class="form-control" rows="16" name="body" id="body" placeholder="내용수정">내용작성</textarea>
    </div>
  </div>
  <fieldset class="form-group">
    <div class="row">
      <legend class="col-form-label col-sm-2 pt-0">Radios</legend>
      <div class="col-sm-10">
        <div class="form-check">
          <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
          <label class="form-check-label" for="gridRadios1">
            First radio
          </label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
          <label class="form-check-label" for="gridRadios2">
            Second radio
          </label>
        </div>
        <div class="form-check disabled">
          <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios3" value="option3" disabled>
          <label class="form-check-label" for="gridRadios3">
            Third disabled radio
          </label>
        </div>
      </div>
    </div>
  </fieldset>
  <div class="form-group row">
    <div class="col-sm-2">Checkbox</div>
    <div class="col-sm-10">
      <div class="form-check">
        <input class="form-check-input" type="checkbox" id="gridCheck1">
        <label class="form-check-label" for="gridCheck1">
          Example checkbox
        </label>
      </div>
    </div>
  </div>
  <div class="form-group row">
    <div class="text_align_center col-sm-12">
      <button type="submit" class="btn btn-primary">등록</button>
      <button type="reset" class="btn btn-primary">목록</button>
    </div>
  </div>
</form>
</div>
</div>
</div>
</body>
</html>