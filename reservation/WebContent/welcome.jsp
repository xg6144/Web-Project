<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   
   <%
   	String name = (String)session.getAttribute("name");
   	String id = (String)session.getAttribute("id");
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환영합니다!</title>
</head>
<body>
	<h3><%=name %>님 안녕하세요.</h3><br>
	<form action = "logout.jsp" method = "post">
		<input type = "submit" value = "로그아웃">&nbsp;&nbsp;&nbsp;
		<input type = "submit" value = "정보수정">
	</form>
</body>
</html>