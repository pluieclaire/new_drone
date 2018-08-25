<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.drone.me.MemberVO"%>
<%
   String nickname = (String)session.getAttribute("nickname");
%>
<!DOCTYPE html>
<html>
<head>
<title>Majestic Login Form Flat Responsive widget Template :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Majestic Login Form Widget Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- font files -->
<link href='//fonts.googleapis.com/css?family=Muli:400,300,300italic,400italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Comfortaa:400,300,700' rel='stylesheet' type='text/css'>
<!-- /font files -->
<!-- css files -->
<link href="../resources/css/animate-custom.css" rel="stylesheet" type="text/css" media="all" />
<link href="../resources/css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- /css files -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="750876275305-duhcjp8ipktuoj6nl29il355r9l3eihd.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>

</head>
<body>
<script src='//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script><script src="//m.servedby-buysellads.com/monetization.js" type="text/javascript"></script>
<script>
(function(){
	if(typeof _bsa !== 'undefined' && _bsa) {
  		// format, zoneKey, segment:value, options
  		_bsa.init('flexbar', 'CKYI627U', 'placement:w3layoutscom');
  	}
})();
</script>
<script>
(function(){
if(typeof _bsa !== 'undefined' && _bsa) {
	// format, zoneKey, segment:value, options
	_bsa.init('fancybar', 'CKYDL2JN', 'placement:demo');
}
})();
</script>
<script>
(function(){
	if(typeof _bsa !== 'undefined' && _bsa) {
  		// format, zoneKey, segment:value, options
  		_bsa.init('stickybox', 'CKYI653J', 'placement:w3layoutscom');
  	}
})();
</script><script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
ga('create', 'UA-30027142-1', 'w3layouts.com');
  ga('send', 'pageview');
</script>
<body>
<!---728x90--->
<script src='//publisher.eboundservices.com/dynamicAds/dynamicScript.js'></script>
<div style='margin: 0 auto;text-align: center;margin-top: 5px;'><script>
var allowedNumberOfEboundDynamicAdds = 4;
var sizesEboundDynamicAdsDesktop = ['728x90'];
var sizesEboundDynamicAdsTablet = ['728x90'];
var sizesEboundDynamicAdsMobile = ['320x100'];
eboundAdsTagByDevice(sizesEboundDynamicAdsDesktop,sizesEboundDynamicAdsTablet,sizesEboundDynamicAdsMobile, 'ebound_header_tag');

if(typeof user_tag_config == 'undefined'){
	var user_tag_config = {};
}
user_tag_config['ebound_header_tag'] = {};
user_tag_config['ebound_header_tag']['desktop'] = {};
user_tag_config['ebound_header_tag']['desktop']['cpm'] = '';
user_tag_config['ebound_header_tag']['desktop']['adsCode'] = '';
user_tag_config['ebound_header_tag']['tablet'] = {};
user_tag_config['ebound_header_tag']['tablet']['cpm'] = '';
user_tag_config['ebound_header_tag']['tablet']['adsCode'] = '';
user_tag_config['ebound_header_tag']['mobile'] = {};
user_tag_config['ebound_header_tag']['mobile']['cpm'] = '';
user_tag_config['ebound_header_tag']['mobile']['adsCode'] = '';
</script></div>	
<script>
/*	window.onload = function() {
	    document.getElementById('loginclick').onclick = function() {
	        document.getElementById('loginaction').submit();
	        return false;
	    }
	};
	
	window.onload = function() {
		document.getElementById('joinclick').onclick = function() {
			document.getElementById('joinclick').submit();
			return false;
		}
	}
	 function checkPwd(){
		  var f1 = document.forms[0];
		  var pw1 = f1.password.value;
		  var pw2 = f1.pwd_check.value;
		  if(pw1!=pw2){
		   document.getElementById('checkPwd').style.color = "red";
		   document.getElementById('checkPwd').innerHTML = "동일한 비밀번호를 입력하세요."; 
		  }else{
		   document.getElementById('checkPwd').style.color = "black";
		   document.getElementById('checkPwd').innerHTML = "비밀번호가 확인 되었습니다."; 
		   
		  }
		  
		 }
*/
</script>
<script type="text/javascript">
//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
var idck = 0;
$(function() {
    //idck 버튼을 클릭했을 때 
    $("#idck").click(function() {
        
        //userid 를 param.
        var userid =  $("#joinid").val(); 
        
        $.ajax({
            async: true,
            type : 'POST',
            data : userid,
            url : "idcheck.me",
            dataType : "json",
            contentType: "application/json; charset=UTF-8",
            success : function(data) {
                if (data.cnt > 0) {
                    
                    alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                    $("#divInputId").addClass("has-error")
                    $("#divInputId").removeClass("has-success")
                    $("#joinid").focus();
                    
                
                } else {
                    alert("사용가능한 아이디입니다.");
                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                    $("#divInputId").addClass("has-success")
                    $("#divInputId").removeClass("has-error")
                    $("#password").focus();
                    //아이디가 중복하지 않으면  idck = 1 
                    idck = 1;
                    
                }
            },
            error : function(error) {
                
                alert("error : " + error);
            }
        });
    });
});
 
