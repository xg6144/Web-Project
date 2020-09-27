<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import = "book.dao.BookDAO" %>
    <%@ page import = "book.vo.BookVO" %>
    <%@ page import = "java.util.ArrayList" %>
    <%@ page import = "java.sql.Timestamp" %>
    <%
    	String name = (String)session.getAttribute("name");
    	String id = (String)session.getAttribute("id");
    %>
    
    <%
    	if(name == null){
    %>
    <jsp:forward page = "../login/login.jsp"/>
    <%
    	}
    %>
    <jsp:include page="./myPage.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3><%=name%>���� �뿩��� �Դϴ�.</h3>
	<%
		BookDAO dao = BookDAO.getInstance();
		ArrayList<BookVO> vo = dao.bookList(id);
		
		for(int i=0; i < vo.size(); i++)
		{
			BookVO vos = vo.get(i);
			
			String book_name = vos.getBookName();
			String book_writer = vos.getBookWriter();
			String book_pub = vos.getBookPub();
			
			out.println("å �̸� : " + book_name + "<br>" + "�۰� : " + book_writer + "<br>" + "���ǻ� : " + book_pub + "<br>");	
			
			ArrayList<BookVO> vo1 = dao.bookDate(id);
			
			if(i<vo.size()){
				BookVO vos1 = vo1.get(i);
				Timestamp rent_date = vos1.getRentDate();
				Timestamp rent_end = vos1.getEndDate();
				
				out.println("�뿩�� : " + rent_date + "<br>" + "�ݳ��� : " + rent_end + "<br><br><br>");
			}
		}
		
		
		
		
		
	%>
</body>
</html>