<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "rent.dao.RentDAO" %>

<%  
	String rentNum = request.getParameter("rentNum");
	String bookId = request.getParameter("bookId");
	String userId = request.getParameter("userId");
	String bookRen = request.getParameter("bookRen");
	Timestamp rentStart = new Timestamp(System.currentTimeMillis());
	String rentEnd = request.getParameter("rentEnd");
	
	RentDAO dao = RentDAO.getInstance();
	
	int result = dao.rentInsert(rentNum, bookId, userId, bookRen, rentStart, rentEnd);
	
	if(result == RentDAO.INSERT_SUCC){
%>
	<script type="text/javascript">
		alert("대여를 승인했습니다.");
		location.href="./rent.jsp";
	</script>
<%
	}else if(result == RentDAO.INSERT_FAIL){
%>
	<script type="text/javascript">
		alert("입력값이 잘못되었습니다.");
		location.href="./rent.jsp";
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