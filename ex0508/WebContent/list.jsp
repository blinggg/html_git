<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ex0508.*, org.json.simple.*"%>

<%

	DAO dao=new DAO();
	SVO vo=new SVO();
	
	JSONObject jObject=dao.slist();
	out.println(jObject);
%>