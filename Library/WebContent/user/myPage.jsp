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
	<%=name %>���� ����������
	<br><br>
	<a href="borrowList.jsp">�� �뿩���</a>
	<a href="../main.jsp">Ȩ����</a>
</body>
</html>