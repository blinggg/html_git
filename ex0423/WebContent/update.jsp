<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="ex01.*"%>
<%
	String sid=request.getParameter("sid");
	String strLprice=request.getParameter("lprice");
	int lprice=Integer.parseInt(strLprice);
	String strHprice=request.getParameter("hprice");
	int hprice=Integer.parseInt(strHprice);
	
	shopvo vo=new shopvo();
	vo.setSid(sid);
	vo.setLprice(lprice);
	vo.setHprice(hprice);
	
	shopdao dao=new shopdao();
	dao.update(vo);
%>
