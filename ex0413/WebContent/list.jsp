<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.*, ex01.*" %>     
<%
	BBSDAO dao=new BBSDAO();
	ArrayList<BBSVO> array=dao.list();
%>    
    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>게시판 목록</title>
<link rel="stylesheet" href="home.css"/>
</head>
<body>
	<div id=page>
	<h1>[게시판 목록]</h1>
	<hr>
	
	<%
		for(int i=0; i<array.size(); i++){
			BBSVO vo=array.get(i);
			out.println("<div>");
			out.println(vo.getBno());
			out.println("<a href='read.jsp?bno="+vo.getBno()+"'>"+vo.getTitle()+"</a>"); //wh
			out.println(vo.getWdate());
			out.println("</div>");
		}
	%>
	
	<hr>
	<a href="insert.jsp">[글쓰기]</a>

		
	</div>
</body>
</html>