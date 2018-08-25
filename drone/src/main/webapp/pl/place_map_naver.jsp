<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	String nickname = (String)session.getAttribute("nickname");
	Integer authority = (Integer)session.getAttribute("authority");
%>

<meta charset="utf-8">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=VZh2P8e3BanI8L1zMwyD&submodules=geocoder"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>

<div id="wrapper">
     <div id="sidebar-wrapper"><!-- wrapper와 class 따로 분리해줘야함 -->
         <div class="sidebar-map">                               
        		<jsp:include page="place_register.jsp" />
         </div>
     </div>
        
    <div id="page-content-wrapper">
      	<div id="map" style="width:100%;height:500px;"></div>
    </div>   <!-- /#page-content-wrapper -->
 
    
	<div class="aero_check">
		<label for="primary" class="btn btn-primary">초기화 
			<input type="radio" id="primary" class="badgebox" onclick="aero_color_off()">
		</label>

		<label for="danger" class="btn btn-danger"> 비행금지구역 
			<input type="radio" id="danger" class="badgebox" onclick="aero_coords('비행금지구역(LT_C_AISPRHC)')">
		</label>

		<label for="info" class="btn btn-info">비행제한구역 
			<input type="radio" id="info" class="badgebox" onclick="aero_coords('비행제한구역(LT_C_AISRESC)')">
		</label>
		
		<label for="success" class="btn btn-success">위험구역
			<input type="radio" id="success" class="badgebox" onclick="aero_coords('위험구역(LT_C_AISDNGC)')">
		</label>
		
		<label for="warning" class="btn btn-warning">관제권 
			<input type="radio" id="warning" class="badgebox" onclick="aero_coords('관제권(LT_C_AISCTRC)')">
		</label>
		
	</div>
	     
</div> <!-- /#wrapper -->



<script>
/*-------------------------------*/
/*       기본값: 초기지도 시작            */
/*-------------------------------*/
var map = new naver.maps.Map(document.getElementById('map'), {
    zoom: 7,
    mapTypeId: 'normal',	
    center: new naver.maps.LatLng(37.549972999999966, 126.9414804999999)
});//초기지도 끝

infowindow_marker(); // 인포윈도우, 마커 표시하기

/*-------------------------------*/
/*  aero_coords: 공역 정보 가져오기    */
/*-------------------------------*/
var history_aero = [];

function aero_coords(aero_select){//공역 정보 가져오기
	console.log("=aero_coords, aero_select: " + aero_select);	
	if (history_aero.includes(aero_select) == false){
		console.log("history_aero.find(aero_select)가 처음임: " + history_aero.includes(aero_select));
		history_aero.push(aero_select);
		console.log("=aero_coords, history_aero: " + history_aero);	
		
	    console.log("=ajax")
	    $.ajax({
	        type: 'get',
	        url :"${pageContext.request.contextPath}/resources/aero/" + aero_select + '.json',
	        dataType: "json",
	        cache: false,
	        success :function(data){//성공시 
	    		console.log("=ajax URL 성공");
		    	map.data.addGeoJson(data);    //geojson 읽기
		    	map.setOptions({    // geojson 입력 후 후 보여줄 지도
//		    		zoom: 5,
//		        	mapTypeId: 'normal',
//		        	center: new naver.maps.LatLng(37.549972999999966, 126.9414804999999)
		    	});
	      		},
	        error: function(data, exception) { //실패시
	        	alert("=ajax URL 에러");
	            console.log(data.url);
	        }
	    });
	    aero_color_on(aero_select)// 색 입히기

	}else{
		console.log("history_aero.find(aero_select),already exists: " + history_aero.includes(aero_select));

	}
}
    
