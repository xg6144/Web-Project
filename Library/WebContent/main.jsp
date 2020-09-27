<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<%
		String id = (String)session.getAttribute("id");
		String name = (String)session.getAttribute("name");
	
		if(id == null)
		{
	%>
	<a href="./login/loginForm.jsp">로그인</a>
	<a href="./register/regForm.jsp">회원가입</a>
	<%
		}else{
	%>
	<%=name %>님 환영합니다.
	<br><br>
	<a href="./user/myPage.jsp">마이페이지</a>
	<%
		}
	%>
	<a href="./book/book_insert.jsp">책 추가</a>
</body>
</html>