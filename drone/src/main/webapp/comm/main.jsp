<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.spring.drone.so.SomoimVO"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%
	ArrayList<SomoimVO> sixSoList = (ArrayList<SomoimVO>)request.getAttribute("sixSoList");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	String id = (String)session.getAttribute("id");
	String nickname = (String)session.getAttribute("nickname");
	int authority = 1;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	/* 캐러셀 시작 */
	jQuery(document).ready(function($) {

		$('#myCarousel').carousel({
			interval : 5000
		});

		//Handles the carousel thumbnails
		$('[id^=carousel-selector-]').click(function() {
			var id_selector = $(this).attr("id");
			try {
				var id = /-(\d+)$/.exec(id_selector)[1];
				console.log(id_selector, id);
				jQuery('#myCarousel').carousel(parseInt(id));
			} catch (e) {
				console.log('Regex failed!', e);
			}
		});
		// When the carousel slides, auto update the text
		$('#myCarousel').on('slid.bs.carousel', function(e) {
			var id = $('.item.active').data('slide-number');
			$('#carousel-text').html($('#slide-content-' + id).html());
		});
	});
	/* 캐러셀 끝 */
</script>
</head>
<body>
	<div class="container"
		style="border: 0px solid black; background-color: white;">
		<div class="row mt-1 mb-1 pt-5"
			style="background-image: url('${pageContext.request.contextPath}/resources/img/logo_pic/10.jpg'); background-size: cover; background-position: center; ">
			<div class="col-lg-12 line_color_yellow_b text_align_center mb-5">
				<p class="small_logo text_border">COMMUNITY</p>
				<p class="korean_center text_border">드론소모임에 가입해보시고 멋진 드론 사진을 남겨주세요</p>
			</div>
			<br /> <br />
		</div>
		
		
		<div class="row mt-1 mb-1 pt-5">
			<div class="col-lg-12 text_align_center">
			 	<p class="korean_center"><a href="template.templ?page=make_so.somo">소모임 창설하기</a> │ <a href="template.templ?page=somoim_detail.somo">소모임 구경하기</a></p>
			</div>
		</div>
		<%
		if (sixSoList.size() == 0){
		%>
		<div class="row mt-1 mb-1 pt-5">
			<div class="col-lg-12 text_align_center">
			 	<p class="korean_center">창설된 소모임이 없습니다.</p>
			</div>
		</div>
		<%
		}
		else{
		%>
		<div id="somoims" class="carousel slide" data-ride="carousel">
			<div class="row">
				<div class="col-lg-6 text_align_center">
					<div class="carousel-inner m-1">
					<%
						for (int i=0;i < 1;i++){
							SomoimVO vo = sixSoList.get(i);
							StringTokenizer parsed = new StringTokenizer(vo.getStoredFileName(), "///", false);
							ArrayList<String> parsedSet = new ArrayList<String>();
							while(parsed.hasMoreTokens()){
								parsedSet.add(parsed.nextToken());
							}
					%>
						<div class="carousel-item active">
							<div style="width: 500px; height: 370px; overflow: hidden;">
							<img class="d-block w-100" style="height: 400px;" 
								src="<spring:url value='/image/somo_logo/' /><%=parsedSet.get(0).toString()%>"
								alt="<%=vo.getName()%>">
							</div>
							<div class="carousel-caption">
								<h4>
									<a href="template.templ?page=somoim_detail.somo?num=<%=vo.getNum()%>"><%=vo.getName()%></a>
								</h4>
								<p><%=vo.getIntro()%></p>
							</div>
						</div>
					<%
						}
						for (int i=1;i < sixSoList.size();i++){
							SomoimVO vo = sixSoList.get(i);
							StringTokenizer parsed = new StringTokenizer(vo.getStoredFileName(), "///", false);
							ArrayList<String> parsedSet = new ArrayList<String>();
							while(parsed.hasMoreTokens()){
								parsedSet.add(parsed.nextToken());
							}
					%>
						<div class="carousel-item">
							<div style="width: 500px; height: 370px; overflow: hidden;">
							<img class="d-block w-100" style="height: 400px;" 
								src="<spring:url value='/image/somo_logo/' /><%=parsedSet.get(0).toString()%>"
								alt="<%=vo.getName()%>">
							</div>
							<div class="carousel-caption">
								<h4>
									<a href="template.templ?page=somoim_detail.somo?num=<%=vo.getNum()%>&id=<%=id%>"><%=vo.getName()%></a>
								</h4>
								<p><%=vo.getIntro()%></p>
							</div>
						</div>
					<%
						}
					%>
						<a class="carousel-control-prev" href="#somoims" role="button"
							data-slide="prev"> <span class="carousel-control-prev-icon"
							aria-hidden="true"></span> <span class="sr-only">Previous</span>
						</a> <a class="carousel-control-next" href="#somoims" role="button"
							data-slide="next"> <span class="carousel-control-next-icon"
							aria-hidden="true"></span> <span class="sr-only">Next</span>
						</a>
					</div>
				</div>

				<div class="col-lg-6">
					<div class="row p-1">
					<%
						for (int i=0;i < 1;i++){
							SomoimVO vo = sixSoList.get(i);
							StringTokenizer parsed = new StringTokenizer(vo.getStoredFileName(), "///", false);
							ArrayList<String> parsedSet = new ArrayList<String>();
							while(parsed.hasMoreTokens()){
								parsedSet.add(parsed.nextToken());
							}
					%>
					
						<div data-target="#somoims" data-slide-to="0" class="active col-sm-4">
							<div class="somo_thumbnail">
							<img class="somo_thumb_img" src="<spring:url value='/image/somo_logo/' /><%=parsedSet.get(0).toString()%>" alt="<%=vo.getName()%>">
							</div>
							<div style="cursor:pointer" onclick="location.href='template.templ?page=somoim_detail.somo?num=<%=vo.getNum()%>&id=<%=id%>'" class="pt-3 pl-1 pr-2 pb-2">
								<h6 class="mb-2 text-muted korean"><%=vo.getName()%></h6>
								<p class="p-0 korean">
									<%=vo.getIntro()%>
								</p>
							</div>
						</div>
					<%
						}
						for (int i=1;i < sixSoList.size();i++){
							SomoimVO vo = sixSoList.get(i);
							StringTokenizer parsed = new StringTokenizer(vo.getStoredFileName(), "///", false);
							ArrayList<String> parsedSet = new ArrayList<String>();
							while(parsed.hasMoreTokens()){
								parsedSet.add(parsed.nextToken());
							}
					%>
						<div data-target="#somoims" data-slide-to="<%=i%>" class="col-sm-4">
							<div class="somo_thumbnail">
							<img class="somo_thumb_img" src="<spring:url value='/image/somo_logo/' /><%=parsedSet.get(0).toString()%>" alt="<%=vo.getName()%>">
							</div>
							<div style="cursor:pointer" onclick="location.href='template.templ?page=somoim_detail.somo?num=<%=vo.getNum()%>&id=<%=id%>'" class="pt-3 pl-1 pr-2 pb-2">
								<h6 class="mb-2 text-muted korean"><%=vo.getName()%></h6>
								<p class="p-0 korean">
									<%=vo.getIntro()%>
								</p>
							</div>
						</div>
					<%
						if (i == 2){
					%>
						</div>
						<div class="row p-1">
					<%
						}
						}
					%>

					</div>
				</div>
			</div>
		</div>
	<%
		}
	%>

	</div>

	<br>
	<br>
	<div class="row justify-content-center mt-5 p-2">
	<div class="col-md-4 pt-4 m-2 orange_border" style="height: 400px;">
		<table class="table table-condensed table-sm table_fixed">
			<thead>
			<tr class="d-flex board_font">
				<td class="col-9 smaller_logo" style="font-size: 20px; text-align: left; font-weight: bold; line-height: 1.5em;">
					<a href="template.templ?page=auction_main.somo">AUCTION</a>
				</td>
				<td class="col-3" ><p class="bottom_line"><a href="template.templ?page=auction_main.somo">더보기</a></p></td>
			</tr>
			</thead>
			<tbody class="korean">