function aero_color_on(aero_select){
	//불러온 파일에 색 입히기    
	map.data.setStyle(function(feature) {
	    console.log("=aero_color_on(aero_select)");

	    if (feature.getProperty("prh_lbl_1") != null) {
	        color = 'red';//비행금지
	    } else if (feature.getProperty("ctr_lbl_1") != null) {
	        color = 'yellow';//관제
	    } else if (feature.getProperty("res_lbl_1") != null) {	
	        color = 'black';//비행제한
	    } else if (feature.getProperty("dng_lbl_1") != null) {
	        color = 'pink';//위험
	    } else {
	        color = 'green'; // 미지정
	        console.log("else: " + color + " : "+ feature.getProperty);
	        console.log("==");
	    }
	    return /** @type {google.maps.Data.StyleOptions} */({
	        clickable:false,
	        fillColor: color,//DB 연동:바탕 색
	        fillOpacity: 0.4,
	        strokeWeight: 0
	    });
	});//map.data.style	
}

function aero_color_off(){
	map.data.setStyle({visible: false});
	console.log("aero_color_off, history_aero1: " + history_aero);
	history_aero = [];//클릭 할 수 있게 초기화
	console.log("aero_color_off, history_aero2: " + history_aero);
};
	
/*------------------------------------*/
/*  infowindow_marker: 지도 클릭시 이벤트   */
/*------------------------------------*/

function infowindow_marker(coord){//click
	console.log("=infowindow_marker(coord): " + coord);
	//marker	
	var marker = new naver.maps.Marker({
	    position: new naver.maps.LatLng(coord),
	    map: map
	});	
	
	naver.maps.Event.addListener(map, 'click', function(e) {
	    console.log("=click, e.latlng: " + e.latlng);
	    console.log("=click, e.latlng.lat(): " + e.latlng.lat());
	    console.log("=click, e.latlng.lng(): " + e.latlng.lng());
	    
	    naver.maps.Service.reverseGeocode({
	        location: new naver.maps.LatLng(e.latlng),
	    }, function(status, response) {
	        if (status !== naver.maps.Service.Status.OK) {
	            return alert('한국 이외의 지역이 선택되었습니다. \n 새로고침 부탁드려요!');
	        }

	        var result = response.result, // 검색 결과의 컨테이너
	            items = result.items; // 검색 결과의 배열
				var address = items[0].address;
				var coord_x = e.latlng.lat();
				var coord_y = e.latlng.lng();
				
				var contentString = [
			        '<div class="iw_inner" style="text-align:center">',
			        '   <h5> 비행 장소를 추천해주세요! <h5> <hr/>  ',
			        '   <h6> 주소 : ' + address +  '<h6>  ',
			        '   <h6> 공역 정보 : 비행 금지구역 <h6>  ',
			        '	<b><button type="button" class="btn btn-primary" onclick="offcanvas_click()">장소 등록하기</button></b>	',
			        '</div>'
			    ].join('');
				
				//place_register.jsp와 연결 시작
				document.getElementById("place_register_coord").value = coord_x + "," + coord_y;
			    document.getElementById("place_register_add").value = address;
			  	//place_register.jsp와 연결 끝
			    
	    		var infowindow = new naver.maps.InfoWindow({
	    		    content: contentString,
	    		    maxWidth: 350,
	    		    backgroundColor: "#eee",
	    		    borderColor: "#2db400",
	    		    borderWidth: 5,
	    		    anchorSize: new naver.maps.Size(30, 30),
	    		    anchorSkew: true,
	    		    anchorColor: "#eee",
	    		    pixelOffset: new naver.maps.Point(20, -20)
	    		});
			  	console.log("=click, map, marker, e.latlng: " + e.latlng);
   			    marker.setPosition(e.latlng);   
			  	console.log("=click, map, marker, marker: " + marker);

 		        infowindow.open(map, marker);
	    });
	});
}//click

/*-------------------------------*/
/*           mapZoom()           */
/*-------------------------------*/

