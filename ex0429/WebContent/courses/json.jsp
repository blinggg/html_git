<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ex0429.*, java.util.*, org.json.simple.*"%>

<%
	String lcode=request.getParameter("lcode");
	EDAO edao=new EDAO();
	ArrayList<EVO> list=edao.clist(lcode);

	JSONObject jObject=new JSONObject();
	JSONArray jArray=new JSONArray();
	
	for(EVO vo:list){
		JSONObject obj=new JSONObject();
		obj.put("scode",vo.getScode());
		obj.put("sname", vo.getSname());
		obj.put("edate", vo.getEdate());
		obj.put("grade", vo.getGrade());
		jArray.add(obj);
	}
	jObject.put("elist",jArray);
	out.println(jObject);
	
%>