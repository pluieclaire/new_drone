<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="com.spring.drone.so.SomoimPostVO"%>
<%@ page import="com.spring.drone.so.SomoimVO"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%
   	ArrayList<SomoimPostVO> somoimPostList = (ArrayList<SomoimPostVO>)request.getAttribute("somoimPostList");
   	SomoimVO somoimVO = (SomoimVO)request.getAttribute("somoimVO");
   	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
   	String id = (String)session.getAttribute("id");
	String nickname = (String)session.getAttribute("nickname");
	Integer authority = (Integer)session.getAttribute("authority");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Drone_Picnic_Community</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>

<%-- <script src="${pageContext.request.contextPath}/resources/js/detail_post.js"></script>--%>
<script src="${pageContext.request.contextPath}/resources/js/detail_chat.js"></script> 
<script type="text/javascript">
function deletePost(num){
	
	var con = confirm("글을 지우시겠습니까?");
    if(con == true){
    	$.ajax({
    		url : '/drone/deletePost.somo?num=' + num,
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

function modifyPost(num){
	var params = $("#modifyform" + num).serialize();
	
	$.ajax({
		url : '/drone/modifyPost.somo',
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


function insertPost(num){
	var params = $("#form" + num).serialize();
	//alert('params' + params);
	$.ajax({
		url : '/drone/insertPost.somo',
		type : 'POST',
		data : params,
		dataType : "json",
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		success : function(retVal) {
			if (retVal.res == "OK") {
				selectData();
				$('#body').val('');
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
	//alert("<%=somoimVO.getNum()%>");
	$('div#output').empty();
	
	
	$.ajax({
		url : '/drone/getPostList.somo?somoim_num=' + <%=somoimVO.getNum()%>,
		type : 'GET',
		//data : params,
		dataType : "json",
		async: false,
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		success : function(data) {
			//alert("data : " + Object.keys(data).length);
			var postcount = "&nbsp;&nbsp;총&nbsp;" + Object.keys(data).length + "개의 댓글이 있습니다. <br />";
			$('div#output').append(postcount);
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
				var num = item.num;
				
				var output = "<table class='mt-3 table table-sm'>";
				output += "<tr><td rowspan='3' width='" + re_level_space + "px;' bgcolor='#eff3f9'></td>";
				output += '<td>';
				output += item.nickname + '&nbsp;님&nbsp;&nbsp;&nbsp;' + Date(item.pdate) + '</td></tr>';
				output += '<tr><td><a data-toggle="collapse" href="#collapseModify';
				output += index + '" role="button" aria-expanded="false" aria-controls="collapseModify';
				output += index + '">수정하기</a>';
				output += '  │ <a href="#" onclick="deletePost(' + item.num + ')">삭제하기</a> │ ';
				output += '<a data-toggle="collapse" href="#collapseReply';
				output += index + '" role="button" aria-expanded="false" aria-controls="collapseReply';
				output += index + '">답글달기</a></td></tr>';
				output += '<tr><td>' + item.body + '</td></tr>';
				output += '</table>'
				
				/* 글 COLLAPSE 시작 */
				output += '<div class="collapse p-2" id="collapseReply' + index + '">';
				output += '<form id="form'+ item.num +'" action="javascript:insertPost('+ item.num +')" name="form" method="post">';
				output += '<input type="hidden" id="somoim_num" name="somoim_num" value="'+ item.somoim_num +'" />';
				output += '<input type="hidden" id="num" name="num" value="'+ item.num +'" />';
				output += '<input type="hidden" id="id" name= "id" value="<%=id%>" readonly/>';
				output += '<input type="hidden" id="ref" name="ref" value="' + item.ref + '" />';
				output += '<input type="hidden" id="re_level" name="re_level" value="' + item.re_level + '" /> ';
				output += '<input type="hidden" id="re_step" name="re_step" value="' + item.re_step + '" /> ';
				output += '<div class="row pb-0"><div class="col-sm-3"><span class="smallest_logo">NAME</span>';
				output += '</div><div class="col-sm-9 align-left">';
				
				output += '<input type="text" id="nickname" name="nickname" class="border_input korean mb-2 textarea_width" value="<%=nickname%>" readonly/>';
				output += '</div></div><div class="row mb-2"><div class="col-sm-3 align-center"><span class="smallest_logo">CONTENT</span>';
				output += '</div><div class="col-sm-9 align-center">';
				output += '<textarea class="border_input korean textarea_width" rows="5" name="body" id="body" placeholder="메시지 입력"></textarea>';
				output += '</div></div>';
				output += '<button type="submit" class="btn btn-lg button_bg_blue korean_center">글쓰기</button>&nbsp;&nbsp;';
				output += '<button class="btn btn-lg button_bg_blue korean_center" type="button"';
				output += ' data-toggle="collapse" data-target="#collapseReply';
				output += index + '" aria-expanded="false" aria-controls="collapseReply' + index + '">';
				output += '취소</button></form></div>';
				
				/* 수정부분 COLLAPSE 시작 */
				output += '<div class="collapse p-2" id="collapseModify' + index + '">';
				output += '<form id="modifyform'+ item.num +'" action="javascript:modifyPost('+ item.num +')" name="form" method="post">';
				output += '<input type="hidden" id="somoim_num" name="somoim_num" value="'+ item.somoim_num +'" />';
				output += '<input type="hidden" id="num" name="num" value="'+ item.num +'" />';
				output += '<input type="hidden" id="id" name= "id" value="<%=id%>" readonly/>';
				output += '<div class="row pb-0"><div class="col-sm-3"><span class="smallest_logo">NAME</span>';
				output += '</div><div class="col-sm-9 align-left">';
				
				output += '<input type="text" id="nickname" name="nickname" class="border_input korean mb-2 textarea_width" value="<%=nickname%>" readonly/>';
				output += '</div></div><div class="row mb-2"><div class="col-sm-3 align-center"><span class="smallest_logo">CONTENT</span>';
				output += '</div><div class="col-sm-9 align-center">';
				output += '<textarea class="border_input korean textarea_width" rows="5" name="body" id="body">'+ item.body +'</textarea>';
				output += '</div></div>';
				output += '<button type="submit" class="btn btn-lg button_bg_blue korean_center">수정</button>&nbsp;&nbsp;';
				output += '<button class="btn btn-lg button_bg_blue korean_center" type="button" data-toggle="collapse" data-target="#collapseModify' + index + '" aria-expanded="false" aria-controls="collapseModify' + index + '">';
				output += '취소</button></form></div>';
				
				output += "</div>";
				
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
	//alert("시험중이당");
	selectData();

	$('#write').click( function(event) {
		var params = $("#form").serialize();
		
		//alert('params' + params);
		$.ajax({
			url : '/drone/insertPost.somo',
			type : 'POST',
			data : params,
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success : function(retVal) {
				if (retVal.res == "OK") {
					selectData();
					$('#body').val('');
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
</head>

<body>
<div class="container"> 
   <!-- 소모임 대문 사진, 메뉴 -->  
<div class="row mt-1 mb-1 pt-5"
	style="background-image: url('<spring:url value='/image/somo_logo/' /><%=somoimVO.getStoredFileName()%>'); background-size: cover; background-position: center; ">
	<div class="col-lg-12 line_color_yellow_b text_align_center mb-5">
		<p class="small_logo text_border">YOUR CIRCLE</p>
		<p class="korean_center text_border"><%=somoimVO.getName() %>&nbsp;|&nbsp;<%=somoimVO.getIntro() %></p>
	</div>
	<br /> <br />
</div>

<div class="row mt-1 mb-1 pt-5">
	<div class="col-lg-12 text_align_center">
		<p class="korean_center">소모임 정보 │ 소모임사진첩 │ 가입회원</p>
	</div>
</div>
   
   <!-- 본문 -->
  
      <div class="row">
         <div class="so_content col-lg-9">
            <!-- 소모임 사진 -->         
            <jsp:include page="./so_album.jsp" /> 
		
      <!-- 소모임 게시글-->
      	
	
	<div class="row mt-3">
		<div class="col-sm-10 offset-sm-1 mb-0 p-0">
			<p class="detail_logo">TALK</p>
			<p class="korean">소모임 소통 창구입니다.</p>
		</div>
	</div>
	
	
	<div class="row mt-0">
		<div class="col-sm-10 offset-sm-1 shadow bg-white rounded korean_center mb-0 p-4">
			<form id="form" name="form" method="post">
				<input type="hidden" id="somoim_num" name="somoim_num" value="<%=somoimVO.getNum() %>" />
				<input type="hidden" id="num" name="num" value="0" />
				<input type="hidden" id="id" name= "id" value="<%=id %>" />
				<input type="hidden" id="ref" name="ref" value="0" />
				<input type="hidden" id="re_level" name="re_level" value="0" /> 
				<input type="hidden" id="re_step" name="re_step" value="0" /> 
				<div class="row pb-0">
					<div class="col-sm-3">
						<span class="smallest_logo">NAME</span>
					</div>
					<div class="col-sm-9 align-left">
						<input type="text" id="nickname" name="nickname" class="border_input korean mb-2 textarea_width"
					value="<%=nickname %>" readonly/>
					</div>
				</div>
				<div class="row mb-2">
					<div class="col-sm-3 align-center">
						<span class="smallest_logo">CONTENT</span>
					</div>
					<div class="col-sm-9 align-center">
						<textarea class="border_input korean textarea_width" rows="5" name="body" id="body" placeholder="메시지 입력"></textarea>
					</div>
				</div>
				<button type="submit" id="write" class="btn btn-lg button_bg_blue korean_center">글쓰기</button>
				<button type="reset" class="btn btn-lg button_bg_blue korean_center">지우기</button>
			</form>
		</div>
	</div>
	
	<div class="row mt-0">
		<div class="col-sm-10 offset-sm-1 mb-3 p-4" id="newest_output">
			
		</div>
	</div>
	<div class="row mt-0">
		<div class="col-sm-10 offset-sm-1 shadow bg-white rounded korean mb-0 p-4" id="output">
			
		</div>
	</div>
<%-- 	<div class="row mt-5">
		<div class="col-sm-10 offset-sm-1 mb-3 p-4">
			<%
			if(somoimPostList.size() == 0){
			%>
			<p class="korean_center">등록된 소모임 게시글이 없습니다.</p>
			<%
			}
			else{
	            for (int i=0;i<somoimPostList.size();i++){
	               SomoimPostVO somoimPostVO = somoimPostList.get(i);
	            %>
            <div class="row mt-2">
               <div class="col-lg-12 line_color_blue_b pl-3 pr-3 pb-3 pt-1 korean" id="somoim_post">
                  <p class="text-right">수정하기  │ 삭제하기 │ 답글달기 </p>
                  <p class="text-left"><%=somoimPostVO.getNickname() %> 님 &nbsp;&nbsp;│ &nbsp;&nbsp;<%=sdf.format(somoimPostVO.getPdate()) %></p>
                  <p class="text-left"><%=somoimPostVO.getBody() %></p>
               </div>
            </div>
            <%
            	}
			}
            %>
		</div>
	</div> --%>
	
	<div class="row mt-0">
		<div class="col-sm-10 offset-sm-1 mb-3 p-4" id="older_ouput">
			
		</div>
	</div>
</div>
         
          <div class="so_sidemenu col-lg-3">
            <!-- appointmentList -->                     
             <div class="row pt-1">
               <jsp:include page="./so_getAppointList.jsp" />
            </div> 
            <br/>
            <!-- memberList -->            
            <div class="row pt-1">
               <jsp:include page="./so_getMemberList.jsp" />
            </div>
            
         </div>  
      </div>
  	</div>
<script type="text/javascript">

w = new WebSocket("ws://localhost:8800/drone/broadcasting?nickname=<%=nickname%>");
   w.onopen = function() {
      alert("WebSocket Connected");
   }
   w.onmessage = function(e) {
      log(e.data.toString());
   }
   w.onclose = function(e) {
      log("WebSocket closed");
   }
   w.onerror = function(e) {
      log("WebSocket error");
   }
   window.onload = function() {
      document.getElementById("send_button").onclick = function() {
         if (document.getElementById("input").value == "")      //메세지 입력란이 공백일 경우
            {
            alert("메세지 입력해");
            }
         else{
            var input = document.getElementById("input").value;
            w.send("<%=nickname%>" + "/" + input);
            document.getElementById("input").value = ""; 
         }
      }; document.getElementById("chat").scrollTop = document.getElementById("chat").scrollHeight;

   }

   var log = function(s){
      var m = s.split("/");
      if(m[0] === 'message'){      //메세지일 경우
         if(m[1] == "<%=nickname%>") {      //메세지 보낸 사람이 본인일 경우 출력
            var div1 = document.createElement("div");
            div1.setAttribute("class", "outgoing_msg");
            var div2 = document.createElement("div");
            div2.setAttribute("class", "sent_msg");
            var p = document.createElement("p");
            var span = document.createElement("span");
            span.setAttribute("class", "time_date");
              var date = new Date();
              var hour = date.getHours();
              p.innerText = "내가 말해따 " + "\n" + "\n" + m[2];
              if(hour <= 12) {
                 span.innerText = hour + "시" + date.getMinutes() + "분" + "AM";
              }
              else {
                 span.innerText = hour-12 + "시" + date.getMinutes() + "분" + "PM";
              }
              div1.appendChild(div2);
              div2.appendChild(p);
              p.appendChild(span);
              $('#chat').append(div1);
         }
         else{      //본인이 아닌 사람의 메세지 출력
            var div1 = document.createElement("div");
            div1.setAttribute("class", "incoming_msg");
            var div2 = document.createElement("div");
            div2.setAttribute("class", "incoming_msg_img");
            var div3 = document.createElement("div");
            div3.setAttribute("class", "received_msg");
            var div4 = document.createElement("div");
            div4.setAttribute("class", "received_withd_msg");
            var p = document.createElement("p");
            var span = document.createElement("span");
            span.setAttribute("class", "time_date");
            var date = new Date();
              var hour = date.getHours();
              p.innerText = m[1] + "\n" + "\n" + m[2];
              if(hour <= 12) {
                 span.innerText = hour + "시" + date.getMinutes() + "분" + "AM";
              }
              else {
                 span.innerText = hour-12 + "시" + date.getMinutes() + "분" + "PM";
              }
              div1.appendChild(div2);
              div2.appendChild(div3);
              div3.appendChild(div4);
              div4.appendChild(p);
              p.appendChild(span);
              $('#chat').append(div1);
         } 
      }
      else if(m[0] === 'nicknameList'){      //닉네임리스트일 경우
         $('#inbox_chat').empty();
         for(var i=1; i<m.length; i++){
            if(i == m.length-1){ continue;}
            var div1 = document.createElement("div");
            div1.setAttribute("class", "chat_list");
            var div2 = document.createElement("div");
            div2.setAttribute("class", "chat_people");
            var div3 = document.createElement("div");
            div3.setAttribute("class", "chat_img");
            var div4 = document.createElement("div");
            div4.setAttribute("class", "chat_ib");
            var h5 = document.createElement("h5");
            h5.setAttribute("id", "nicknameList");
            h5.innerText = "@" + m[i];
            
              div1.appendChild(div2);
              div2.appendChild(div3);
              div3.appendChild(div4);
              div4.appendChild(h5);
              
              $('#inbox_chat').append(div1);
              
         }
         
      } document.getElementById("chat").scrollTop = document.getElementById("chat").scrollHeight; 
   }

   function enterkey() {
        if (window.event.keyCode == 13) {
             // 엔터키가 눌렸을 때 실행할 내용
             if (document.getElementById("input").value == "")
            {
            alert("메세지 입력해");
            }
         else{
            var input = document.getElementById("input").value;
            w.send("<%=nickname%>" + "/" + input);
            document.getElementById("input").value = "";
         }
      }
      document.getElementById("chat").scrollTop = document
            .getElementById("chat").scrollHeight;
   }
</script>
</body>
</html>