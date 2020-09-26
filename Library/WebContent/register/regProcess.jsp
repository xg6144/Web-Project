<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import = "user.dao.UserDAO" %>
    <%@ page import = "java.sql.Timestamp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("EUC-KR");
	%>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		Timestamp regDate = new Timestamp(System.currentTimeMillis());
		String email = request.getParameter("email");
		
		UserDAO dao = UserDAO.getInstance();
		int result = dao.insertUser(id, pw, name, regDate, email);
		
		if(result == UserDAO.INSERT_SUCCESS)
		{	
	%>
	<script type="text/javascript">
		alert("회원가입에 성공했습니다.");
		location.href="loginForm.jsp";
	</script>
	<%
		}else if(result == UserDAO.INSERT_FAIL){
	%>
	<script type="text/javascript">
		alert("이미 존재하는 아이디 입니다.");
		location.href="../register/regForm.jsp";
	</script>
	<%
		}else{
	%>
	
	<%
		}
	%>
</body>
</html>