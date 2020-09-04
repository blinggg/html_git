<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ex0507.*,java.util.*,org.json.simple.*"%>

<%	String pcode=request.getParameter("pcode");
	String pname=request.getParameter("pname");
	DAO dao=new DAO();
	ArrayList<VO> list=dao.pinsert(pcode,pname);
	
	JSONArray array=new JSONArray();
	for(VO vo:list){
		JSONObject obj=new JSONObject();
		obj.put("pcode", vo.getCode());
		obj.put("pname", vo.getName());
		array.add(obj);
	}
	
	out.println(array);

%>