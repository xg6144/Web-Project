<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
		request.setCharacterEncoding("EUC-KR");
	%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="utf-8">
<title>Insert title here</title>
<script src="../javaScript/book_ins.js"></script>
</head>
<body>
	<form action = "book_insert_process.jsp" method = "get" name = "book_ins_f">
		일련번호 : <input type = "text" name = "book_id" size = "20"> <br>
		이름 : <input type = "text" name = "book_name" size = "20"><br>
		작가 : <input type = "text" name = "book_writer" size = "20"><br>
		출판사 : <input type = "text" name = "book_pub" size = "20"><br>
		장르 : <select name = "book_ge">
			<option>SF판타지</option>
			<option>무협</option>
			<option>액션</option>
		</select>
		<br>
		<button type ="submit" onclick="book_chk()">확인</button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="reset" onclick="history.back(-1)">뒤로가기</button>
	</form>
</body>
</html>