<%--  			<%
			for(int i=0;i < 10;i++){
				NewsVO vo = newsList.get(i);	
			%>
			<tr class="d-flex">
				<td class="col-9 td_no_overflow"><a href="template.templ?page=getNews.news?num=<%=vo.getNum() %>&pageNum=<%=newsPaginationVO.getCurrentPage() %>&number=<%=newsPaginationVO.getNumber() %>&readcount=<%=vo.getReadcount()%>"><%=vo.getTitle() %></a></td>
				<td class="col-3 td_no_overflow"><%=vo.getSource() %></td>
			</tr>
			<%
			}
			%> --%>
			</tbody>
		</table>
	</div>
	<div class="col-md-4 pt-4 m-2 orange_border" style="height: 400px;">
		<table class="table table-condensed table-sm table_fixed">
			<thead>
			<tr class="d-flex board_font">
				<td class="col-9 smaller_logo" style="font-size: 20px; text-align: left; font-weight: bold; line-height: 1.5em;">
					<a href="template.templ?page=co_p.co">ALBUM</a>
				</td>
				<td class="col-3" ><p class="bottom_line"><a href="template.templ?page=co_p_write.co">더보기</a></p></td>
			</tr>
			</thead>
			<tbody class="korean">

			</tbody>
		</table>
	</div>
	</div>

	<br>
	<br>

	<br>
</body>
</html>