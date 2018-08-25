<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.DriverManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="750876275305-duhcjp8ipktuoj6nl29il355r9l3eihd.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
<title>Insert title here</title>
<style>
   table{
      margin : auto;
      width : 400px;
      border : 1px solid gray;
      text-align : center;
   }
   .td_title {
      font-weight : bold;
      font-size : x-large;
   }
</style>
<script>
   function enterkey() {
       if (window.event.keyCode == 13) {
   
            // 엔터키가 눌렸을 때 실행할 내용
            if (document.getElementById("password").value == "")
            {
            alert("비밀번호 입력해");
            }
         else{
            loginform.submit(); 
          }
       }
   }
   
</script>
</head>
<body>
<form id="login" name="loginform" action="./login.me" method="post">
<table>
   <tr>
      <td colspan="2" class = "td_title">
         로그인 페이지
      </td>
   </tr>
   <tr>
      <td><label for = "id">아이디 : </label></td>
      <td><input type="text" name = "id" id = "id"/></td>
   </tr>
   <tr>
      <td><label for = "password">비밀번호 : </label></td>
      <td><input type="password" name = "password" id = "password" onkeyup="enterkey();"/></td>
   </tr>
   <tr>
      <td colspan="2">
      <a href = "javascript:loginform.submit()">로그인</a>&nbsp;&nbsp;
      <a href = "joinForm.jsp">회원가입</a>
      </td>
   </tr>
</table>
</form>

<!-- 네이버로그인 -->
<div id="naverIdLogin"></div>
<!-- 카카오로그인 -->
<div>
<a  id="custom-login-btn" href="javascript:loginWithKakao()">
<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="277" height="55"/>
</a>
</div>
<!-- 구글로그인 -->
<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark" data-width="277" data-height="60" data-longtitle="true"></div>


<script type="text/javascript">



//네이버 function   
   
   var naverLogin = new naver.LoginWithNaverId(
      {
         clientId: "vrfDd_oEEiXRnIQESd1g",
         callbackUrl: "http://localhost:8800/finalsocket/client_chat.me",
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
                    var kaid = JSON.stringify(res.id);
                    var kanick = JSON.stringify(res.properties.nickname);

                    
                    try {
                       String driver= "oracle.jdbc.driver.OracleDriver";
                       Class.forName(driver);
                       String url="jdbc:oracle:thin:@localhost:1521:xe";
                       String userName="hr";
                       String password="123456";
                       Connection con = DriverManager.getConnection(url,userName,password);
                       Statement st = con.createStatement();
                       String sql="insert into chatmember values (?),kanick,kaid)";
                       st.executeUpdate(sql);
                       con.close();
                       st.close();
                    }
                    catch (Exception e){
                       System.out.println(e);
                    }
                    

                    alert(res.properties.nickname + ' 환잉환잉');
                    location.href="client_chat.me?nickname=" + res.properties.nickname;
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
            location.href="client_chat.me?nickname=" + profile.getName();
            
          };
    </script>

</body>
</html>