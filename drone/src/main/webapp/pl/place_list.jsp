<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import ="com.spring.drone.pl.PlaceVO" %>
<%@ page import ="java.util.*" %>
	
<%
	ArrayList<PlaceVO> placeList = (ArrayList<PlaceVO>) request.getAttribute("placeList");
	String id = (String)session.getAttribute("id");
	String nickname = (String)session.getAttribute("nickname");
	Integer authority = (Integer)session.getAttribute("authority");
%>
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css"
	integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B"
	crossorigin="anonymous">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"
	integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em"
	crossorigin="anonymous"></script>

<link href="https://unpkg.com/ionicons@4.2.2/dist/css/ionicons.min.css" rel="stylesheet">
    
	<!-- 장소 -->
	<div class="row place_list_header">	
		<div class="col-sm-12" ><!-- 장소추천 header -->
			<input type="search" id="input-search" size="24" placeholder="검색할 장소를 입력해주세요">
            <div class="btn-group ">
       		    <a href="#" id="list" class="btn btn-outline-light text-dark">
       		    	<span class="icon ion-ios-list-box"> List </span> 
    			</a>
			    <a href="#" id="grid" class="btn btn-outline-light text-dark">
			    	<span class="icon ion-md-apps"> Grid </span>
			    	</a>
        	</div>
			    
		</div>	<!-- 장소추천 header 끝 -->	
	</div>
	
	<div class="row place_list_content">
		<div class="place_products col-sm-12"><!-- 장소추천 content -->
			<div class="row view-group searchable-container" id="products" >	
<%
for(int i = 0; i < placeList.size(); i ++){
	PlaceVO vo = placeList.get(i);
	System.out.println("vo.getPlace_Coord(): " + vo.getPlace_Coord());
%>
				<div class="item col-xs-4 col-lg-4"><!-- card -->
					<div class="thumbnail card">
						<div class="img-event">
							<img class="group list-group-image img-fluid" 
								src="http://placehold.it/400x250/000/fff" alt="" 
								onclick="mapZoom(
								'<%=vo.getPlace_Name() %>', '<%=vo.getPlace_Add() %>',
								 '<%=vo.getPlace_Desc() %>', '<%=vo.getUser_Id() %>', 
								 '<%=vo.getPlace_Coord() %>', '<%=vo.getPlace_Cate() %>')" />
								 
								 <!-- function mapZoom(Place_Name, Place_Add, Place_Desc, User_Id, Place_Coord ,Place_Cate){ -->
						</div>
				
						<div class="caption card-body">
							<h4 class="place_list_name"> <%=vo.getPlace_Name() %> </h4>
							<hr/>
							<h6 class="place_list_address"> <%=vo.getPlace_Add() %></h6>
							<div class="row">
								<div class="col-xs-12 col-md-8"> 
									<p class="place_list_category">분류: <%=vo.getPlace_Cate() %></p>
								</div> <!--분류 -->	
								<div class="col-xs-12 col-md-4">
  								    <button type="button" class="btn btn-primary" onclick="place_list_desc_button()">장소설명</button>
								</div> <!-- 버튼 -->
							</div>
							<p class="collapse place_list_desc">
								<%=vo.getPlace_Desc() %>
							</p>
							
						</div><!-- "caption card-body" -->
					</div><!-- "thumbnail card" -->
				</div><!-- card -->
<%	} %>
			</div><!-- searchable-container-->
		</div>	<!-- 장소추천 content -->
	</div>

	
<!-- css -->
<style>
/*-------------------------------*/
/*        image:hover            */
/*-------------------------------*/
.image {
  opacity: 1;
  display: block;
  width: 100%;
  height: auto;
  transition: .5s ease;
  backface-visibility: hidden;
}

.image:hover {
  opacity: 0.3;
}

/*-------------------------------*/
/*          place_list           */
/*-------------------------------*/

.place_list_content{
	background-color: rgba(100,150,150,0.3);
}

.place_list_header{
	background-color: rgba(150,150,150,0.3);
}

.place_list_name{
	font-size: 30px;
} 

.place_list_desc{
	font-size: 20px;
}

.place_list_category{
	font-size: 16px;
}

.place_list_address{
	font-size: 10px;
}

/*-------------------------------*/
/*       list, grid CSS          */
/*-------------------------------*/

.view-group {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: row;
    flex-direction: row;
    padding-left: 0;
    margin-bottom: 0;
}
.thumbnail
{
    margin-bottom: 30px;
    padding: 0px;
    -webkit-border-radius: 0px;
    -moz-border-radius: 0px;
    border-radius: 0px;
    width:100%;
}

.item.list-group-item
{
    float: none;
    width: 100%;
    background-color: rgba(192,150,150,0.3);
    margin-bottom: 30px;
    -ms-flex: 0 0 100%;
    flex: 0 0 100%;
    max-width: 100%;
    padding: 0 1rem;
    border: 0;
}
.item.list-group-item .img-event {
    float: left;
    width: 30%;
}

.item.list-group-item .list-group-image
{
    margin-right: 10px;
}
.item.list-group-item .thumbnail
{
    margin-bottom: 0px;
    display: inline-block;
}
.item.list-group-item .caption
{
    float: left;
    width: 70%;
    margin: 0;
}

.item.list-group-item:before, .item.list-group-item:after
{
    display: table;
    content: " ";
}

.item.list-group-item:after
{
    clear: both;
}
</style>

<!-- script -->
<script>
/*----------------------------------*/
/*  button click for place_register */
/*----------------------------------*/
function place_list_desc_button(){
    $(".collapse").collapse('toggle');
}

$(document).ready(function() {
    $('#list').click(function(event){
    	console.log("=list");
        event.preventDefault();
        $('#products .item').addClass('list-group-item');
        
    });
    $('#grid').click(function(event){
    	console.log("=grid");
        event.preventDefault();
        $('#products .item').removeClass('list-group-item');
        $('#products .item').addClass('grid-group-item');});
});
/*----------------------------------*/
/*        place_list search         */
/*----------------------------------*/
$(function() {    
    $('#input-search').on('keyup', function() {
    	console.log("=input-search");
      var rex = new RegExp($(this).val(), 'i');
        $('.searchable-container .item').hide();
        $('.searchable-container .item').filter(function() {
            return rex.test($(this).text());
        }).show();
    });
});
</script>