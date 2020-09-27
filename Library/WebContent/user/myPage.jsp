<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%
    	String name = (String)session.getAttribute("name");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%=name %>님의 마이페이지
	<br><br>
	<a href="borrowList.jsp">내 대여목록</a>
	<a href="../main.jsp">홈으로</a>
</body>
</html>