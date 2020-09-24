<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "reservation.login.LoginDTO" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "reservation.login.LoginDAO" %>
    <%
    	request.setCharacterEncoding("EUC-KR");
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		LoginDAO loginDAO = new LoginDAO();
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		int checkNum = loginDAO.userCheck(id, password);
		if(checkNum == -1){
			
	%>
	<script type = "text/javascript">
		alert("아이디가 없습니다.");
		history.go(-1);
	</script>
	<%
		}else if(checkNum == 0){
	%>
	<script type="text/javascript">
		alert("비밀번호가 틀립니다.");
		history.go(-1);
	</script>
	<%
		}else if(checkNum == 1){
			LoginDTO dto = loginDAO.getMember(id);
			
			if(dto == null){
	%>
	<script type="text/javascript">
		alert("존재하지 않는 회원 입니다.");
		history.go(-1);
	</script>
	<%
			} else {
				String name = dto.getName();
				session.setAttribute("id", id);
				session.setAttribute("name", name);
				response.sendRedirect("../welcome.jsp");
			}
		}
	%>
</body>
</html>