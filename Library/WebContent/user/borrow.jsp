<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "book.dao.BookDAO" %>
<%@ page import = "book.vo.BookVO" %>
<%@ page import = "java.util.ArrayList" %>
<%
	BookDAO dao = BookDAO.getInstance();
	ArrayList<BookVO> vo = dao.borrowList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action ="borrowProcess.jsp">
	제목 : <input type = "text" >
</form>
<h3>대여가능한 책 목록</h3> 
	<table border = "1" cellspacing = "0">
		<tr>
		<td>일련번호</td>
		<td>제목</td>
		<td>작가</td>
		<td>출판사</td>
		<td>장르</td>
		<td>비고</td>
		
		<%
		for(int i=0; i < vo.size(); i++){
			BookVO vos = vo.get(i);
			
			String bookId = vos.getBookId();
			session.setAttribute("bookId", bookId);
		%><tr>
		<td><%=bookId%></td>
		<%
			String bookName = vos.getBookName();
			session.setAttribute("bookName", bookName);
		%>
		<td><%=bookName %></td>
		<%
			String bookWriter = vos.getBookWriter();
			session.setAttribute("bookWriter", bookWriter);
		%>
		<td><%=bookWriter %></td>
		<%
			String bookPub = vos.getBookPub();
			session.setAttribute("bookPub", bookPub);
		%>
		<td><%=bookPub %></td>
		<%
			String bookGe = vos.getBookGe();
			session.setAttribute("bookGe", bookGe);
		%>
		<td><%=bookGe %></td>
		<td>
		 <a href="borrowProcess.jsp">대여신청</a>
		<%
		}
		%>
		
	</table>
</body>
</html>