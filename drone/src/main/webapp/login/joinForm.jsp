<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready( function() {
	var page = 1;
	$(window).scroll(function() {
	    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
	      console.log(++page);
	     	alert('끝');
	    }
	});

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 관리 시스템 회원 가입 페이지</title>


<style>
	table{
		margin : auto;
		width : 400px;
		border : 1px solid gray;
		text-align : center;
	}
	.td_title{
		font-weight : bold;
		font-size : x-large;
	}
</style>
</head>
<body>
<form name="joinform" action="./joinprocess.me" method = "post">
<table border=1>
	<tr>
		<td colspan="2" class = "td_title">
			회원 가입 페이지
		</td>
	</tr>
	<tr>
		<td><label for = "id">아이디 : </label></td>
		<td><input type="text" name = "id" id = "id"/></td>
	</tr>
	<tr>
		<td><label for = "nickname">닉네임 : </label></td>
		<td><input type="text" name = "nickname" id = "nickname"/></td>
	</tr>
	<tr>
		<td><label for = "password">비밀번호 : </label></td>
		<td><input type="password" name = "password" id = "password"/></td>
	</tr>
	<tr>
		<td colspan="2">
			<a href = "javascript:joinform.submit()">회원가입</a>&nbsp;&nbsp;
			<a href = "javascript:joinform.reset()">다시 작성</a>
		</td>
	</tr>
</table>
</form>

dd<br />
dd<br />
dd<br />
dd<br />
dd<br />
dd<br />
dd<br />
dd<br />
dd<br />
dd<br />
dd<br />
dd<br />
dd<br />
dd<br />
dd<br />
dd<br />
dd<br />
dd<br />
dd<br />
dd<br />
dd<br />
dd<br />
dd<br />
dd<br />
dd<br />
dd<br />
dd<br />
dd<br />
v
dd<br />
dd<br />
dd<br />
dd<br />
dd<br />
dd<br />
dd<br />
dd<br />
dd<br />
v
dd<br />
dd<br />dd<br />
dd<br />
dd<br />dd<br />dd<br />dd<br />dd<br />dd<br />
</body>
</html>