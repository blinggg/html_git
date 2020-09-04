<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@page import="java.util.*, ex01.*" %>
<%
	AddDAO dao=new AddDAO();//dao 객체생성하기
	ArrayList<AddVO> array=dao.list();

%>

<!DOCTYPE html>
<html>
<head>
	<style>
		div{background:gray;font-size:30px};
	
	</style>
<meta charset="UTF-8">
<title>목록</title>
</head>
<body>
	<h1>목록출력합니다.</h1>
	<%
		for(int i=0; i<array.size(); i++){
			AddVO vo=array.get(i); //객체 선언하면서 i번째 값을 꺼내온다.
			out.println("<div>");
			out.println(vo.getAno());
			out.println("<a href='read.jsp?bno="+vo.getAno()+"'>"+vo.getAname()+"</a>");
			out.println(vo.getTel());
			out.println(vo.getAddress());
			out.println("</div>");
			
		}

	%>
	<hr>
	<a href="insert.jsp">[글쓰기]</a>
	
</body>
</html>