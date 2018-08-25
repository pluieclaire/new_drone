<%@ page contentType="text/html; charset=utf-8"%> 
<%@ page import="com.spring.drone.news.NewsVO"%>
<%@ page import="com.spring.drone.news.NewsPaginationVO"%> 
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
   /* if(session.getAttribute("loginID") == null) 
      response.sendRedirect("./loginForm.jsp"); 
    
   request.setCharacterEncoding("utf-8");  */

   ArrayList<NewsVO> newsList = (ArrayList<NewsVO>)request.getAttribute("newsList");
   NewsPaginationVO newsPaginationVO = (NewsPaginationVO)request.getAttribute("newsPaginationVO");
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
   int number = newsPaginationVO.getNumber();

	String id = (String)session.getAttribute("id");
	String nickname = (String)session.getAttribute("nickname");
	Integer authority = (Integer)session.getAttribute("authority");
%>

<!DOCTYPE html>
<html> 
<head> 
<title>글 목록</title> 

<style>
   .search-width{
      width: 30%;
      float: right;
   }


   #h3 {
   text-align:center; 
   font-size: 40px; 
   color: #51465b;
   
   }
   
   #hr {
   height: 1px;
    background: #675a72;
   }
   
/*    .table {
   border: 2px solid #f4e8f7;
   }
 */
   
   
</style>


<!-- search -->
<script type="text/javascript">
$(document).ready(function(e){
    $('.search-panel .dropdown-menu').find('a').click(function(e) {
      e.preventDefault();
      var param = $(this).attr("href").replace("#","");
      var concept = $(this).text();
      $('.search-panel span#search_concept').text(concept);
      $('.input-group #search_param').val(param);
   });
});
</script>


</head> 

<body>
<div class="container">

  <div class="row mt-1 mb-1 pt-5">
		<div class="col-lg-12 line_color_yellow_b text_align_center mb-5">
			<p class="small_logo text_border">GENERAL NEWS</p>
			<p class="korean_center text_border">드론 일반 뉴스 아카이브</p>
		</div>
		<br /> <br />
	</div>
	
	<div class="row mt-1 mb-1 pt-5">
		<div class="col-lg-12 text_align_center">
			 <p class="korean_center">일반드론뉴스 │ 공모전/대회 소식 │ 드론레저상품모음 │ 드론구직란</p>
		</div>
	</div>
   <!-- search -->
   
     <div class="row">    
        <div class="search-width col-xs-offset-2">
          <div class="input-group">
                <div class="input-group-btn search-panel">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                       <span id="search_concept">Filter by</span> <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                      <li><a href="#contains">Contains</a></li>
                      <li><a href="#its_equal">It's equal</a></li>
                      <li><a href="#greather_than">Greather than ></a></li>
                      <li><a href="#less_than">Less than < </a></li>
                      <li class="divider"></li>
                      <li><a href="#all">Anything</a></li>
                    </ul>
                </div>
                <input type="hidden" name="search_param" value="all" id="search_param">         
                <input type="text" class="form-control" name="x" placeholder="Search term...">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span></button>
                </span>
            </div>
        </div>
   </div> 
   <!-- search/ --> 
 
<%
      if(newsPaginationVO.getCount() == 0){
%>      
      <table class="table table-hover"> 
         <tr>
            <td align="center">
               게시판에 저장된 글이 없습니다.
            </td>
         </tr>
      </table>
<%
      }
      else
      {
%>
      <table class="table" align="center">
         <thead>
         <tr height = "30">
            <td align="center" width="20"> 번호 </td>
            <td align="center" width="370"> 제 목 </td>
            <td align="center" width="30"> 출처 </td>
            <td align="center" width="20"> 작성일 </td>
            <td align="center" width="10"> 조회 </td>
         </tr>
<%
         for(int i=0;i < newsList.size();i++){
            NewsVO vo = newsList.get(i);   
%>      
            <tr height="30">
               <td align="center" width="50">
                  <%=number %>
               </td>
               <td width="250">
<%
                  if (vo.getRe_level() > 0){
                     for (int level = 0;level < vo.getRe_level();level++){            
%>
                        &nbsp;
<%
                     }
%>
                     <img src="image/re.gif">
<% 
                  }
                  else{
%>
                     &nbsp;
<%
                  }
%>
                  <a href="getNews.news?num=<%=vo.getNum() %>&pageNum=<%=newsPaginationVO.getCurrentPage() %>&number=<%=newsPaginationVO.getNumber() %>&readcount=<%=vo.getReadcount()%>">
                     <%=vo.getTitle() %>
                  </a>
<%
                  //글 조회수 도출 readcount 조회한 횟수
                  if(vo.getReadcount() >= 10){
%>
                  <img src="image/hot.gif" border="0" height="16">
<%
                  }
%>
                  </td>
                  <td align="center" width="100">
                  <a href="<%=vo.getUrl() %>">
                     <%=vo.getSource() %>
                  </a>
                  </td>
                  
                  <td align="center" width="150">
                     <%-- <%=sdf.format(vo.getPdate()) %> --%>
                  </td>
                  
                  <td align="center" width="50">
                     <%=vo.getReadcount() %>
                  </td>
               </tr>
<%
               number--;
            }
%>
         </table>
         <br>

<%
      }
      if(newsPaginationVO.getCount() > 0){
         int pageCount = ((newsPaginationVO.getCount()-1) / newsPaginationVO.getPageSize())+1;
         int startPage = 1;
         int i;
         if (newsPaginationVO.getCurrentPage()%10 !=0)
            startPage = (int)(newsPaginationVO.getCurrentPage()/10)*10+1;
         else
            startPage = newsPaginationVO.getCurrentPage() - 9;
         int pageBlock = 10;
         
         if(startPage > 10){
%>
            <a href="list.news?pageNum=<%=startPage - pageBlock %>" class="w3-bar-item w3-button">&laquo;</a>
<%
         }
         for(i=startPage;(i<=startPage+(pageBlock-1))&&(i<=pageCount);i++){      
%>
            <a href="list.news?pageNum=<%=i %>" class="w3-bar-item w3-button w3-hover-deep-purple"><%=i %></a>
<%
         }
         
         if(i<pageCount){
%>
            <a href="list.news?pageNum=<%=startPage+pageBlock %>" class="w3-bar-item w3-button">&raquo;</a>
<%
         }
      }
%>
   </div>
</body>
</html>