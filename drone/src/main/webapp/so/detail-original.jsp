<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="com.spring.drone.so.SomoimPostVO"%>
<%@ page import="com.spring.drone.so.SomoimVO"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%
System.out.println("시험중");
   ArrayList<SomoimPostVO> somoimPostList = (ArrayList<SomoimPostVO>)request.getAttribute("somoimPostList");
   SomoimVO somoimVO = (SomoimVO)request.getAttribute("somoimVO");
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
   String id = (String)session.getAttribute("id");
   String nickname = (String)session.getAttribute("nickname");
   
%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Drone_Picnic_Community</title>
   <link
   href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
   rel="stylesheet" id="bootstrap-css">
<script
   src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
   src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   
<link
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
   type="text/css" rel="stylesheet">
<style>
.container {
   max-width: 1170px;
   margin: auto;
   float: center;
}

img {
   max-width: 100%;
}

.inbox_people {
   background: #f8f8f8 none repeat scroll 0 0;
   float: left;
   overflow: hidden;
   width: 208px;
   border-right: 1px solid #c4c4c4;
}

.inbox_msg {
   border: 1px solid #c4c4c4;
   clear: both;
   overflow: hidden;
   float: center;
   width: 262px;
   height: 490px;
}

.top_spac {
   margin: 20px 0 0;
   width : 260px;
}

.recent_heading {
   float: left;
   width: 40%;
}

.srch_bar {
   display: inline-block;
   text-align: right;
   width: 60%;
   padding:
}

.headind_srch {
   padding: 10px 29px 10px 20px;
   overflow: hidden;
   border-bottom: 1px solid #c4c4c4;
}

.recent_heading h4 {
   color: #05728f;
   font-size: 21px;
   margin: auto;
}

.srch_bar input {
   border: 1px solid #cdcdcd;
   border-width: 0 0 1px 0;
   width: 80%;
   padding: 2px 0 4px 6px;
   background: none;
}

.srch_bar .input-group-addon button {
   background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
   border: medium none;
   padding: 0;
   color: #707070;
   font-size: 18px;
}

.srch_bar .input-group-addon {
   margin: 0 0 0 -27px;
}

.chat_ib h5 {
   font-size: 15px;
   color: #464646;
   margin: 0 0 8px 0;
}

.chat_ib p {
   font-size: 14px;
   color: #989898;
   margin: auto
}

.chat_img {
   float: left;
   width: 11%;
}

.chat_ib {
   float: left;
   padding: 0 0 0 15px;
   width: 115px;
}

.chat_people {
   overflow: hidden;
   clear: both;
}

.chat_list {
   border-bottom: 1px solid #c4c4c4;
   margin: 0;
   padding: 18px 16px 10px;
}

.inbox_chat {
   height: 550px;
   overflow-y: scroll;
}

.active_chat {
   background: #ebebeb;
}

.incoming_msg_img {
   display: inline-block;
   width: 6%;
}

.received_msg {
   display: inline-block;
   padding: 0 0 0 2px;
   width: 92%;
}

.received_withd_msg p {
   background: #FBEFF5 none repeat scroll 0 0;
   border-radius: 3px;
   color: #646464;
   font-size: 14px;
   margin: 0;
   padding: 5px 10px 5px 12px;
   width: 132px;
   margin-top: 10px;
   line-height: 80%;
}

.time_date {
   color: #747474;
   display: block;
   font-size: 12px;
   margin: 8px 0 0;
}

.received_withd_msg {
   width: 57%;
}

.mesgs {
   float: left;
   padding: 0px 0px 0 0px;
   width: 260px;
}

.sent_msg p {
   background: #CED8F6 none repeat scroll 0 0;
   border-radius: 3px;
   font-size: 14px;
   margin: 0;
   color: #646464;
   padding: 5px 10px 5px 12px;
   width: 100%;
   line-height: 80%;
}

.outgoing_msg {
   overflow: hidden;
   margin: 5px 0 5px;
}

.sent_msg {
   float: right;
   width: 46%;
}

.input_msg_write input {
   background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
   border: medium none;
   color: #4c4c4c;
   font-size: 15px;
   min-height: 48px;
   width: 100%;
}

.type_msg {
   border-top: 1px solid #c4c4c4;
   position: relative;
   width: 255px;
   padding-left: 15px;
}

.msg_send_btn {
   background: #05728f none repeat scroll 0 0;
   border: medium none;
   border-radius: 50%;
   color: #fff;
   cursor: pointer;
   font-size: 17px;
   height: 33px;
   position: absolute;
   right: 0;
   top: 11px;
   width: 33px;
}

.messaging {
   padding: 0 0 50px 0;
   width: 270px;
   float: center;
}

.msg_history {
   height: 370px;
   overflow-y: auto;
}

