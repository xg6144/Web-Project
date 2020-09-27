<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "book.dao.BookDAO" %>
    
    <%
    	request.setCharacterEncoding("UTF-8");
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String book_Id = request.getParameter("book_id");
		String book_Name = request.getParameter("book_name");
		String book_Writer = request.getParameter("book_writer");
		String book_Pub = request.getParameter("book_pub");
		String book_Ge = request.getParameter("book_ge");
		
		BookDAO dao = BookDAO.getInstance();
		int result = dao.insertBook(book_Id, book_Name, book_Writer, book_Pub,book_Ge);
		
		if(result == BookDAO.BOOK_INS_SUCC)
		{
	%>
	<script type = "text/javascript">
		alert("기입 성공!")
		location.href="book_insert.jsp";
	</script>
	<%
		} else{
	%>
	<script type = "text/javascript">
		alert("기입 실패!")
		location.href="book_insert.jsp";
	</script>
	<%
		}
	%>
</body>
</html>