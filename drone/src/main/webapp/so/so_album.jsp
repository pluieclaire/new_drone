<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jquery -->


<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<!-- Bootsrap CDN -->
<!-- 링크를 통해 서버로 부터 파일을 받아오는 cdn 방식으로 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
	integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<div class="row pt-1">
	<div class="col-lg-12 line_color_yellow_b text_align_center mb-3">
		<p class="detail_logo">CIRCLE PHOTOGRAPHY</p>
		<p class="korean">우리 회원들이 찍은 사진이닷@</p>
	</div>
</div>

<style type="text/css" id="slider-css"></style>

<div class="spe-cor">
	<div class="container-fluid">
		<div class="row">
			<div class="carousel carousel-by-item slide" id="slider-1" data-ride="carousel">
							
				<!-- coursel pictues -->
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active"> <!-- first carousel must start with actice -->
						<div class="col-lg-3 col-md-3 col-sm-4 col-4 gallery_height">
							<a href="" data-toggle="modal" data-target=".bd-example-modal-lg_1">
								<img class="d-block h-100"
									src="${pageContext.request.contextPath}/resources/img/sodetail/1.jpg"
									alt="slide_1">
							</a>
						</div>
					</div> <!-- class="carousel-item active" -->
					<%
					for (int i=2;i < 6;i++){
						System.out.println("i: "+ i);
					%>
					<div class="carousel-item">
						<div class="col-lg-3 col-md-3 col-sm-4 col-4 gallery_height">
							<a href="" data-toggle="modal" data-target=".so_album-modal_<%=i %>">						
								<img class="d-block h-100"
									src="${pageContext.request.contextPath}/resources/img/sodetail/<%=i %>.jpg"
									alt="slide_<%=i %>">
							</a>
						</div>
					</div> <!-- class="carousel-item" -->
					<%
					};
					%>		
				</div><!-- class="carousel-inner" -->
				
				<!-- slider button -->
				<a class="carousel-control-prev" href="#slider-1" role="button"
					data-slide="prev"> <span class="carousel-control-prev-icon"
					aria-hidden="true"></span> <span class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#slider-1" role="button"
					data-slide="next"> <span class="carousel-control-next-icon"
					aria-hidden="true"></span> <span class="sr-only">Next</span>
				</a>
			</div> <!-- class="carousel carousel-by-item slide" -->
		</div> <!-- class="row" -->
	</div> <!-- class="container-fluid" -->
</div> <!-- class="spe-cor" -->

<!-- Modal -->
<%
for (int i=2;i < 6;i++){
	System.out.println("i: "+ i);
%>
<div class="modal fade so_album-modal_<%=i %>" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<!-- 제목 -->
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">아이슬란드에서.. </h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div> <!-- class="modal-header" -->
			<!-- 내용 -->
			<div class="modal-body">
				<div class="col-lg-12">
					<img src="${pageContext.request.contextPath}/resources/img/sodetail/<%=i %>.jpg"
						class="w-100" />
				</div>
			</div> <!-- class="modal-body" -->			
		</div> <!-- class="modal-content" -->
	</div> <!-- class="modal-dialog modal-lg modal-dialog-centered" -->
</div> <!-- class="modal fade so_album-modal_i" -->
<%
};
%>	
