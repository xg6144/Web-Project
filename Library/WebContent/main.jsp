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
	<a href="./login/loginForm.jsp">�α���</a>
	<a href="./register/regForm.jsp">ȸ������</a>
	<%
		}else{
	%>
	<%=name %>�� ȯ���մϴ�.
	<br><br>
	<a href="./user/myPage.jsp">����������</a>
	<%
		}
	%>
	<a href="./book/book_insert.jsp">å �߰�</a>
</body>
</html>