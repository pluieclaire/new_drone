<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.drone.co.AlbumVO"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import ="java.util.*" %>
<%@ page import ="java.sql.*" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%
/*    int pageSize = 10; //페이지사이즈는  화면에 뿌려줄 글의 개수
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-d HH:mm:ss");
   
   String pageNum = request.getParameter("pageNum"); // 페이지넘(페이지넘버링)는 처음에 값이 없기에 null이기에 문자열로 받아서 변환처리 /페이지넘을 스트링(문자열)형태로 저장
   
   if(pageNum == null)
      pageNum = "1"; 
   
   int currentPage = Integer.parseInt(pageNum); // 커렌트페이지 현재내가 화면에 뿌려줄 페이지 페이지넘을 파스인트로 해줘서 커렌트페이지로 전달
   int startRow = (currentPage - 1) * pageSize + 1; 
   int endRow = startRow + pageSize - 1;
   int count = 0;
   int number = 0;
   
   //ArrayList<BoardDataBean> articleList = null;
   //BoardDBBean dbPro = BoardDBBean.getInstance(); //겟인스턴스하면 생성된 객체 반환
   //count = dbPro.getArticleCount(); // 글개수 카운트 ,(몇개의페이지를 만들지를 글의개수를 보고판단하니까 필요 return count:테이블내에 존재하는글의개수반환)
   //카운트는 총글의 개수이다.
   
   //맨 마지막 페이지의 마지막 글을 삭제하여 마지막 페이지가 없어졌을 때 필요
   if (count < startRow) //우리가 리스트로오는경우: 글쓰기 작업끝났을떄(수정,삭제도) 
   {
      currentPage = currentPage -1; //여기서 -1 하면 3페이지
      startRow = (currentPage - 1) * pageSize + 1; 
      endRow = startRow + pageSize -1;   
   }
   
   //if (count > 0) // 1페이지에 글이 하나만있을때 
   //   articleList = dbPro.getArticles(startRow, endRow); // dbbean 에 인자보내기

   number = count - (currentPage - 1) * pageSize;  */
   
   ArrayList<AlbumVO> albumList = (ArrayList<AlbumVO>)request.getAttribute("albumList");
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	String id = (String)session.getAttribute("id");
	String nickname = (String)session.getAttribute("nickname");
	Integer authority = (Integer)session.getAttribute("authority");
%>
<html>
<head>

<title>사진첩</title>
<meta charset="utf-8">
<body>
<div class="container">
		<div class="row line_color_yellow_b mt-1 mb-5 pt-5">
			<div class="col-lg-12 text_align_center">
				 <p class="small_logo">PHOTOGRAPHY</p>
				 <p class="korean_center">드론으로 찍은 사진을 올려주세요</p>
			</div>
		</div>
		<div class="row mt-1 mb-1 pt-5">
			<div class="col-lg-12 text_align_center">
				 <p class="korean_center"><a href="template.templ?page=co_p_write.co">사진 올리기</a></p>
			</div>
		</div>
		<div class="row line_color_yellow_b mt-1 mb-1 pt-5">
			
			<%
				for (int i=0;i < albumList.size();i++){
					AlbumVO vo = albumList.get(i);
					StringTokenizer parsed = new StringTokenizer(vo.getStoredFileName(), "///", false);
					ArrayList<String> parsedSet = new ArrayList<String>();
					while(parsed.hasMoreTokens()){
						parsedSet.add(parsed.nextToken());
					}

			%>
			
				<div class="col-sm-4 korean mb-5">
					<div style="height: 200px; width: 280px; overflow: hidden;" class="mb-3">
						<a href="#album_modal<%=i%>" class="card-link" data-toggle="modal">
						<img class="card-img-top rounded-0 mb-4" style="height: auto; width: 430px; overflow: hidden;" src="<spring:url value='/image/album/' /><%=parsedSet.get(0).toString()%>" alt="Card image cap">
						</a>
					</div>
						<div class="">
							<h5 class="card-title korean"><%=vo.getTitle() %></h5>
							<h6 class="card-subtitle mb-2 text-muted">photo by <%=vo.getNickname()%>&nbsp;<%=sdf.format(vo.getPdate())%></h6>
								<p class="card-text"><%=vo.getBody() %></p>
								<a href="template.templ?page=co_p_view.co?num=<%=vo.getNum()%>">자세히보기</a>
								<a href="#" class="card-link">조회수</a>
							    <a href="#" class="card-link">좋아요</a>
						</div>
					<div class="modal korean" id="album_modal<%=i%>" tabindex="-1" role="dialog">
					  <div class="modal-dialog modal-lg" role="document">
					    <div class="modal-content">
					   
					      <div class="modal-header">
					      	
					        <h5 class="modal-title"><%=vo.getTitle() %></h5>
					        
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					       <img class="modal-content img-fluid rounded-0" src="<spring:url value='/image/album/' /><%=parsedSet.get(0).toString()%>" alt="Card image cap">
					    
					        <p><%=vo.getBody() %></p>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-primary">자세히보기</button>
					      </div>
					    </div>
					  </div>
					</div>
				</div>
			<%
				}
			%>
			
		</div>
		
</div>

</body>
</html>