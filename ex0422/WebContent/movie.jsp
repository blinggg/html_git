<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex0422.*" %>

<%
	String url="https://openapi.naver.com/v1/search/movie.json";
	String query=request.getParameter("query");
	String display=request.getParameter("display");
	String start=request.getParameter("start");
	
	String result=NaverAPI.search(url, query, display, start);
	out.println(result);
%>


