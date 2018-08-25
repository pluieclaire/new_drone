<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.spring.drone.co.AlbumVO"%>
<%-- <%@ page import="com.spring.drone.co.AlbumPageVO"%> --%>
<%@ page import="com.spring.drone.co.AlbumReplyVO"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import ="java.util.*" %>
<%@ page import ="java.sql.*" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<%
	AlbumVO vo = (AlbumVO) request.getAttribute("albumVO");
	/* AlbumPageVO pageVO = (AlbumPageVO) request.getAttribute("pageVO"); */
	/* ArrayList<AlbumReplyVO> replyList = (ArrayList<AlbumReplyVO>) request.getAttribute("replyList");
	 */SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

 	String id = (String)session.getAttribute("id");
	String nickname = (String)session.getAttribute("nickname");
	Integer authority = (Integer)session.getAttribute("authority");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Album_detail</title>
</head>
<body>

<div class="container">
		<div class="row line_color_yellow_b mt-1 mb-1 pt-5">
			<div class="col-lg-12 text_align_center">
				 <p class="small_logo">PHOTOGRAPHY</p>
				 <p class="korean_center">드론으로 찍은 사진을 올려주세요</p>
			</div>
		</div>
		<div class="row mt-1 mb-1 pt-5">
			<div class="col-lg-12 text_align_center">
				 <p class="korean_center"><a href="template.templ?page=co_p_write.co">사진 올리기</a> │ 목록으로 돌아가기</p>
			</div>
		</div>   

   
  <div class="row">
     <div class="col-sm-6 justify-content-center align-items-center"  style="font-size: 14px; text-align: center; font-weight: bold; line-height: 1.5em;">
	     <div class="shadow p-4 mb-5 bg-white rounded korean_center">
	      	<div class="row">
	      		<div class="col-sm-6">
	      			 <img src="${pageContext.request.contextPath}/resources/img/small/1.jpg" class="rounded-circle" width="80px" />
	      		</div>
	      		<div class="col-sm-6 text-left pt-3">
	      			<p><%=vo.getTitle() %></p><p>by <%=vo.getNickname() %></p>   
	      		</div>
	      	</div>
      	</div>
      </div>

      	
      
      <div class="col-sm-5 korean ml-1">
          <p><img src="${pageContext.request.contextPath}/resources/img/small/3.jpg" class="rounded-circle" width="30px" />
          	&nbsp;좋아요</p>
          <p><img src="${pageContext.request.contextPath}/resources/img/small/2.jpg" class="rounded-circle" width="30px" />
          	&nbsp;조회수</p>
          <p><img src="${pageContext.request.contextPath}/resources/img/small/1.jpg" class="rounded-circle" width="30px" />
          	&nbsp;<a href="template.templ?page=co_p_modify_form.co?num=<%=vo.getNum()%>">글 수정하기</a> | 글 삭제하기</p>
         
      </div>
   </div>
   

     <!-- Carousel -->
   <div class="row">
   <div class="col-sm-12 mb-20 justify-content-center align-items-center">
     <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
      
      	<%
	      	StringTokenizer parsed = new StringTokenizer(vo.getStoredFileName(), "///", false);
			ArrayList<String> parsedSet = new ArrayList<String>();
			while(parsed.hasMoreTokens()){
				parsedSet.add(parsed.nextToken());
			}
			
		%>
		<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
		<%
			for (int i = 1;i<parsedSet.size();i++){
      	%>
       <li data-target="#carouselExampleIndicators" data-slide-to="<%=i%>"></li>
		<%
			}
		%>
       </ol>
     <div class="carousel-inner">
     <div class="carousel-item active">
      	<img class="d-block w-100" src="<spring:url value='/image/album/' /><%=parsedSet.get(0).toString()%>" alt="<%=vo.getTitle()%>">
     </div>
     
     	<%
			for (int i = 1;i<parsedSet.size();i++){
		%>
     
     
     <div class="carousel-item">
      	<img class="d-block w-100" src="<spring:url value='/image/album/' /><%=parsedSet.get(i).toString()%>" alt="<%=vo.getTitle()%>">
     </div>
     <%
				}
     %>
    
     </div>
     <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
       <span class="carousel-control-prev-icon" aria-hidden="true"></span>
       <span class="sr-only">Previous</span>
     </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
       <span class="carousel-control-next-icon" aria-hidden="true"></span>
       <span class="sr-only">Next</span>
     </a>
   </div>
   </div>
   </div>
