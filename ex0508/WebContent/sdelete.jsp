<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ex0508.*, org.json.simple.*"%>

<%
	String scode=request.getParameter("scode");
	
	DAO dao=new DAO();

	JSONObject jObject=dao.sdelete(scode);
	out.println(jObject);


%>