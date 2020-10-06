<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "rent.dao.RentDAO" %>
<%@ page import = "rent.vo.RentVO" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.sql.Timestamp" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href = "../main.jsp">뒤로가기</a><br><br>
<%
	RentDAO dao = RentDAO.getInstance();
	
	ArrayList<RentVO> vos = dao.getRentList(); 
	
	for(int i=0; i < vos.size(); i++)
	{
		RentVO vo = vos.get(i);
		
		String bookName = vo.getBookName();
		String bookWriter = vo.getBookWriter(); 
		String bookPub = vo.getBookPub();
		String bookGe = vo.getBookGe();
		String userName = vo.getUserName();
		Timestamp rentDate = vo.getRentDate();
		
		out.println("<strong>"+ (i+1) + "번</strong> |" +"  <p>회원명 : " + "<strong>"+userName+"</strong></p>" + "<p>도서이름 : " + "<strong>" + bookName + "</strong></p>" + "  <p>작가 : " + "<strong>" + bookWriter + "</strong></p>" + " <p>출판사 : " + 
		"<strong>" + bookPub + "</strong></p>" + "  장르 : " + "<strong>" + bookGe +"</strong>");
		out.println("<p>신청일 : <strong>" + rentDate + "</strong></p>");
	}
%>
</body>
</html>