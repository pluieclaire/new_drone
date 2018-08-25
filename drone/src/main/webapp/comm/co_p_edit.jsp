<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String id = (String)session.getAttribute("id");
	String nickname = (String)session.getAttribute("nickname");
	Integer authority = (Integer)session.getAttribute("authority");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>글 수정하기</title>
</head>
<body>
<form name="photoform" action="" method="post"
	enctype="multipart/form-data">
<table width="960" cellspacing="0" cellpadding="0" border="0" align="center">
<tr>
<td colspan=2>
<table border="0" width="80%" >
	<tr bgcolor="#CED8F6"> 
		<td>
			<p align="center">
				<span style="font-size: 26pt;">글 수정하기</span>
			</p>
		</td>
	</tr>
	<tr bgcolor="#CED8F6">
		<td height="331">
		<table border="1" align="center">
			<tr bgcolor="#FBEFF5">
			<td width="150" height="30">
				<p align="center">
					<font size=2>카테고리</font>
				</p>
			</td>
			<td width="600" height="30">
				&nbsp;<select name="goods_category" size="1">
					<option value="photo" selected style="background-color:transparent" >사진</option>
					<option value="video" style="background-color:transparent" >동영상</option>
				</select>
			</td>
			</tr>
			<tr bgcolor="#FBEFF5">
			<td>
				<p align="center"><font size=2>제목</font></p>
			</td>
			<td align="center"><input type="text" name="title" size="71" style="background-color:white" ></td>
		</tr>
		<tr bgcolor="#FBEFF5">
			<td>
				<p align="center"><font size=2>내용</font></p>
			</td>
			<td width="450">
				<textarea 
				name="goods_content" cols=50 rows=15 style="background-color:transparent; width:99%;"></textarea>
			</td>
		</tr>
		<tr bgcolor="#FBEFF5">
			<td>
			<p align="center"><font size=2>이미지1</font></p>
			</td>
			<td>&nbsp;<input type="file" name="file1"></td></tr>
		<tr bgcolor="#FBEFF5">
			<td>
			<p align="center"><font size=2>이미지2</font></p>
			</td>
			<td>&nbsp;<input type="file" name="file2"></td></tr>
		<tr bgcolor="#FBEFF5">
			<td>
			<p align="center"><font size=2>이미지3</font></p>
			</td>
			<td>&nbsp;<input type="file" name="file3"></td></tr>
		<tr bgcolor="#FBEFF5">
			<td>
			<p align="center"><font size=2>태그</font></p>
			</td>
			<td align="center">
			#<input type="text" name="hashtag" size="8">
			#<input type="text" name="hashtag" size="8">
			#<input type="text" name="hashtag" size="8">
			#<input type="text" name="hashtag" size="8">
			#<input type="text" name="hashtag" size="8">
			</td>
		</tr>
	</table>
	</td>
</tr>
<tr bgcolor="#CED8F6">
	<td height="75">
	<p align="center">
	<input type="submit" value="등록">&nbsp;
	<input type="reset" value="삭제">&nbsp;
	<button type="button" onclick="location='community_photo.jsp'">취소</button>
	</p>
	</td>
</tr>
</table>
</form>		
<!-- 상품 등록 -->
</td>
</tr>
</table>
</body>
</html>