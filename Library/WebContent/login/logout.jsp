<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
	
	if(id!=null && name!= null){
		session.removeAttribute("id");
		session.removeAttribute("name");
		response.sendRedirect("../main.jsp");
		
	}
	else{
		response.sendRedirect("../main.jsp");
	}
%>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>