function mapZoom(Place_Name, Place_Add, Place_Desc, User_Id, Place_Coord ,Place_Cate){//search
	console.log("=mapZoom(location): " + Place_Coord);
	var trim_coord_1 = Place_Coord.replace("(lat:", "");
	var trim_coord_2 = Place_Coord.replace("lng:", " ");
	var trim_coord_3 = Place_Coord.replace(")", "");
	console.log("=trim_coord_3: " + trim_coord_3);
	
	place_Coord_x = trim_coord_3.split(",")[0] - 0;
	place_Coord_y = trim_coord_3.split(",")[1] - 0;

	console.log("place_Coord_x: " + place_Coord_x);
	console.log("place_Coord_y: " + place_Coord_y);

	map.setOptions({
    	zoom: 12,
        mapTypeId: 'normal',
        center: new naver.maps.LatLng(place_Coord_x, place_Coord_y)
    });
	
    //marker
    var marker = new naver.maps.Marker({
	    position: new naver.maps.LatLng(place_Coord_x, place_Coord_y),
	    map: map
	});	
	
	var contentString = [
	        '<div class="iw_inner">',
	        '   <h3>'+ Place_Name + '</h3>',
	        '   <p>' + Place_Add +  '<hr/> ',
	        '      ' + User_Id + ' | '+ Place_Cate + '<br />',
	        '      ' + trim_coord_3 + '<br />',
	        '      ' + Place_Desc + '<br />',
	        '   </p>',
	        '</div>'
	    ].join('');
	    
	
	var infowindow = new naver.maps.InfoWindow({
	    content: contentString,
	    maxWidth: 350,
	    backgroundColor: "#eee",
	    borderColor: "#2db400",
	    borderWidth: 5,
	    anchorSize: new naver.maps.Size(30, 30),
	    anchorSkew: true,
	    anchorColor: "#eee",
	    pixelOffset: new naver.maps.Point(20, -20)
	});
	
	infowindow.open(map, marker);
}

/*-------------------------------*/
/*     placeFind Click           */
/*-------------------------------*/

function offcanvas_click(){
 	console.log("offcanvas, toggle");
      $('#wrapper').toggleClass('toggled');
};
  
</script>
 
<style>
/*-------------------------------*/
/*           aero_check           */
/*-------------------------------*/
.aero_check{
	text-align:center;
}

/* Hiding the checkbox, but allowing it to be focused */
.badgebox{
	opacity: 0;
}

.badgebox + .badge{
	/* Move the check mark away when unchecked */
	text-indent: -999999px;
	/* Makes the badge's width stay the same checked and unchecked */
	width: 27px;
}

.badgebox:focus + .badge{
	/* Set something to make the badge looks focused */
	/* This really depends on the application, in my case it was: */
	
	/* Adding a light border */
	box-shadow: inset 0px 0px 5px;
	/* Taking the difference out of the padding */
}

.badgebox:checked + .badge{
	/* Move the check mark back when checked */
	text-indent: 0;
}

/*-------------------------------*/
/*           Wrappers            */
/*-------------------------------*/
#wrapper {
    padding-left: 0;
    -webkit-transition: all 0.5s ease;
    -moz-transition: all 0.5s ease;
    -o-transition: all 0.5s ease;
    transition: all 0.5s ease;
}

#wrapper.toggled {
    padding-left: 220px;
    width:0;
    height: 500px;
}

#sidebar-wrapper {
    z-index: 1000;
    left: 220px;
    width: 0;
    height: 0;
    margin-left: -220px;
    overflow-y: auto;
    overflow-x: hidden;
    background: #FFFFFF;
    -webkit-transition: all 0.5s ease;
    -moz-transition: all 0.5s ease;
    -o-transition: all 0.5s ease;
    transition: all 0.5s ease;
}

#sidebar-wrapper::-webkit-scrollbar {
  display: none;
}

#wrapper.toggled #sidebar-wrapper {
    width: 220px;
}

#page-content-wrapper {
    width: 100%;
    padding-top: 0;
}

#wrapper.toggled #page-content-wrapper {
    position: absolute;
    margin-right: -220px;
}

/*-------------------------------*/
/*     Sidebar nav styles        */
/*-------------------------------*/

.sidebar-map {
    position: absolute;
    width: 250px;
    list-style: none;
    text-align:center;_inner
    padding-top: 20px;
    padding-right: 35px;
    padding-left: 23px;
    left: 0px;
    padding-top: 60px;

}

.sidebar-map > .sidebar-register {
    height: 65px;
    font-size: 20px;
    line-height: 44px;
}


/*-------------------------------*/
/*     Sidebar nav styles        */
/*-------------------------------*/

.iw_inner{
    text-align:center;_inner
}
</style>
