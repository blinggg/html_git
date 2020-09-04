<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String name=request.getParameter("textname");
	String address=request.getParameter("textaddress");

	out.println("<h1>이름:"+name+"</h1>");
	out.println("<h1>주소:"+address+"</h1>");
	
%>