.somoim_name {
   background: #FBEFF5
}

.somoim_desc {
   background: #FBEFF5
}
</style>
   
   
   
   
   
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
</head>

<body>
   <!-- 소모임 대문 사진, 메뉴 -->   
   <div class="container">
      <jsp:include page="./so_header.jsp" />
   </div>
   
   <!-- 본문 -->
   <div class="container"> 
      <div class="row">
         <div class="so_content col-lg-9">
            <!-- 소모임 사진 -->         
            <jsp:include page="./so_album.jsp" />

            <!-- 소모임 게시글-->                        
            <div class="row pt-1 mt-5">
               <div
                  class="col-lg-12 line_color_yellow_b text_align_center mb-3 pl-0">
                  <p class="detail_logo">TALK</p>
                  <p class="korean">게시글을 남겨주세요</p>
               </div>
            </div>
            
            <div class="row pt-1 mt-3 mb-3">
               <div class="col-lg-12 line_color_yellow_b mb-3 pl-0 pb-5">
                  <form id="somoim_input" name="somoim_input" method="post">
                     <input type="hidden" id="somoim_num" name="somoim_num" value="<%=somoimVO.getNum() %>" />
                     <input type="hidden" id="ref" name="ref" value="1" />
                     <input type="hidden" id="re_level" name="re_level" value="0" /> 
                     <input type="hidden" id="re_step" name="re_step" value="0" /> 
                        <span class="smallest_logo">NAME</span>&nbsp;&nbsp;
                     <input type="text" id="nickname" name="nickname" class="border_bottom_input korean mb-2" size="40"
                        placeholder="별명" /> <br /> 
                        <span class="smallest_logo">CONTENT</span>
                     <textarea class="border_input korean" rows="3" name="body" id="body" placeholder="메시지 입력"></textarea>
                     <span class="smallest_logo"><button type="submit" id="button_click" class="btn btn-block korean_center">글쓰기</button></span>
                  </form>
               </div>
            </div>
            <div class="row mt-2" id="somoim_post_newest">
               
            </div>
            <%
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
            %>
            <div class="row mt-2" id="somoim_post_after_append">
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
      </div><!-- <div class="col-lg-12"> -->
   </div>

</body>



<script type="text/javascript">

