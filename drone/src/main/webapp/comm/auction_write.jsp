<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%
	String id = (String)session.getAttribute("id");
	String nickname = (String)session.getAttribute("nickname");
	Integer authority = (Integer)session.getAttribute("authority");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootsrap CDN -->
        <!-- 링크를 통해 서버로 부터 파일을 받아오는 cdn 방식으로 -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" ></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

        <title>Auction_write</title>
        <style>
        
                #preview img {
                    text-align: center;
                    vertical-align:middle;
                    width: 170px;
                    height: 150px;
                   
                }
                #preview p {
                    text-align: center;
                    text-overflow: ellipsis;
                    overflow: hidden;
                    padding: 18px;
                    margin: -16px;
                    
                }
                
                /* 삭제글씨  */
                .preview-box a { 
                    font-size: 15px;
                    padding:0px; 
                    margin: -10 -165 -10 -68px;
                    text-align: center;
                    vertical-align:middle;

                }

                 /* preview-box 가운데 정렬    */
                .content { 
                    text-align: center;
                }    

                .preview-box {
                    display: inline-block;
                    text-align: center;
                    text-overflow: ellipsis;
                    border: 0.5px solid;
                    padding: 12px;
                    border-radius: 5px;
                    margin-bottom: 0px; 
                    height: 250px;
                }

                .attach .btn_file {  /* 업로드 버튼 */
                    display:inline-block;
                    border:1px solid rgba(30, 22, 54, 0.6);
                    border-radius: 3px;
                    width:100px; 
                    height:30px;
                    font-size:0.8em; 
                    line-height:30px;
                    text-align:center; 
                    vertical-align:middle;
                    }

                 .attach .btn_file:hover {
                    color: rgba(255, 255, 255, 0.85);
                    box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
                }    
 
                .attach input[type="file"] { /* 파일 필드 숨기기 */
                    position:absolute;
                    width:1px; height:1px;
                    padding:0; margin:-1px;
                    overflow:hidden; 
                    clip:rect(0,0,0,0);
                    border:0
                    } 

                #roww{  /*우선 보더 0으로 잡아놓음 */
                    border: 0px dotted;
                    padding: 20px;
                    margin: 0 auto;
                    border-radius: 3px;
                    /* background-color: #e2eaff; */
                }

                .col-md-9 { /*form 배경*/
                    border: 1px solid #eff3ff;
                    border-radius: 5px;
                    background-color: #f3f2ff;  /* #eaf0ff;*/

                }

                .wrap {
                    text-align: center;
                }

 /*                a {
                    display: block;
                    margin: 20px auto;
                    max-width: 100px;
                    text-decoration: none;
                    border-radius: 4px;
                    padding: 10px 15px;
                    } */

                a.submit {  /* 작성버튼 */
                    color: rgba(30, 22, 54, 0.6);
                    box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
                    
                    }

                a.submit:hover {
                    color: rgba(255, 255, 255, 0.85);
                    box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
                    text-decoration: none !important 
                }

               

            
        </style>
    </head>

    <body>


    <div class="container">  
      <div class="row justify-content-center" id="roww"> 
        <div class="col-md-9" >
          <form action="" method="post" enctype="multipart/form-data" id="uploadForm">
        <br />
            <h2 style="text-align:center;">중고거래 게시글 작성</h2>  
        <br /> 
            <div class="form-group">
                <p class="p">*제목</p>
                <input type="text" class="form-control" id="title" name="title"   />
            </div>
            <div class="form-group">
                <p class="p">*제품명</p>
                <input type="text" class="form-control" id="pname" name="pname"  />
            </div>
            <div class="form-group">
                <p class="p">*가격</p>
                <input type="text" class="form-control" id="price" name="price" />
            </div>
            <div class="class form-group">
                <p class="p">*판매상태</p>
                <select class="form-control" id="select">                    
                    <option value="">판매중</option>
                    <option value="">판매완료</option>
                </select>    
            </div>
            <div class="form-group">
                <p class="p">*판매이유</p>
                <textarea class="form-control" id="body" name="body" rows="5" /></textarea>
            </div> 
          

            <div class="form-group">
                    <div class="attach" id="attach">
                     <label for="uploadInputBox" class="btn_file"><span><i class="fas fa-cloud-upload-alt"></i></span>&nbsp;File Upload</label> &nbsp;
                     <input id="uploadInputBox" type="file" name="filedata" multiple  />
                    </div>     
            </div>
            <div class="wrap">
                <button type="submit" id="button_click">작성</button>
            </div> 

            <div class="form-group">
                <!-- 미리보기 영역 -->
                <div id="preview" class="content">     
                </div>
            </div>         
            </form>
      </div>
     </div>
    </div>
  

      
      
      
       <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
       <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script> -->
       <script>
           //임의의 file object영역
           var files = {};
           var previewIndex = 0;
    
           // image preview 기능 구현
           // input = file object[]
           function addPreview(input) {
               if (input[0].files) {
                   //파일 선택이 여러개였을 시의 대응
                   for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
                       var file = input[0].files[fileIndex];
                       if(validation(file.name)) continue;
                       setPreviewForm(file);
                   }
               } else
                   alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
           }
           
           function setPreviewForm(file, img){
               var reader = new FileReader();
               
               //div id="preview" 내에 동적코드추가.
               //이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
               reader.onload = function(img) {
                   var imgNum = previewIndex++;
                   $("#preview").append(
                           "<div class=\"preview-box col-lg-3 m-2 \" value=\"" + imgNum +"\">" +
                           "<img class=\"thumbnail\" src=\"" + img.target.result + "\"\/>" +
                           "<p>" + file.name + "</p>" +
                           "<a href=\"#\" value=\"" + imgNum + "\" onclick=\"deletePreview(this)\">" +
                           "삭제" + "</a>"
                           + "</div>"
                   );
                   //resizeHeight();
                   files[imgNum] = file;            
               };
               
               reader.readAsDataURL(file);
           }
   
    
           //preview 영역에서 삭제 버튼 클릭시 해당 미리보기이미지 영역 삭제
           function deletePreview(obj) {
               var imgNum = obj.attributes['value'].value;
               delete files[imgNum];
               $("#preview .preview-box[value=" + imgNum + "]").remove();
               //resizeHeight();
           }
    
           //client-side validation
           //always server-side validation required
           function validation(fileName) {
               fileName = fileName + "";
               var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
               var fileNameExtension = fileName.toLowerCase().substring(
                       fileNameExtensionIndex, fileName.length);
               if (!((fileNameExtension === 'jpg')
                       || (fileNameExtension === 'gif') || (fileNameExtension === 'png'))) {
                   alert('jpg, gif, png 확장자만 업로드 가능합니다.');
                   return true;
               } else {
                   return false;
               }
           }
    
           $(document).ready(function() {
               //submit 등록. 실제로 submit type은 아니다.
               $('#button_click').on('click',function() {
            	  
                   var form = $('#uploadForm')[0];

                   var formData = new FormData (form);
                  
       
                   for (var index = 0; index < Object.keys(files).length; index++) {
                       //formData 공간에 files라는 이름으로 파일을 추가한다.
                       //동일명으로 계속 추가할 수 있다.
                       formData.append('files', files[index]);
                       
                   }
/*                    var title = $("#title").val();
                   alert($("#pname").val());
                   formData.append('title', $("#title").val());
                   formData.append('pname', $("#pname").val());
                   formData.append('price', $("#price").val());
                   formData.append('body', $("#body").val()); 
                   이렇게 아펜드 안 해도 모두 들어간다..*/
                   
                   //ajax 통신으로 multipart form을 전송한다.
                   $.ajax({
                       type : 'POST',
                       enctype : 'multipart/form-data',
                       processData : false,
                       contentType : false,
                       cache : false,
                       timeout : 600000,
                       url : '/drone/imageupload.co',
                       dataType : "json",
                       data : formData,
                       success : function(result) {
                           //이 부분을 수정해서 다양한 행동을 할 수 있으며,
                           //여기서는 데이터를 전송받았다면 순수하게 OK 만을 보내기로 하였다.
                           //-1 = 잘못된 확장자 업로드, -2 = 용량초과, 그외 = 성공(1)
                           if (result.res === -1) {
                               alert('jpg, gif, png, bmp 확장자만 업로드 가능합니다.');
                               // 이후 동작 ...
                           } else if (result.res === -2) {
                               alert('파일이 10MB를 초과하였습니다.');
                               // 이후 동작 ...
                           } else {
                               alert('이미지 업로드 성공');
                               //location.href="detail.co";
                           }
                       },
                       error : function(request,status,error){
                           alert('code:'+request.status + "\n" + "message:" + request.responseText+"\n"+"error:"+error);
                       }
                       //전송실패에대한 핸들링은 고려하지 않음
                   });
               });
               // <input type=file> 태그 기능 구현
               $('#attach input[type=file]').change(function() {
                   addPreview($(this)); //preview form 추가하기
               });
           });

var uploadFile = $('.attach .uploadInputBox');
uploadFile.on('change', function(){
   if(window.FileReader){
      var filename = $(this)[0].files[0].name;
   } else {
      var filename = $(this).val().split('/').pop().split('\\').pop();
   }
   $(this).siblings('.fileName').val(filename);
});   
       </script>
        
    </body>
    </html> 

    