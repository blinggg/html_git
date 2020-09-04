<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="ex0407.*" %>
<%
	StudentVO vo=new StudentVO();
	vo.setSno(request.getParameter("sno"));
	vo.setSname(request.getParameter("sname"));
	vo.setTel(request.getParameter("tel"));
	vo.setAddress(request.getParameter("address"));
	
	StudenDAO dao=new StudenDAO();
	dao.insert(vo);
%>

<!DOCTYPE html>
<html>
<head>                                                                                        
<body>
	<h1>데이터 입력되었습니다.</h1>
	<a href="ex03.html">계속입력</a>
</body>
</html>