function DosignUp() {
	 var joinpassword = $("#joinpassword").val();
	 var pwd_check = $("#pwd_check").val();
	   
	 if(joinpassword != pwd_check){
	        alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요."); 
	        $("#pwd_check").focus();
	        return false; 
	    }
</script>

<h1 class="w3ls">Welcome To</h1>
<h1 class="w3ls">Drone Picnic</h1>
<!---728x90--->
<script src='//publisher.eboundservices.com/dynamicAds/dynamicScript.js'></script>
<div style='margin: 0 auto;text-align: center;margin-top: 5px;'><script>
var allowedNumberOfEboundDynamicAdds = 4;
var sizesEboundDynamicAdsDesktop = ['728x90'];
var sizesEboundDynamicAdsTablet = ['728x90'];
var sizesEboundDynamicAdsMobile = ['320x100'];
eboundAdsTagByDevice(sizesEboundDynamicAdsDesktop,sizesEboundDynamicAdsTablet,sizesEboundDynamicAdsMobile, 'ebound_header_tag');

if(typeof user_tag_config == 'undefined'){
	var user_tag_config = {};
}
user_tag_config['ebound_header_tag'] = {};
user_tag_config['ebound_header_tag']['desktop'] = {};
user_tag_config['ebound_header_tag']['desktop']['cpm'] = '';
user_tag_config['ebound_header_tag']['desktop']['adsCode'] = '';
user_tag_config['ebound_header_tag']['tablet'] = {};
user_tag_config['ebound_header_tag']['tablet']['cpm'] = '';
user_tag_config['ebound_header_tag']['tablet']['adsCode'] = '';
user_tag_config['ebound_header_tag']['mobile'] = {};
user_tag_config['ebound_header_tag']['mobile']['cpm'] = '';
user_tag_config['ebound_header_tag']['mobile']['adsCode'] = '';
</script></div>	
<div id="container_demo" >
    <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
    <a class="hiddenanchor" id="toregister"></a>
    <a class="hiddenanchor" id="tologin"></a>
    <div id="wrapper">
        <div id="login" class="animate form">
			<form id="loginaction" name="loginaction" action="template.templ?page=login.me" method="post" autocomplete="on"> 
                <h2>Login</h2> 
                <p> 
					<label for="id" class="id"><span>ID</span></label><br>
                    <input id="joinid" name="id" required="required" type="text" style="width:230px;"/>
                </p>
                <p> 
                    <label for="password" class="password"><span>Password</span></label><br>
                    <input id="password" name="password" required="required" type="password" style="width:230px;"/> 
                </p>
                <p class="login button">
                    <input type="submit" value="Login" id = "loginclick" style="width:275px;"/> 
				</p>
				<!-- 네이버로그인 -->
				<div id="naverIdLogin" align="center"></div>
				<!-- 카카오로그인 -->
				<div align="center">
				<a  id="custom-login-btn" href="javascript:loginWithKakao()">
				<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="277" height="55"/>
				</a>
				</div>
				<!-- 구글로그인 -->
				<div align="center" class="g-signin2" data-onsuccess="onSignIn" data-theme="dark" data-width="277" data-height="57" data-longtitle="true"></div>
				<br>
                <p class="change_link">
					<span>으아니 아직 회원가입 안함?</span>
					<a href="#toregister" class="to_register" style="margin-left: 100px;">회원가입 하짜</a>
				</p>
            </form>
        </div>
		<div id="register" class="animate form">
            <form action="template.templ?page=joinprocess.me" method="post" autocomplete="on"> 
                <h2> 회원가입 </h2> 
                
                <p> 
					<label for="usernamesignup" class="id"><span>너의 아이디는</span></label><br>
                    <input id="id" name="id" required="required" type="text" style="width:230px;"/>
                </p>
                <p> 
                    <label for="nicknamesignup" class="nickname" ><span>너의 닉네임은</span></label><br>
                    <input id="nickname" name="nickname" required="required" type="text" style="width:230px;"/> 
                </p>
                <p> 
                    <label for="passwordsignup" class="password"><span>비밀번호 정하짜</span></label><br>
                    <input id="joinpassword" name="password" required="required" type="password" style="width:230px;"/>
				</p>
				<p style="margin-bottom: 0px;"> 
                    <label for="passwordsignup_confirm" class="pwd_check"><span>비밀번호 확인하짜</span></label><br>
                    <input id="pwd_check" name="pwd_check" onkeyup="checkPwd()" required="required" type="password" style="width:230px;"/>
                </p>
                <!-- <div id="checkPwd" style="margin-bottom: 30px;">같은 비밀번호를 입력하세요</div> -->
               
                <p class="signin button"> 
					<input type="submit" value="Sign up" id = "joinclick" onclick="DosignUp();" style="width:275px;"/> 
				</p>
                <p class="change_link">  
					<span>아 이미 회원가입 함?</span>
					<a href="#tologin" class="to_register">LogIn</a>
				</p>
            </form>
        </div>
	</div>
</div>
<script type="text/javascript">
				
				
				
				//네이버 function	
					
					var naverLogin = new naver.LoginWithNaverId(
						{
							clientId: "vrfDd_oEEiXRnIQESd1g",
							callbackUrl: "http://localhost:8800/drone/login/navercallbackpage.jsp",
							isPopup: false, /* 팝업을 통한 연동처리 여부 */
							loginButton: {color: "green", type: 3, height: 60}, /* 로그인 버튼의 타입을 지정 */
							callbackHandle: false
						}
					);
					/* 설정정보를 초기화하고 연동을 준비 */
					naverLogin.init();
				
					
					
					
					
					//카카오 function
				      //<![CDATA[
				        // 사용할 앱의 JavaScript 키를 설정해 주세요.
				        Kakao.init('eb9e86dfadcc66d9e9784940e73e3121');
				         function loginWithKakao() {
				         // 로그인 창을 띄웁니다.
				         Kakao.Auth.login({
				          success: function(authObj) {
				             Kakao.API.request({
				                  url: '/v1/user/me',
				                  success: function(res) {
				                    console.log(JSON.stringify(res.id));
				                    console.log(JSON.stringify(res.properties.profile_image));
				                    console.log(JSON.stringify(res.properties.nickname));
				                    var kaid = res.id;
				                    var kanick = res.properties.nickname;
				                    
				                    location.href="template.templ?page=socialjoinprocess.me?id=" + kaid + "&nickname=" + kanick;
				                    
				                    alert(res.properties.nickname + ' 환잉꽌링');
				                  },
				                  fail: function(error) {
				                    alert(JSON.stringify(error));
				                  }
				                });
				              },
				              fail: function(err) {
				                alert(JSON.stringify(err));
				              }
				            });
				         }
				      //]]>
				      
				
					
					
					
					
				//구글 function
				        function onSignIn(googleUser) {
				            // Useful data for your client-side scripts:
				            var profile = googleUser.getBasicProfile();
				            console.log("ID: " + profile.getId()); // Don't send this directly to your server!
				            console.log('Full Name: ' + profile.getName());
				            console.log('Given Name: ' + profile.getGivenName());
				            console.log('Family Name: ' + profile.getFamilyName());
				            console.log("Image URL: " + profile.getImageUrl());
				            console.log("Email: " + profile.getEmail());
				            alert(profile.getName() + ' 환잉환잉');
				            // The ID token you need to pass to your backend:
				            var id_token = googleUser.getAuthResponse().id_token;
				            console.log("ID Token: " + id_token);
				            location.href="../socialjoinprocess.me?id=" + profile.getId() + "&nickname=" + profile.getName() + "&password=" + profile.getId();
				            
				          };
				    </script>
<!---728x90--->
<script src='//publisher.eboundservices.com/dynamicAds/dynamicScript.js'></script>

<div style='margin: 0 auto;text-align: center;margin-top: 5px;'>
<script>
var allowedNumberOfEboundDynamicAdds = 4;
var sizesEboundDynamicAdsDesktop = ['728x90'];
var sizesEboundDynamicAdsTablet = ['728x90'];
var sizesEboundDynamicAdsMobile = ['320x100'];
eboundAdsTagByDevice(sizesEboundDynamicAdsDesktop,sizesEboundDynamicAdsTablet,sizesEboundDynamicAdsMobile, 'ebound_header_tag');

if(typeof user_tag_config == 'undefined'){
	var user_tag_config = {};
}
user_tag_config['ebound_header_tag'] = {};
user_tag_config['ebound_header_tag']['desktop'] = {};
user_tag_config['ebound_header_tag']['desktop']['cpm'] = '';
user_tag_config['ebound_header_tag']['desktop']['adsCode'] = '';
user_tag_config['ebound_header_tag']['tablet'] = {};
user_tag_config['ebound_header_tag']['tablet']['cpm'] = '';
user_tag_config['ebound_header_tag']['tablet']['adsCode'] = '';
user_tag_config['ebound_header_tag']['mobile'] = {};
user_tag_config['ebound_header_tag']['mobile']['cpm'] = '';
user_tag_config['ebound_header_tag']['mobile']['adsCode'] = '';


</script></div>

				

<p class="agileits">Design by SgoLee</p>  
</body>
</html>