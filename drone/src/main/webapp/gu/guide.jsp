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
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<!-- 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 -->
<meta charset="UTF-8">      
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
		if(id != null){
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


      <div class="col-lg-3 m-2 text_align_center">
         <div class="thumbnail-wrappper">
            <img src="${pageContext.request.contextPath}/resources/img/guide/pexels.jpeg" class="d-block h-100" />
         </div> 
         <button class="btn btn-outline-dark korean_center btn-block" type="submit" id="button_click" data-toggle="modal" data-target="#howToControl">드론 조종법</button>
      </div>
      
      <div class="col-lg-3 m-2 text_align_center">
         <div class="thumbnail-wrappper">
            <img src="${pageContext.request.contextPath}/resources/img/guide/6.jpg" style="height:350px; width:360px;"/>
         </div> 
         <button class="btn btn-outline-dark korean_center btn-block" type="submit" id="button_click" data-toggle="modal" data-target="#statistic">드론 통계</button>
      </div>
      
      <div class="col-lg-3 m-2 text_align_center">
         <div class="thumbnail-wrappper">
            <img src="${pageContext.request.contextPath}/resources/img/guide/remote_control.jpg" />
         </div> 
         <button class="btn btn-outline-dark korean_center btn-block" type="submit" id="button_click" data-toggle="modal" data-target="#safeinform">안전지식</button>
      </div>
      
         
   </div>
<!-- 가이드 세부 메뉴 박스 끝 -->
<div class="container" id="articleDetail">
   <div class="row mt-4 line_color_yellow_t" >
      <div class="col-lg-8 m-4 korean" id="output">
      </div>
   </div>      
</div>
</div>

<%
      if (guideList.size() != 0){
         for(int i=0;i < guideList.size();i++){
            GuideVO vo = guideList.get(i);
%>   
<!-- Modal -->
<div class="modal fade" id="howToControl" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">드론 조종법</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="row mt-4 ml-2 mr-2">
    
       보통 처음 드론을 구입해서 첫비행에 나가기 전에 무엇부터 공부하고 나가야할지 막막한 경우가 많을텐데요.
         답답한 마음에 매뉴얼도 뒤적여보고, 인터넷도 찾아보고 하지만 조종에 쓰이는 용어를 모르니 좋은 자료를 보면서도 알아들을 수 없는 경우가 대부분일 것입니다.
     그래서 준비한 왕초보용 조종 가이드 입니다. 기초용어부터 설명해드릴 것이니 본 자료를 먼저 보시고 카페 같은 커뮤니티 사이트의 자료를 보거나 다른 드론 이용자분들과 이야기를 하면 한결 수월할 것 같습니다.


       </div>
      <div class="row mt-4">
         <div class="col">   
            <div class="picture1" >
            <img src="${pageContext.request.contextPath}/resources/img/guide/head.png" style="width:350px;"/>
            </div> 
        </div>
        <div class="col">    
            <div class="discript1" >
       <h5>1. 드론 헤드(Head)와 방향</h5>

      우선 조종에 쓰이는 용어를 알아보기 전에 드론의 방향에 대해 말씀드리겠습니다
      드론은 모양이 어떻게 생겼던 "전후좌우"를 구분하는 방향이 존재하는데
      이것은 드론의 "헤드(Head)방향"을 기준으로 결정됩니다. 헤드방향쪽이 전방(앞)인 것이죠.  
      아래 그림처럼 드론의 방향을 표기할 수 있습니다. (사진모델은 입문자분들이 많이 구매 하시는 SYMA X22W를 썼습니다)
            
            </div>
         </div>   
      </div>      
      <div class="row mt-4">
          <div class="col">    
            <div class="discript1" >
        <h5> 2. 조종기 구조 </h5>

      이번에는 조종기의 구조에 쓰이는 용어를 정리해보겠습니다.
      조종기를 보면 아래 그림과 같이 좌우로 레버가 2개 보일텐데
      이 레버들의 명칭에 대해서 먼저 설명해드리겠습니다.
      ※ 참고로 조종기 구조는 "Mode2"를 기준으로 작성하겠습니다.
      (조종기 Mode에 대해서는 밑에서 설명하겠습니다. 입문자들이 사용하는 최근 제품들은 대부분 Mode2 입니다)
            </div>
         </div>   
         <div class="col">   
            <div class="picture1" >
            <img src="${pageContext.request.contextPath}/resources/img/guide/controller.png" style="position:relative; left:70px; width:300px;" />
            </div> 
        </div>
    
      </div>      
      <div class="row mt-4">
         <div class="col">   
            <div class="picture1" >
            <img src="${pageContext.request.contextPath}/resources/img/guide/pitch.gif" style="width:350px;"/>
            </div> 
        </div>
        <div class="col">    
            <div class="discript1">
        <h5> 3. 조종의 기본 용어 </h5>
      <h6>1) 피치(Pitch)</h6>
       : 엘리베이터 레버를 이용하여 드론을 전후 방향으로 이동시키는 조종을 피치라고 합니다.
            </div>
         </div>   
      </div>      
      <div class="row mt-4">
          <div class="col">    
            <div class="discript1" >
        <h5> 3. 조종의 기본 용어 </h5>
      <h6>2) 롤(Roll)</h6>
       : 에일러론 레버를 이용하여 드론을 좌우 방향으로 이동시키는 조종을 롤이라고 합니다.  
            </div>
         </div>   
         <div class="col">   
            <div class="picture1" >
            <img src="${pageContext.request.contextPath}/resources/img/guide/roll.gif" style="position:relative; left:20px; width:350px;" />
            </div> 
        </div>
    
      </div>      
      <div class="row mt-4">
         <div class="col">   
            <div class="picture1">
            <img src="${pageContext.request.contextPath}/resources/img/guide/yaw.gif" style="width:350px;"/>
            </div> 
        </div>
        <div class="col">    
            <div class="discript1">
            <h5> 3. 조종의 기본 용어 </h5>
         <h6>3) 요우(Yaw)</h6>
           : 러더 레버를 이용하여 드론을 시계방향/반시계방향으로 회전시키는 조종을 요우라고 합니다.
              : 스로틀 레버를 이용하여 드론을 상하로 이동시키는 조종을 스로틀이라고 합니다.
            </div>
         </div>   
      </div>      
      <div class="row mt-4">
          <div class="col">    
            <div class="discript1">
            <h5> 3. 조종의 기본 용어 </h5>
         <h6>4) 스로틀(Throttle)</h6>
            : 스로틀 레버를 이용하여 드론을 상하로 이동시키는 조종을 스로틀이라고 합니다.
            
            ※스로틀은 상하이동이기도 하지만 기본 원리는 드론의 프로펠러 모터를 가속시키는 조종이기 때문에 
            Pitch나 Roll 조종을 할때 드론 몸체가 기울어진 상태에서 스로틀 레버를 올리면 이동방향으로 
            가속되는 효과가 있습니다.
            </div>
         </div>   
         <div class="col">   
            <div class="picture1" >
            <img src="${pageContext.request.contextPath}/resources/img/guide/throttle.gif" style="position:relative; left:20px; width:350px;" />
            </div> 
        </div>
    
      </div>      
        <div class="row mt-4">
           <div class="col">
              <div class="picture2">
               <img src="${pageContext.request.contextPath}/resources/img/guide/mode.png" style="width:350px;"/>
               </div>   
            </div>
            <div class="col">    
            <div class="discript2" >
        <h5>4. 조종 모드</h5>
        앞서 언급하였듯이 조종 용어를 Mode2 기준으로 설명을 드렸는데요.
      최근에 나오는 드론들은 대부분이 Mode2로 나오지만 함께 설명해드리겠습니다.
      조종모드란 쉽게 말해 조종레버들의 위치입니다. 
      자신의 손에 맞고 조종하기 수월한 인터페이스로 모드를 바꾸어서 쓸 수 있다는 것이죠.
      모드 종류는 크게 4가지가 있습니다. (Mode1, Mode2, Mode3, Mode4)
             </div>
             </div>
       </div>      
       <div class="row mt-4 ml-2 mr-2">
          <h6> 1) Mode1</h6>
         왼손에 엘리베이터 레버와 러더 레버가 있고, 오른손에 스로틀 레버와 에일러론 레버가 있습니다.
         즉, 왼손으로 피치(전후 이동)와 요우(회전 조작)를 하고, 오른손으로 롤(좌우 이동)과 스로틀(상하, 가속)을 하는 방식이죠.
         과거에는 Mode1을 주로 사용하던 시절이 있었기 때문에 현재도 드론 경력이 좀 오래되신 분들은 Mode1이 손에 익어 Mode1을 사용하시는 분들도 있습니다.
         <br>
         <br>
         <h6>2) Mode2</h6>
         Mode1에서 엘리베이터 레버와 스로틀 레버 위치가 바뀐것입니다.
         즉, 왼손에 스로틀 레버와 러더레버가 있어 스로틀과 요우를 하고, 오른손에 엘리베이터 레버와 에일러론 레버가 있어 피치와 롤을 하는 방식입니다.
         말씀드렸듯이 최근에 나오는 제품들이 대부분 Mode2기준으로 나오고 있어서 대다수 드로너들의 손에 익은 방식이 Mode2가 아닐까 합니다.<br>
         <br>
         <h6>3) Mode3, Mode4</h6> 
         Mode3는 Mode2에서 좌우 손이 바뀐 모드입니다. Mode2의 왼손잡이 버전이라고 생각하시면 이해가 쉽겠네요.
         엘리베이터 레버와 에일러론 레버가 왼손에 있어서 전후좌우 이동을 왼손으로 하는 모드죠.
         Mode4는 Mode1에서 좌우 손이 바뀐 모드입니다. 엘리베이터 레버와 러더 레버가 오른손에 위치하는 모드입니다.
       </div>
     <%--       <img src="${pageContext.request.contextPath}/resources/img/guide/<%= vo.getPhotofilename() %>" style="width:300px"/>
           <p><%= vo.getBody() %>
             </p>  --%>
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="statistic" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">드론 통계</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="row mt-4 ml-2 mr-2">
   
      <jsp:include page="stat.jsp" />
    
       </div>
   <%--    <div class="row mt-4">
            <div class="col">   
               <div class="picture1" >
               <img src="${pageContext.request.contextPath}/resources/img/guide/head.png" style="width:350px;"/>
               </div> 
           </div>
           <div class="col">    
               <div class="discript1" >
                <h5>1. 드론 헤드(Head)와 방향</h5>
         
               우선 조종에 쓰이는 용어를 알아보기 전에 드론의 방향에 대해 말씀드리겠습니다
               드론은 모양이 어떻게 생겼던 "전후좌우"를 구분하는 방향이 존재하는데
               이것은 드론의 "헤드(Head)방향"을 기준으로 결정됩니다. 헤드방향쪽이 전방(앞)인 것이죠.  
               아래 그림처럼 드론의 방향을 표기할 수 있습니다. (사진모델은 입문자분들이 많이 구매 하시는 SYMA X22W를 썼습니다)   
               </div>
           </div>   
      </div>  --%>        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal -->
<div class="modal fade" id="safeinform" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">안전지식</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="row mt-4 ml-2 mr-2">

       </div>
      <div class="row mt-4">
    
        <div class="col">    
            <div class="discript1" >
      
         
         <jsp:include page="safe_inform.jsp" />
         
            </div>
         </div>   
      </div>         
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
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

<a href="template.templ?page=carousel.gu">carousel</a>

</body>