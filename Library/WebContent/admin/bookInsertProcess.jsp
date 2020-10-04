<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "book.dao.BookDAO" %>
<%
	request.setCharacterEncoding("utf-8");
%>

<%
	String bookId = request.getParameter("bookId");
	String bookName = request.getParameter("bookName");
	String bookWriter = request.getParameter("bookWriter");
	String bookPub = request.getParameter("bookPub");
	String bookGe = request.getParameter("bookGe");
	
	BookDAO dao = BookDAO.getInstance();
	int result = dao.insertBook(bookId, bookName, bookWriter, bookPub, bookGe);
	
	if(result == BookDAO.BOOK_INS_SUCC)
	{
%>
	<script type="text/javascript">
		alert("추가했습니다!");
		location.href="./bookInsert.jsp";
	</script>
<%
	}else if(result == BookDAO.BOOK_INS_FAIL)
	{
%>
	<script type = "text/javascript">
		alert("일련번호가 중복입니다!");
		location.href="./bookInsert.jsp";
	</script>
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>