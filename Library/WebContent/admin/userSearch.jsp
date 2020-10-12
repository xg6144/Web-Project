<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.dao.UserDAO" %>
<%@ page import = "user.vo.UserVO" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.sql.Timestamp" %>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h3>유저 정보</h3>
	<a href="../main.jsp">뒤로가기</a>
	<br><br>
	<form action = "userSearchList.jsp" method = "get">
		검색 : <input type = "text" name = "search">
		<button type="submit">검색하기</button>
	</form>
	<br>
	<%
		UserDAO dao = UserDAO.getInstance();
		
		ArrayList<UserVO> vos = dao.getUserList();
	%>
		<table border = 1 width = 800 align = center>
		<tr align = center bgcolor = "#FFFF66">
		<td>아이디</td>
		<td>비밀번호</td>
		<td>이름</td>
		<td>이메일</td>
		<td>가입일</td>
	<% 
		for(int i = 0; i < vos.size(); i++)
		{
			UserVO vo = vos.get(i);
			
			String userId = vo.getId();
			String userPw = vo.getPw();
			String userName = vo.getName();
			String userEmail = vo.getEmail();
			Timestamp regDate = vo.getRegDate();
	
	%>
	
		<tr align = center>
			<td><%=userId %></td>
			<td><%=userPw %></td>
			<td><%=userName %></td>
			<td><%=userEmail %></td>
			<td><%=regDate %></td>
	<%
		}
	%>
	</table>
</body>
</html>