<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.dao.UserDAO" %>
<%@ page import = "user.vo.UserVO" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.sql.Timestamp" %>
<!DOCTYPE html>
<html>
<head>
<style>
	h1{
		text-align : center;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원정보출력</h1>
	<%
		request.setCharacterEncoding("utf-8");
		String _name = request.getParameter("search");
		UserVO userVO = new UserVO();
		userVO.setName(_name);
		UserDAO userDAO = UserDAO.getInstance();
		ArrayList<UserVO> userVOS = userDAO.listUsers(userVO);
	%>
	
	<table border = 1 width = 800 align = center>
		<tr align = center bgcolor = "#FFFF66">
		<td>아이디</td>
		<td>비밀번호</td>
		<td>이름</td>
		<td>이메일</td>
		<td>가입일</td>
	
	
	<%
		for(int i =0; i <userVOS.size(); i++)
		{
			UserVO vo = userVOS.get(i);
			String id = vo.getId();
			String pw = vo.getPw();
			String name = vo.getName();
			String email = vo.getEmail();
			Timestamp reg = vo.getRegDate();
	%>
		<tr align = center>
			<td><%=id %></td>
			<td><%=pw %></td>
			<td><%=name %></td>
			<td><%=email %></td>
			<td><%=reg %></td>
		</tr>
		
		<%
		}
		%>
	</table>
</body>
</html>