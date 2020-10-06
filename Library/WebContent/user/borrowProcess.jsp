<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "book.vo.BookVO" %>
<%@ page import = "rent.dao.RentDAO" %>
<%@ page import = "java.sql.Timestamp" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String bookName = (String)session.getAttribute("bookName");
	String bookWriter = (String)session.getAttribute("bookWriter");
	String bookPub = (String)session.getAttribute("bookPub");
	String bookGe = (String)session.getAttribute("bookGe");
	String userName = (String)session.getAttribute("name");
	Timestamp rentDate = (Timestamp)session.getAttribute("rentDate");
	
	BookVO vo = new BookVO(bookName, bookWriter, bookPub, bookGe);
	
	RentDAO dao = RentDAO.getInstance();	
	
	int result = 0; 
	result = dao.rentListInsert(bookName, bookWriter, bookPub, bookGe, userName, rentDate);
	
	if(result == RentDAO.INSERT_SUCC){
%>
	<script type="text/javascript">
		alert("신청이 완료되었습니다.");
		location.href="../main.jsp";
	</script>
<% 
	}else if(result == RentDAO.INSERT_FAIL){
%>
	<script type ="text/javascript">
		alert("신청이 불가능한 도서입니다.");
		location.href="./borrow.jsp";
	</script>
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 도서관 ::</title>
</head>
<body>

</body>
</html>