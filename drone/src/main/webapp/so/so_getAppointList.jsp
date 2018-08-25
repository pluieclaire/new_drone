<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jquery -->

   
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
            
<!-- Bootsrap CDN -->
<!-- 링크를 통해 서버로 부터 파일을 받아오는 cdn 방식으로 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" ></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<div class="col-lg-12 line_color_yellow_b text_align_center mb-3 pl-0">
	<p class="detail_logo">
		<span>APPOINTMENT LIST</span>
		<!--button-->
		<span style="float:right" class="pointer" data-toggle="modal" data-target="#appoint_Modal"> &#43 </span>
	</p>
	<p class="korean">공지사항</p>
</div>

	<div class="col-lg-12 line_color_yellow_b text_align_center mb-3 pl-0">
	    <ol id="appointment_list_ajax_main"></ol> <!-- 리스트 넣을 공간 -->
	</div><!-- class="row pt-1" -->


<div class="container">
    
    <!--modal-->
	<div class="modal fade" id="appoint_Modal" role="dialog">
    	<div class="modal-dialog"> <!--modal-width 500px-->
			<div class="modal-content"><!--white background-->
            	<div class="modal-header">
                	<h4 class="modal-title">공지사항 및 모임 일정</h4>
                	<button type="button" class="close" data-dismiss="modal">&times;</button>
              	</div>
              	<div class="modal-body">
					<jsp:include page="../ap/ap_make_appointment.jsp"></jsp:include>
              	</div>
			</div> <!-- Modal content-->
	    </div> <!--class="modal-dialog"-->
  </div><!--class="modal-dialog"-->
  
</div><!--class="container"-->


<script>

$(document).ready(function() {
	console.log("=so_getAppointmentList");
	selectDataAppoint();//시작하면 appointment_list 불러오기
});

/*-------------------------------------*/
/*       appointment_list 불러오기            */
/*-------------------------------------*/

function selectDataAppoint() {
	console.log("=selectDataAppoint()");
	//table내부 내용을 제거(초기화)
	$('div#appointment_list_ajax').empty();

	$.ajax({
		url : '/drone/getAppointJSON.pl',
		type : 'POST',
		dataType : 'json',
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		success : function(data) {
            
			$.each(data, function(index, item) {
				console.log("selectDataAppoint(), getPlaceJSON, index: " + index + ", " + JSON.stringify(item) );
				
				var output="";    
                output += " <ul>";
                output += " <li>" + item.appoint_Title + "</li>";
                output += " </ul>";
                
                console.log("selectDataAppoint(), getPlaceJSON, output: " + output);
				$('div#appointment_list_ajax').append(output);
			});
		},
		error : function(request, status, error) {
	        console.log("code: " + request.status + "\n" + request.responseText + 
	        		"\n" + "error" + error);
		}
	});
}
</script>


