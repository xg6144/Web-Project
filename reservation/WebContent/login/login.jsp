<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<style>
	#title{
		background-color : skyblue
	}
	#wrap{
		width : 530px;
		margin-left : auto;
		margin-right : auto;
		text-align : center;
	}
	td{
		border : 1px solid skyblue
	}
	table{
		border:3px solid skyblue
	}
</style>
</head>
<body>
<div id ="wrap">
	<br><br>
	<b><font size ="6" color = "gray">로그인</font></b>
	<br><br><br>
	<form action="loginCheck.jsp" method = "post">
		<table>
			<tr>
				<td id ="title"> 아이디</td>
				<td>
					<input type ="text" name = "id" maxlength = "20">
				</td>
				
				<tr>
					<td id = "title">비밀번호</td>
					<td>
						<input type="password" name = "password" maxlength="15">
					</td>
				<tr>
					<td> 
						<input type="submit" value="로그인"/>
						
					</td>
				</tr>
		</table>
	</form>
	
	<form action = "../Register/register.jsp" method = "post">
							<input type="submit" value = "회원가입">
						</form>
</div>
</body>
</html>