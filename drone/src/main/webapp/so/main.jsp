<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<!-- carousel -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<title>Insert title here</title>
</head>
<body>


   <div class="container-fluid" style="border: 1px solid black; background-color: white;">
   		
      <div class="col-sm-12 m-2 p-5"><h2 align="center">community</h2><br>
         <div class="row justify-content-center" >
            <div class="col-sm-5" style="border:1px solid;"><h4>소모임목록</h4>
                  <div class="row">
                  	<div class="col-sm-6" style="background-image: url('${pageContext.request.contextPath}/resources/img/somo.jpg'); width: 90px;">
                  	</div>
                  	<div class="col-sm-6" style="background-image: url('${pageContext.request.contextPath}/resources/img/somo.jpg')">
                  	</div>
                  </div>
              </div>
      			&nbsp;&nbsp;&nbsp;&nbsp;
            <div class="col-sm-5 pt-3" style="border:1px solid;">
               <div class="card mb-3">
                 <img class="card-img-top" src="${pageContext.request.contextPath}/resources/img/somo.jpg" alt="Card image cap" max-height="200px;">
                 <div class="card-body">
                <h4 class="card-title">구할 수 있는 것이다 청춘은 인생의 황금시대다</h4>
                   <p class="card-text">새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지
                   찾아다녀도 목숨이 있는 때까지 방황하여도 보이는 것은 거친 모래뿐일 것이다 이상의 꽃이 없으면 쓸쓸한</p>
                   <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                 <a href="template.templ?page=somoim_detail.so">소모임 상세 보기</a>
                 <a href="template.templ?page=formFile.co">소모임 상세 보기</a>
               <button type="button" class="btn btn-primary btn-sm ">소모임 가입 신청</button>
             </div>
            
               
            </div>
         </div>
      </div>
      <br>
      <br>
      <hr>
      <br>
      <br>
<div class="container-fluid ml-5"  width="100px;">
      <div class="row">
      <div class="col-sm-1 col-sm-offest-1"><br></div>
      <div class="col-sm-4" style="background-color:#F2F2F2;"><h2><center><a href="template.templ?page=auction_main.so">Action</a></center></h2><br>
         <table class="table">
           <thead>
             <tr>
               <th scope="col">#</th>
               <th scope="col">First</th>
               <th scope="col">Last</th>
               <th scope="col">Handle</th>
             </tr>
           </thead>
           <tbody>
             <tr>
               <th scope="row">1</th>
               <td>Mark</td>
               <td>Otto</td>
               <td>@mdo</td>
             </tr>
             <tr>
               <th scope="row">2</th>
               <td>Jacob</td>
               <td>Thornton</td>
               <td>@fat</td>
             </tr>
             <tr>
               <th scope="row">3</th>
               <td>Larry</td>
               <td>the Bird</td>
               <td>@twitter</td>
             </tr>
           </tbody>
         </table>
      </div>
      <div class="col-sm-1 col-sm-offest-1"><br></div>
      <div class="col-sm-4" style="background-color:#F2F2F2;"><h2><center><a href="template.templ?page=co_p.co">Album</a></center></h2>
         
         <div class="gallery_product col filter hdpe">
                <img src="http://fakeimg.pl/128x128/" class="img-responsive">
            </div>
         
         <div class="gallery_product col filter hdpe">
                <img src="http://fakeimg.pl/128x128/" class="img-responsive">
            </div>
          
          <div class="gallery_product col filter hdpe">
                <img src="http://fakeimg.pl/64x64/" class="img-responsive">
            </div>
          
          
          <div class="gallery_product col filter hdpe">
                <img src="http://fakeimg.pl/128x128/" class="img-responsive">
            </div>
      

      </div><br>
      <div class="col-sm-1 col-sm-offest-1"><br></div>
   </div>
</div>
</div>
<br>
<br>
<br>
</div>
<br>
<br>
<br>


</body>
</html>