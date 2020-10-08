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
	<br>
	<form action = "userSearchList.jsp" method = "get">
		검색 : <input type = "text" name = "search">
		<button type="submit">검색하기</button>
	</form>
	<br>
	<p>
	<%
		UserDAO dao = UserDAO.getInstance();
		
		ArrayList<UserVO> vos = dao.getUserList();
		
		for(int i = 0; i < vos.size(); i++)
		{
			UserVO vo = vos.get(i);
			
			String userId = vo.getId();
			String userPw = vo.getPw();
			String userName = vo.getName();
			String userEmail = vo.getEmail();
			Timestamp regDate = vo.getRegDate();
			
			out.println((i+1) + "번 | " + "ID : " + 
			userId + "| PW : " + userPw + "| 이름 : " 
					+ userName + "| 이메일 : " 
					+ userEmail + "| 가입일 : " + regDate+"<br>");
		}
	
	%>
	</p>
	
</body>
</html>