<br />
<br />

   <div class="row">
   <div class="col-sm-6">
   <div id="map-canvas" style="height: 500px;"></div>
   </div>
   <div class="col-sm-6 pl-2 pt-2">
   <h4 class="small_logo">MORE INFO</h4>
   <br />
   
			<table class="table table-hover">
				<tbody>
			       <tr>
			         <th scope="row" class="detail_logo">DATE</th>
			         <td class="korean align-middle"><%=sdf.format(vo.getPdate()) %></td>
			       </tr>
			       <tr>
			         <th scope="row" class="detail_logo">DRONE</th>
			         <td class="korean align-middle"><%=vo.getPname() %></td>
			       </tr>
			       <tr>
			         <th scope="row" class="detail_logo">PLACE</th>
			         <td class="korean align-middle">한강 광나루 드론 공원  </td>
			       </tr>
			       <tr>
			         <th scope="row" class="detail_logo">CATEGORY</th>
			         <td class="korean align-middle"><%=vo.getCategory() %></td>
			       </tr>
			       <tr>
			         <th scope="row" class="detail_logo">TYPE</th>
			         <td class="korean align-middle">Photo, Video</td>
			       </tr>
    			</tbody>
   			</table>
   			<br />
   
		   	<div class="col-sm-12 justify-content-right align-items-center p-0">
			    <div class="form-group col-sm-12 p-0">   
				    <form>          
				      <textarea name="message" class="form-control required korean p-3" id="message" 
				      title="Message" rows=4 readonly><%=vo.getBody() %></textarea>
				    </form>      
		     	</div>
		   	</div>   
		</div>
	</div>
   
   <br />
	<div class="row">
	   <div class="col-sm-6 justify-content-left align-items-center">
	         <h4 class="detail_logo">TAGS</h4>
	         <span class="korean">#여긴 어디</span>
	         <span class="korean">#여긴 어디</span>
	         <span class="korean">#여긴 어디</span>
	         <span class="korean">#여긴 어디</span>
	         <span class="korean">#여긴 어디</span>
	         <span class="korean">#여긴 어디</span>
	   </div>
	</div>
	<div class="row mt-5">
		<div class="col-md-8 offset-md-2 shadow bg-white rounded korean mb-3 p-4" id="output">
		
		</div>
	
	
		<div class="col-md-8 offset-md-2 mb-3 p-1">
			<p class="detail_logo">TALK</p>
			<p class="korean">답글을 남겨주세요</p>
		</div>
		<div class="col-md-8 offset-md-2 shadow bg-white rounded korean_center mb-3 p-4">
			<form id="form" name="form" method="post">
				<input type="hidden" id="num" name="num" value="<%=vo.getNum() %>" />
				<input type="hidden" id="renum" name="renum" value="0" />
				<input type="hidden" id="reid" name= "reid" value="<%=id %>" />
				<input type="hidden" id="ref" name="ref" value="0" />
				<input type="hidden" id="re_level" name="re_level" value="0" /> 
				<input type="hidden" id="re_step" name="re_step" value="0" /> 
				<div class="row pb-0">
					<div class="col-sm-3">
						<span class="smallest_logo">NAME</span>
					</div>
					<div class="col-sm-9 align-left">
						<input type="text" id="renickname" name="renickname" class="border_input korean mb-2 textarea_width"
					value="<%=nickname %>" readonly/>
					</div>
				</div>
				<div class="row mb-2">
					<div class="col-sm-3 align-center">
						<span class="smallest_logo">CONTENT</span>
					</div>
					<div class="col-sm-9 align-center">
						<textarea class="border_input korean textarea_width" rows="5" name="rebody" id="rebody" placeholder="메시지 입력"></textarea>
					</div>
				</div>
				<button type="submit" id="write" class="btn btn-lg button_bg_blue korean_center">글쓰기</button>
				<button type="reset" class="btn btn-lg button_bg_blue korean_center">지우기</button>
			</form>
		</div>
	</div>



</div>
<script type="text/javascript">
function deleteReply(renum){
	alert(renum);
	var con = confirm("댓글을 지우시겠습니까?");
    if(con == true){
    	$.ajax({
    		url : '/drone/deleteAlbumReply.co?renum=' + renum,
    		type : 'GET',
    		dataType : "json",
    		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
    		success : function(retVal) {
    			if (retVal.res == "OK") {
    				selectData();
    			} else {
    				alert("게시글 삭제 실패");
    			}
    		},
        	error : function(request,status,error){
        		console.log('code:'+request.status + "\n" + "message:" + request.responseText+"\n"+"error:"+error);
        	}
    	});
    	//기본 이벤트 제거
    	event.preventDefault();
    }
    else{
    	
    }
	
}

