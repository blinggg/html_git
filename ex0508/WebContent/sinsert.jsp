<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ex0508.*, org.json.simple.*"%>

<%
	String scode=request.getParameter("scode");
	String sname=request.getParameter("sname");
	String dept=request.getParameter("dept");

	DAO dao=new DAO();
	SVO vo=new SVO();
	
	vo.setScode(scode);
	vo.setSname(sname);
	vo.setDept(dept);
	
	JSONObject jObject=dao.insert(vo);
	out.println(jObject);


%>