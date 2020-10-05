<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
<form action = "./rentProcess.jsp"> 
	대출번호 : <input type = "text" name = "rentNum"><br>
	도서일련번호 : <input type = "text" name = "bookId"><br>
	회원ID : <input type = "text" name = "userId"><br>
	대여승인 : <input type = "text" name = "bookRen" maxlength="1"><br>
	대여종료일 : <input type ="date" name = "rentEnd"><br>
	<button type = "submit">대여</button>
</form>
</body>
</html>