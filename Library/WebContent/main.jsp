<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
		String id = (String)session.getAttribute("id");
		String name = (String)session.getAttribute("name");
	
		if(id == null || name == null)
		{
	%>
	<a href="./login/loginForm.jsp">로그인</a>
	<a href="./register/regForm.jsp">회원가입</a>
	
	<%
		}
		else if(id.equals("admin") && name.equals("관리자")){
	%>
	<h3><%=name %>님 환영합니다.</h3>
	<a href="./admin/bookInsert.jsp">도서추가</a>
	<a href="./admin/userSearch.jsp">회원목록</a>
	<a href="./admin/userRentList.jsp">대여신청리스트</a>
	<a href="./admin/rent.jsp">대여승인</a>
	<a href="./login/logout.jsp">로그아웃</a>
	
	<%
		}else{ 
	%>
	<h3><%=name %>님 환영합니다.</h3>
	<br><br>
	<a href="./user/myPage.jsp">마이페이지</a>
	<a href="./user/borrow.jsp">책 대여하기</a>
	<a href="./login/logout.jsp">로그아웃</a>
	<%
		}
	%>
</body>
</html>