$(document).ready( function() {
   /*---------------*/
   /*   무한 스크롤    */
   /*--------------*/
   var startNum = 1;
   var endNum = 20;

   $(window).scroll(function() {
       if ($(window).scrollTop() == $(document).height() - $(window).height()) {   
          startNum += 20;
         endNum += 20;
         
         $.ajax({
            url : '/drone/getSoPostAfter.somo?somoim_num=' + <%=somoimVO.getNum()%> + '&startNum=' + startNum + '&endNum=' + endNum,
            type : 'GET',
            //data : params,
            dataType : "json",
            contentType : 'application/x-www-form-urlencoded; charset=utf-8',
            success : function(data) {
               $.each(data, function(index, item) {
                  if (item == null){
                     var output = "";
                     outout += '<div class="end"></div>';
                     $('div#somoim_post_after_append').append(output);
                  }
                  else{
                  var output = "";
                  output += '<div class="col-lg-12 line_color_blue_b p-4 korean">';
                  output += item.pdate + ' │ ' + item.nickname + ' │ 수정하기  │ 삭제하기 │ 답글달기  <br />';
                  output += item.body + '<br />';
                  output += '</div>';
                  // output += '<input type="hidden" id="ref" value="item.ref" /><input type="hidden" id="re_level" value="item.re_level" /><input type="hidden" id="ref" value="item.re_step" />';
                   console.log("output: "   + output);
                  $('div#somoim_post_after_append').append(output);
                  }
               });
               
            },
            error : function(request, status, error) {
                 console.log("code: " + request.status + "\n" + request.responseText + 
                       "\n" + "error" + error);
            }
         });
       }

   });
   
   /*--------------------*/
   /*   소모임 게시물 가져오기  */
   /*--------------------*/
   function selectData(num, somoim_num) {
      //table내부 내용을 제거(초기화)
      //$('div#somoim_post_newest').empty();
      
      $.ajax({
         url : '/drone/getOnlyOnePost.somo?num=' + num + '&somoim_num=' + somoim_num,
         type : 'GET',
         //data : params,
         dataType : "json",
         contentType : 'application/x-www-form-urlencoded; charset=utf-8',
         success : function(data) {
            $.each(data, function(index, item) {
               var output = '';
               output += '<div class="col-lg-12 line_color_blue_b p-4 korean">';
               output += item.pdate + ' │ ' + item.nickname + ' │ 수정하기  │ 삭제하기 │ 답글달기  <br />';
               output += item.body + '<br />';
               output += '</div>';
               // output += '<input type="hidden" id="ref" value="item.ref" /><input type="hidden" id="re_level" value="item.re_level" /><input type="hidden" id="ref" value="item.re_step" />';
                console.log("output: "   + output);
               $('div#somoim_post_newest').prepend(output);
            });
         },
         error : function(request, status, error) {
              console.log("code: " + request.status + "\n" + request.responseText + 
                    "\n" + "error" + error);
         }
      });
   }
   /*--------------------*/
   /*  소모임 만들기 버튼    */
   /*--------------------*/
   $('#button_click').click( function(event) {
      var params = $("form#somoim_input").serialize();
      
      alert('params' + params);
      $.ajax({
         url : '/drone/insertSomoimPost.somo',
         type : 'POST',
         data : params,
         dataType : "json",
         contentType : 'application/x-www-form-urlencoded; charset=utf-8',
         success : function(retVal) {
            if (retVal.res == "OK") {
               var num = retVal.num;
               var somoim_num = retVal.somoim_num;
               selectData(num, somoim_num);
               $('#name').val('');
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
   //selectData();
});

/*--------------------*/
/*   캐러셀갤러리 JS시작  */
/*--------------------*/
/* function GetUnique(e){var l=[],s=temp_c=[],t=["col-md-1","col-md-2","col-md-3","col-md-4","col-md-6","col-md-12","col-sm-1","col-sm-2","col-sm-3","col-sm-4","col-sm-6","col-sm-12","col-lg-1","col-lg-2","col-lg-3","col-lg-4","col-lg-6","col-lg-12","col-xs-1","col-xs-2","col-xs-3","col-xs-4","col-xs-6","col-xs-12","col-xl-1","col-xl-2","col-xl-3","col-xl-4","col-xl-6","col-xl-12"];$(e).each(function(){for(var l=$(e+" > div").attr("class").split(/\s+/),t=0;t<l.length;t++)s.push(l[t])});for(var c=0;c<s.length;c++)temp_c=s[c].split("-"),2==temp_c.length&&(temp_c.push(""),temp_c[2]=temp_c[1],temp_c[1]="xs",s[c]=temp_c.join("-")),-1==$.inArray(s[c],l)&&$.inArray(s[c],t)&&l.push(s[c]);return l}function setcss(e,l,s){for(var t=["","","","","",""],c=d=f=g=0,r=[1200,992,768,567,0],a="",o=[],a=0;a<e.length;a++){var i=e[a].split("-");if(3==i.length){switch(i[1]){case"xl":d=0;break;case"lg":d=1;break;case"md":d=2;break;case"sm":d=3;break;case"xs":d=4}t[d]=i[2]}}for(var n=0;n<t.length;n++)if(""!=t[n]){if(0==c&&(c=12/t[n]),f=12/t[n],g=100/f,a=s+" > .carousel-item.active.carousel-item-right,"+s+" > .carousel-item.carousel-item-next {-webkit-transform: translate3d("+g+"%, 0, 0);transform: translate3d("+g+", 0, 0);left: 0;}"+s+" > .carousel-item.active.carousel-item-left,"+s+" > .carousel-item.carousel-item-prev {-webkit-transform: translate3d(-"+g+"%, 0, 0);transform: translate3d(-"+g+"%, 0, 0);left: 0;}"+s+" > .carousel-item.carousel-item-left, "+s+" > .carousel-item.carousel-item-prev.carousel-item-right, "+s+" > .carousel-item.active {-webkit-transform: translate3d(0, 0, 0);transform: translate3d(0, 0, 0);left: 0;}",f>1){for(k=0;k<f-1;k++)o.push(l+" .cloneditem-"+k);o.length&&(a=a+o.join(",")+"{display: block;}"),o=[]}0!=r[n]&&(a="@media all and (min-width: "+r[n]+"px) and (transform-3d), all and (min-width:"+r[n]+"px) and (-webkit-transform-3d) {"+a+"}"),$("#slider-css").prepend(a)}$(l).each(function(){for(var e=$(this),l=0;l<c-1;l++)(e=e.next()).length||(e=$(this).siblings(":first")),e.children(":first-child").clone().addClass("cloneditem-"+l).appendTo($(this))})};

//Use Different Slider IDs for multiple slider
$(document).ready(function() {
  var item = '#slider-1 .carousel-item';
  var item_inner = "#slider-1 .carousel-inner";
  classes = GetUnique(item);
  setcss(classes, item, item_inner);
  
  
  var item_1 = '#slider-2 .carousel-item';
  var item_inner_1 = "#slider-2 .carousel-inner";
  classes = GetUnique(item_1);
  setcss(classes, item_1, item_inner_1);
}); */

</script>


<style>
.wrap {
    text-align: center;
}
.modal-backdrop.show {
    opacity: 0.1;
}

.pointer {
   cursor: pointer;
}
</style>

</html>