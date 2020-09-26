<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="utf-8">
<title>:: 로그인 ::</title>
<link rel="stylesheet" type="text/css" href="../css/login.css" />
<script src="../javaScript/login.js"></script>

</head>
<body>
	<div class="inner_login">
    <div class="login_tistory">

        <form method="post" id="authForm" action="loginProcess.jsp" name ="log_f">
            <fieldset>
            <legend class="screen_out">로그인</legend>
            <div class="box_login">
                <div class="inp_text">
                <label for="loginId" class="screen_out">아이디</label>
                <input type="text" id="loginId" name="id" placeholder="ID" >
                </div>
                <div class="inp_text">
                <label for="loginPw" class="screen_out">비밀번호</label>
                <input type="password" id="loginPw" name="pw" placeholder="Password" >
                </div>
            </div>
            <button type="button" class="btn_login" onclick="log_chk()">로그인</button>
            <div class="login_append">
                <div class="inp_chk"> <!-- 체크시 checked 추가 -->
                <input type="checkbox" id="keepLogin" class="inp_radio"  name="keepLogin">
                <label for="keepLogin" class="lab_g">
        <span class="img_top ico_check"></span>
        <span class="txt_lab">로그인 상태 유지</span>
        </label>
                </div>
                <span class="txt_find">
                <a href="/member/find/loginId" class="link_find">아이디</a>
                    / 
                <a href="/member/find/password" class="link_find">비밀번호 찾기</a>
                </span>
            </div>
            
            <div>
            	<a href="../register/regForm.jsp" id="register">회원가입</a>
            </div>
            </fieldset>
        </form>
        
    </div>
</div>
</body>
</html>