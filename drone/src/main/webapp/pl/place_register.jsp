<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.spring.drone.pl.PlaceVO"%>
<%
	String id = (String)session.getAttribute("id");
	String nickname = (String)session.getAttribute("nickname");
	Integer authority = (Integer)session.getAttribute("authority");
%>

<form action="/post" method="post" id="place_register_form">
	<div class="place_register_head">
		<h2>장소 등록하기</h2>		
	</div>
	<div class="form-group">
		<input type="hidden" class="form-control" id="place_register_coord" name="Place_Coord" value="클릭한 좌표"/>
		<input type="hidden" class="form-control" name="User_Id" value="수정한 ID"/>		
		<input type="hidden" class="form-control" id="place_register_add" name="Place_Add" value=" 클릭한 주소  "/>			
	</div>	
	<div class="form-group">
		<input type="text" maxlength="10" class="form-control" name="Place_Name" placeholder=" 장소명을 입력해주세요  "/>
	</div>
	<div class="form-group">
		<select class="form-control" name="Place_Cate">
			<option value="newAero">신규 비행구역1</option>
			<option value="personalAero">드론 비행장(사설)</option>
			<option value="parkAero">드론 공원</option>
		</select>    
	</div>
	<div>
		<textarea maxlength="70" class="form-control" name="Place_Desc" rows="7" placeholder=" 설명을 입력해주세요 :) " ></textarea>
	</div>	
	<div>
		<b><input type="button" class="btn btn-primary" id="place_register_button" value="신규 장소 등록하기!"></b>
	</div> 
</form> <!-- action="/post" method="post" -->

<script>

/*--------------------------------*/
/*    ajax로 place_list 불러오기        */
/*--------------------------------*/
function selectData() {
	//table내부 내용을 제거(초기화)
	$('div#products').empty();

	$.ajax({
		url : '/drone/getPlaceJSON.pl',
		type : 'POST',
		dataType : 'json',
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		success : function(data) {
			$.each(data, function(index, item) {
				console.log("item을 Parse 할 것 : " + item);
				console.log("item.place_Name : " + item.place_Name);
				console.log("item.place_Add : " + item.place_Add);
				console.log("item.place_Desc : " + item.place_Desc);
				console.log("item.user_Id : " + item.user_Id);
				console.log("item.place_Coord : " + item.place_Coord);
				console.log("item.place_Cate : " + item.place_Cate);
				console.log("================");
				
var output = "";
					
output += '<div class="item col-xs-4 col-lg-4"><!-- card -->';
output += '<div class="thumbnail card">';
output += '	<div class="img-event">';
output += '		<img class="group list-group-image img-fluid" ';
output += '			src="http://placehold.it/400x250/000/fff" alt="" ';
output += '			onclick="mapZoom(\'';
output += '			'+ item.place_Name + '\', \'' + item.place_Add + '\', \'';
output += '			'+ item.place_Desc +  '\', \''+ item.user_Id + '\', \'';
output += '			'+ item.place_Coord + '\', \'' + item.place_Cate + '\')" />';
output += '';
output += '			 <!-- function mapZoom(Place_Name, Place_Add, Place_Desc, User_Id, Place_Coord ,Place_Cate){ -->';
output += '	</div>';
output += '';
output += '	<div class="caption card-body">';
output += '		<h4 class="place_list_name"> ' + item.place_Name + ' </h4>';
output += '		<hr/>';
output += '		<h6 class="place_list_address"> ' + item.place_Add + ' </h6>';
output += '		<div class="row">';
output += '			<div class="col-xs-12 col-md-8"> ';
output += '				<p class="place_list_category"> 분류: ' + item.place_Cate + '</p>';
output += '			</div> <!--분류 -->	';
output += '			<div class="col-xs-12 col-md-4">';
output += '			    <button type="button" class="btn btn-primary" onclick="place_list_desc_button()">장소설명</button>';
output += '			</div> <!-- 버튼 -->';
output += '		</div>';
output += '		<p class="collapse place_list_desc">';
output += '			' + item.place_Desc;
output += '		</p>';
output += '	</div><!-- "caption card-body" -->';
output += '	</div><!-- "thumbnail card" -->';
output += '</div><!-- card -->';
		
			 	console.log("output: "	+ output);
				$('div#products').append(output);

			});
		},
		error : function(request, status, error) {
	        console.log("code: " + request.status + "\n" + request.responseText + 
	        		"\n" + "error" + error);
		}
	});
}

/*-------------------------------------------------*/
/*   "장소 등록" 누르면 DB 저장 후 ajax로 목록 다시 불러오기    */
/*-------------------------------------------------*/
$('#place_register_button').click( function(event) {
	console.log("=place_register_button: ");
	var params = $("#place_register_form").serialize();
	console.log("=params: " + params);
	
	$.ajax({
		url : '/drone/placeRegister.pl',
		type : 'post',
		data : params,
		dataType : 'json',
 		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		
		success : function(retVal) {
			if(retVal.res == "OK"){
				console.log("DB 연결 (성공), res: " + retVal.res);
				selectData();
				
			}else{
				console.log("DB 연결 (실패), res: " + retVal.res);
			}
		},
		error : function(request, status, error) {
	        console.log("code: " + request.status + "\n" + request.responseText + 
	        		"\n" + "error" + error);
		}
	});
	//기본 이벤트 제거
	event.preventDefault();
});



</script>


<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
            
<!-- Bootsrap CDN -->
<!-- 링크를 통해 서버로 부터 파일을 받아오는 cdn 방식으로 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" ></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
.wrap {
    text-align: center;
}

a.submit:hover {
    color: rgba(255, 255, 255, 0.85);
    box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
    text-decoration: none !important 
}      
</style>

    