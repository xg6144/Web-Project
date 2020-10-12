<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "book.vo.BookVO" %>
<%@ page import = "book.dao.BookDAO" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 도서관 ::</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	String _name = request.getParameter("title");
	BookVO bookVO = new BookVO(); 
	bookVO.setBookName(_name);
	
	BookDAO bookDAO = BookDAO.getInstance();
	ArrayList<BookVO> bookVOS = bookDAO.borrowListSearch(bookVO);
%>

	<table border = 1 width = 800 align = center>
		<tr align=center bgcolor = "#FFFF66">
		<td>일련번호</td>
		<td>제목</td>
		<td>작가</td>
		<td>출판사</td>
		<td>장르</td>
		<td>비고</td>
		<%
		for(int i=0; i < bookVOS.size(); i++){
			
			BookVO vo = bookVOS.get(i);
			String id = vo.getBookId();
			String name = vo.getBookName();
			String writer = vo.getBookWriter();
			String pub = vo.getBookPub();
			String ge = vo.getBookGe();
		%>
		
		<tr align = center>
			<td><%=id %></td>
			<td><%=name %></td>
			<td><%=writer %></td>
			<td><%=pub %></td>
			<td><%=ge %></td>
			<td><a href="borrowProcess.jsp">대여신청</a></td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>