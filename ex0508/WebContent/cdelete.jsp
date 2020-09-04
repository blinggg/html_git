<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ex0508.*, org.json.simple.*"%>

<%
	String lcode=request.getParameter("lcode");

	DAO dao=new DAO();
	JSONObject jObject=dao.cdelete(lcode);
	out.println(jObject);


%>