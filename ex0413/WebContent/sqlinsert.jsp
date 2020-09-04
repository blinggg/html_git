<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="ex01.*" %>

<%
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	
	out.println("<h1>"+title+"</h1>");
	out.println("<h1>"+content+"</h1>");

	BBSVO vo=new BBSVO();
	vo.setTitle(title);
	vo.setContent(content);
	
	BBSDAO dao=new BBSDAO();
	dao.insert(vo);
%>

<script>
	alert("저장되었습니다.");
	location.href="list.jsp";
</script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="home.css"/>
</head>
<body>

</body>
</html>