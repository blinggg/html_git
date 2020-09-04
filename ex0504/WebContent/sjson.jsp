<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ex0504.*, java.util.*, org.json.simple.*"%>

<%
	enrollDAO dao=new enrollDAO();
	ArrayList<studentsVO> list=dao.slist();
	
	JSONObject jObject=new JSONObject();
	JSONArray array=new JSONArray();

	for(studentsVO vo:list){
		JSONObject obj=new JSONObject();
		obj.put("dept", vo.getDept());
		obj.put("scode", vo.getScode());
		obj.put("sname", vo.getSname());
		obj.put("avg", vo.getAvg());
		array.add(obj);
	}
	
	jObject.put("slist", array);
	out.println(jObject);

%>