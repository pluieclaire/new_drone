<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = (String)session.getAttribute("id");
	String nickname = (String)session.getAttribute("nickname");
	Integer authority = (Integer)session.getAttribute("authority");
%>

   
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
            
<!-- Bootsrap CDN -->
<!-- ��ũ�� ���� ������ ���� ������ �޾ƿ��� cdn ������� -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" ></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


<script src="//cdnjs.cloudflare.com/ajax/libs/list.js/1.5.0/list.min.js"></script>


<!-- �������� -->
<div class="col-lg-12">
	<div class="row pt-1">
		<div class="appointment_wrap">		 
		    <div class="col-lg-12 line_color_yellow_b text_align_center mb-3 pl-0">
		        <p class="detail_logo">NOTICE</p>
		        <p class="korean">�������� Ȯ���ϼ���</p>
		    </div> <!-- line_color_yellow_b  -->
		    
		    <div class="col-lg-12 line_color_yellow_b text_align_center mb-3 pl-0">
			    <ol id="appointment_list_ajax_modal"></ol> <!-- ����Ʈ ���� ���� -->
			</div> <!-- line_color_yellow_b  -->	
	    </div><!-- class="appointment_wrap" --> 
	</div><!-- class="row pt-1" -->


<hr/>
	<form action="/post" method="post" id="appointment_register">
		<div class="form-group">
		    <input type="hidden" class="form-control" name="User_Id" value="ExpectID"/>		
		    
		<div class="appointment_wrap">		
		<div class="appointment_head" style="text-align: center"><h1> ��� ����ϱ� </h1></div>
	        <div class="row">
	            <div class="col-md-3 form-control" style="text-align: center"><b>����</b></div>
	            <div class="col-md-9 ">
	                <input type="text" class="form-control" name="Appoint_Title" maxlength="10" placeholder="10���� �̳���">    
	            </div>
	        </div>	
	        
	        <div class="row">
	            <div class="col-md-3 form-control" style="text-align: center"><b>��¥</b></div>
	            <div class="col-md-9">
	                <input type="text" id="date" class="form-control" name="Appoint_Date">
	            </div>    
	        </div>
	
			<br/>
			
	        <div class="row">
	        	<div class="appointment_content">
		            <div class="center form-control" style="text-align: center"> <b> <h5>���� ����</h> </b></div>
	    	        <br/>
	 
	        	    <textarea class="form-control" name="Appoint_Desc" rows="7" maxlength="100"
	            	 		placeholder=" ȸ�� 6�����̰�� &#10; ����ϱ� �� ��ǳ�� �غ����ּ���! &#10; �ٵ� ���� ���ð� ���ϳ� �ƿ� :) &#10; ** 100���� �̳�" >
	            	</textarea>
	            	<div class="center">
		                <b><input type="button" class="btn btn-primary" id="so_appointment_button" value=" ��� ��� "></b>
	    	        </div>
	   	        </div>
	        </div> 
	    </div> <!-- class="appointment wrap" -->
	    </div> <!-- form-group -->
	</form> <!-- action="/post" method="post" id="appointment_register"  -->
</div><!-- class="col-lg-12" -->

</body>

<script>
/*--------------------------------*/
/*              popover           */
/*--------------------------------*/
function appointment_popover(){
    $('.appointment_popover').popover("enable");

    $('.appointment_popover').on('click', function (e) {
        $('.appointment_popover').not(this).popover('hide');
    });
}

/*--------------------------------*/
/*              ��¥                         */
/*--------------------------------*/
$('#date').daterangepicker({
    singleDatePicker: true,
    timePicker: true,
    timePicker24Hour: true,
    startDate: "08/21/2018", //moment().startOf('hour')
    locale: {
        format: 'MM/DD hh:mm A'
      }
}, function(start, end, label) {
	console.log('New date range selected: ' + start.format('YYY Y-MM-DD') + ' (predefined range: ' + label + ')');
});

/*--------------------------------*/
/*    place_list �ҷ�����        */
/*--------------------------------*/

$(document).ready(function() {
	function selectData() {
		console.log("=selectData()");
		$('ol#appointment_list_ajax_modal').empty();
		$('ol#appointment_list_ajax_main').empty();
		
		$.ajax({
			url : '/drone/getAppointJSON.ap',
			type : 'POST',
			dataType : 'json',
			async: false,
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success : function(data) {
				$.each(data, function(index, item) {
					console.log("selectData(), getPlaceJSON, index: " + index + ", " + JSON.stringify(item) );
					
					var output='';
					var header =  "<b>��Ҹ�:</b><br/>" + item.appoint_Title;
					
					var content = "<b>��¥:</b><br/>" + item.appoint_Date + "<hr/>";
					content += "<b>���� ����:</b><br/> " + item.appoint_Desc;
					
                	output += '<li href="#" data-html="true" data-placement="left" class="appointment_popover"';
                	output += '		onclick="appointment_popover()" name="appoint_list"';
                	output += '		title="' + header + '" data-content="' + content + '">';
	                output += '     ' + item.appoint_Title + '&nbsp; &nbsp; <b>|</b> &nbsp;' + item.appoint_Date;
	                output += '</li>';
	                
	                console.log("selectData(), getPlaceJSON, output: " +  output);				
					$('ol#appointment_list_ajax_modal').append(output);
					
					if(index < 5){ //main page insert
						$('ol#appointment_list_ajax_main').append(output);
					}

				});
			},
			error : function(request, status, error) {
		        console.log("code: " + request.status + "\n" + request.responseText + 
		        		"\n" + "error" + error);
			}
		});
	}
	selectData();
	
	/*-------------------------------------------------*/
	/*   "��� ���" ������ DB ���� �� ajax�� ��� �ٽ� �ҷ�����    */
	/*-------------------------------------------------*/
	$('#so_appointment_button').click( function(event) {
		alert("so_appointment_button");	
		console.log("=so_appointment_button click");
		var params = $("#appointment_register").serialize();
		console.log("params: " + params);
		
		$.ajax({
			url : '/drone/appointRegister.ap',
			type : 'post',
			data : params,
			dataType : "json",
	 		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			
			success : function(retVal) {
				if(retVal.res == "OK"){
					console.log("DB ���� (����), res: " + retVal.res);
					selectData();
					
				}else{
					console.log("DB ���� (����), res: " + retVal.res);
				}
			},
			error : function(request, status, error) {
		        console.log("code: " + request.status + "\n" + request.responseText + 
		        		"\n" + "error" + error);
			}
		});
		//�⺻ �̺�Ʈ ����
		event.preventDefault();
	}); //ajax
	
});

</script>

<style>
.appointment_content{
	width:95%;
}
.appointment_popover{
	width:90%;
}

.appointment_wrap{
	margin:auto;
	width: 80%;
	padding:10px;
}
</style>
    
</html>