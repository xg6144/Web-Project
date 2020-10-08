<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ page import = "user.dao.UserDAO" %>
<%@ page import = "user.vo.UserVO" %>

<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		UserDAO dao = UserDAO.getInstance();
	
		int checkNum = dao.userLogin(id, pw);
		if(checkNum == -1){
	%>
	<script type = "text/javascript">
		alert("아이디가 없습니다.");
		history.go(-1);
	</script>
	<%
		}else if(checkNum == 0){
	%>
	<script type = "text/javascript">
		alert("비밀번호가 틀립니다.");
		history.go(-1);
	</script>
	<%
		} else if(checkNum == 1){
			UserVO uvo = dao.getUser(id);
			
			if(uvo == null){
	%>
			<script type = "text/javascript">
				alert("존재하지 않는 회원.");
				history.go(-1);
			</script>
	<%
			}else{
				String name = uvo.getName();
				session.setAttribute("id", id);
				session.setAttribute("name", name);
				session.setAttribute("ValidMem", "ok");
				response.sendRedirect("../main.jsp");
			}
		}
	%>
</body>
</html>