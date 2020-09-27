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
	<h3><%=name%>님의 대여목록 입니다.</h3>
	<%
		BookDAO dao = BookDAO.getInstance();
		ArrayList<BookVO> vo = dao.bookList(id);
		
		for(int i=0; i < vo.size(); i++)
		{
			BookVO vos = vo.get(i);
			
			String book_name = vos.getBookName();
			String book_writer = vos.getBookWriter();
			String book_pub = vos.getBookPub();
			
			out.println("책 이름 : " + book_name + "<br>" + "작가 : " + book_writer + "<br>" + "출판사 : " + book_pub + "<br>");	
			
			ArrayList<BookVO> vo1 = dao.bookDate(id);
			
			if(i<vo.size()){
				BookVO vos1 = vo1.get(i);
				Timestamp rent_date = vos1.getRentDate();
				Timestamp rent_end = vos1.getEndDate();
				
				out.println("대여일 : " + rent_date + "<br>" + "반납일 : " + rent_end + "<br><br><br>");
			}
		}
		
		
		
		
		
	%>
</body>
</html>