function modifyReply(renum){
	var params = $("#modifyform" + renum).serialize();
	
	$.ajax({
		url : '/drone/modifyAlbumReply.co',
		type : 'POST',
		data : params,
		dataType : "json",
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		success : function(retVal) {
			if (retVal.res == "OK") {
				selectData();
			} else {
				alert("게시글 수정 실패");
			}
		},
    	error : function(request,status,error){
    		console.log('code:'+request.status + "\n" + "message:" + request.responseText+"\n"+"error:"+error);
    	}
	});
	//기본 이벤트 제거
	event.preventDefault();
}


function insertReReply(num){
	var params = $("#form" + num).serialize();
	//alert('params' + params);
	$.ajax({
		url : '/drone/insertAlbumReply.co',
		type : 'POST',
		data : params,
		dataType : "json",
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		success : function(retVal) {
			if (retVal.res == "OK") {
				selectData();
				$('#renickname').val('');
				$('#rebody').val('');
			} else {
				alert("게시글 입력 실패");
			}
		},
    	error : function(request,status,error){
    		console.log('code:'+request.status + "\n" + "message:" + request.responseText+"\n"+"error:"+error);
    	}
	});
	//기본 이벤트 제거
	event.preventDefault();
}
function selectData() {
	//table내부 내용을 제거(초기화)
	$('div#output').empty();
	
	
	$.ajax({
		url : '/drone/getAlbumReplyList.co?num=' +<%=vo.getNum()%>,
		type : 'GET',
		//data : params,
		dataType : "json",
		async: false,
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		success : function(data) {
			//alert("data : " + Object.keys(data).length);
			var replycount = "&nbsp;&nbsp;총&nbsp;" + Object.keys(data).length + "개의 댓글이 있습니다. <br />";
			$('div#output').append(replycount);
			$.each(data, function(index, item) {
				
				//alert("item.re_level : " + item.re_level);
				//console.log("co_p_viewindex, ajax, index: " + index);
				var re_level_space = 0
				if (item.re_level == 0){
					re_level_space = 1;
				}
				else{
					re_level_space = item.re_level*50;
				}
				var renum = item.renum;
				
				var output = "<table class='mt-3 table table-sm table-borderless'>";
				output += "<tr><td rowspan='3' width='" + re_level_space + "px;' bgcolor='#eff3f9'></td>";
				output += '<td>';
				output += item.renickname + '&nbsp;님&nbsp;&nbsp;&nbsp;' + Date(item.pdate) + '</td></tr>';
				output += '<tr><td><a data-toggle="collapse" href="#collapseModify';
				output += index + '" role="button" aria-expanded="false" aria-controls="collapseModify';
				output += index + '">수정하기</a>';
				output += '  │ <a href="#" onclick="deleteReply(' + item.renum + ')">삭제하기</a> │ <a data-toggle="collapse" href="#collapseReply' + index + '" role="button" aria-expanded="false" aria-controls="collapseReply' + index + '">답글달기</a></td></tr>';
				output += '<tr><td>' + item.rebody + '</td></tr>';
				output += '</table>'
				
				/* 대댓글 COLLAPSE 시작 */
				output += '<div class="collapse p-2" id="collapseReply' + index + '">';
				output += '<form id="form'+ item.renum +'" action="javascript:insertReReply('+ item.renum +')" name="form" method="post">';
				output += '<input type="hidden" id="num" name="num" value="'+ <%=vo.getNum() %> +'" />';
				output += '<input type="hidden" id="renum" name="renum" value="'+ item.renum +'" />';
				output += '<input type="hidden" id="reid" name= "reid" value="<%=id%>" readonly/>';
				output += '<input type="hidden" id="ref" name="ref" value="' + item.ref + '" />';
				output += '<input type="hidden" id="re_level" name="re_level" value="' + item.re_level + '" /> ';
				output += '<input type="hidden" id="re_step" name="re_step" value="' + item.re_step + '" /> ';
				output += '<div class="row pb-0"><div class="col-sm-3"><span class="smallest_logo">NAME</span>';
				output += '</div><div class="col-sm-9 align-left">';
				
				output += '<input type="text" id="renickname" name="renickname" class="border_input korean mb-2 textarea_width" value="<%=nickname%>" readonly/>';
				output += '</div></div><div class="row mb-2"><div class="col-sm-3 align-center"><span class="smallest_logo">CONTENT</span>';
				output += '</div><div class="col-sm-9 align-center">';
				output += '<textarea class="border_input korean textarea_width" rows="5" name="rebody" id="rebody" placeholder="메시지 입력"></textarea>';
				output += '</div></div>';
				output += '<button type="submit" class="btn btn-lg button_bg_blue korean_center">글쓰기</button>&nbsp;&nbsp;';
				output += '<button class="btn btn-lg button_bg_blue korean_center" type="button" data-toggle="collapse" data-target="#collapseReply' + index + '" aria-expanded="false" aria-controls="collapseReply' + index + '">';
				output += '취소</button></form></div>';
				
				/* 수정부분 COLLAPSE 시작 */
				output += '<div class="collapse p-2" id="collapseModify' + index + '">';
				output += '<form id="modifyform'+ item.renum +'" action="javascript:modifyReply('+ item.renum +')" name="form" method="post">';
				output += '<input type="hidden" id="num" name="num" value="'+ <%=vo.getNum() %> +'" />';
				output += '<input type="hidden" id="renum" name="renum" value="'+ item.renum +'" />';
				output += '<input type="hidden" id="reid" name= "reid" value="<%=id%>" readonly/>';
				output += '<div class="row pb-0"><div class="col-sm-3"><span class="smallest_logo">NAME</span>';
				output += '</div><div class="col-sm-9 align-left">';
				
				output += '<input type="text" id="renickname" name="renickname" class="border_input korean mb-2 textarea_width" value="<%=nickname%>" readonly/>';
				output += '</div></div><div class="row mb-2"><div class="col-sm-3 align-center"><span class="smallest_logo">CONTENT</span>';
				output += '</div><div class="col-sm-9 align-center">';
				output += '<textarea class="border_input korean textarea_width" rows="5" name="rebody" id="rebody">'+ item.rebody +'</textarea>';
				output += '</div></div>';
				output += '<button type="submit" class="btn btn-lg button_bg_blue korean_center">수정</button>&nbsp;&nbsp;';
				output += '<button class="btn btn-lg button_bg_blue korean_center" type="button" data-toggle="collapse" data-target="#collapseModify' + index + '" aria-expanded="false" aria-controls="collapseModify' + index + '">';
				output += '취소</button></form></div>';
				
				
				
				output += "</div>";
				output += '';

				
				console.log("output: "	+ output);
				$('div#output').append(output);
			});
		},
		error : function(jqXHR, exception) {
			var msg = '';
	        if (jqXHR.status === 0) {
	            msg = 'Not connect.\n Verify Network.';
	        } else if (jqXHR.status == 404) {
	            msg = 'Requested page not found. [404]';
	        } else if (jqXHR.status == 500) {
	            msg = 'Internal Server Error [500].';
	        } else if (exception === 'parsererror') {
	            msg = 'Requested JSON parse failed.';
	        } else if (exception === 'timeout') {
	            msg = 'Time out error.';
	        } else if (exception === 'abort') {
	            msg = 'Ajax request aborted.';
	        } else {
	            msg = 'Uncaught Error.\n' + jqXHR.responseText;
	        }
	        alert("selectData error: " + msg);
		}
	});

}
$(document).ready(function() {
	selectData();

	$('#write').click( function(event) {
		var params = $("#form").serialize();
		
		alert('params' + params);
		$.ajax({
			url : '/drone/insertAlbumReply.co',
			type : 'POST',
			data : params,
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success : function(retVal) {
				if (retVal.res == "OK") {
					selectData();
					$('#renickname').val('');
					$('#rebody').val('');
				} else {
					alert("게시글 입력 실패");
				}
			},
        	error : function(request,status,error){
        		console.log('code:'+request.status + "\n" + "message:" + request.responseText+"\n"+"error:"+error);
        	}
		});
		//기본 이벤트 제거
		event.preventDefault();
	});
	selectData();
});
</script>
<!--gmap js 임포트-->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=true">
</script>    

<!--javascript 소스코드-->
   <script type="text/javascript">
      function initialize() {
           var myLatlng;
           var map;
           var marker;


    <!-- 구글맵에서 좌표값을 얻고 입력해주세요.  -->
    myLatlng = new google.maps.LatLng(37.482627, 126.928510);  

       
   var mapOptions = {
                    zoom: 17, <!--지도 확대, 축소 정도 설정 -->
                    center: myLatlng,
                    mapTypeId: google.maps.MapTypeId.ROADMAP,
                    scrollwheel: false, <!-- 마우스 스크롤 false -->
                    draggable: false<!-- 마우스 드레그(클릭) false -->
        };

        map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
        
        <!-- 위치정보이름 및 위치정보주소 입력하세요. -->
        var contentString ='<p style="line-height: 20px;">위치정보이름</p><p>위치정보주소</p>'; 

        var infowindow = new google.maps.InfoWindow({
                content: contentString
        });

        marker = new google.maps.Marker({
                position: myLatlng,
                map: map,
                title: 'Marker'
        });

        infowindow.open(map, marker);

        google.maps.event.addListener(marker, 'click', function () {
                infowindow.open(map, marker);
        });
}

google.maps.event.addDomListener(window, 'load', initialize);
</script>





</body>
</html>