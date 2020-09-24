<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "javax.naming.Context" %>
    <%@ page import = "javax.naming.InitialContext" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "javax.sql.DataSource" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
		String name;
		String id;
		String password;
		String email;
		String address;
		String birth_yy;
		String birth_mm;
		String birth_dd;
	%>
	<%
		name = request.getParameter("name");
        id = request.getParameter("id");
        password = request.getParameter("password");
        email = request.getParameter("email");
        address = request.getParameter("address");
        birth_yy = request.getParameter("birth_yy");
        birth_mm = request.getParameter("birth_mm");
        birth_dd = request.getParameter("birth_dd");
        
        Connection conn = null;
    	PreparedStatement pstmt = null;
        
        String sql = "insert into register (name, id, password, address, email, birthday) values (?, ?, ?, ?, ?, ?)";
        
        try{
        	request.setCharacterEncoding("utf-8");
        	response.setContentType("text/html; charset=utf-8 ");
        	
        	Context context = new InitialContext();
        	DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
        	
        	conn = ds.getConnection();
        	pstmt = conn.prepareStatement(sql);
        	
        	pstmt.setString(1,name);
        	pstmt.setString(2, id);
        	pstmt.setString(3, password);
        	pstmt.setString(4, address);
        	pstmt.setString(5, email);
        	pstmt.setString(6, birth_yy+birth_mm+birth_dd);
        	
        	int i = pstmt.executeUpdate();
        	
        	if(i==1){
        		System.out.println("Success");
        	}else{
        		System.out.println("Fail");
        	}
        }catch(Exception e){
        	e.printStackTrace();
        }finally{
        	try{
        		if(conn!=null){conn.close();}
        		if(pstmt != null) {pstmt.close();}
        		response.sendRedirect("../main.html");
        	}catch(Exception e){
        		e.printStackTrace();
        	}
        }
    %>
</body>
</html>