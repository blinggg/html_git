<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ex0507.*, java.util.*, org.json.simple.*"%>

<%	String scode=request.getParameter("scode");
	DAO dao=new DAO();
	JSONObject jObject=dao.elist(scode);
	out.println(jObject);

%>