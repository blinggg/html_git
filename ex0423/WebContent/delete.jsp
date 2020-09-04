<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ex01.*"%>

<%
	String sid=request.getParameter("sid");
	shopdao dao=new shopdao();
	dao.delete(sid);
%>