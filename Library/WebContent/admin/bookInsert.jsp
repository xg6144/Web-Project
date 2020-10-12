<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 도서관 ::</title>
</head>
<body>
<form action="./bookInsertProcess.jsp" name="book_ins_f">	
	일련번호: <input type= "text" name = "bookId"> <br>
	이  름 : <input type = "text" name = "bookName"> <br>
	작  가 : <input type = "text" name = "bookWriter"> <br>
	출판사 : <input type = "text" name = "bookPub"> <br>
	장 르 : <select name = "bookGe">
				<option>액션</option>
				<option>SF</option>
				<option>역사</option>
				<option>고전</option>
			</select>  <br>
	<button type="submit">추가</button>
</form>
</body>
</html>