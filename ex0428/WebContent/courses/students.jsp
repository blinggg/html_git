<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="ex0428.*, java.util.*, org.json.simple.*,java.text.*" %>

<%	
	String lcode=request.getParameter("lcode");
	SCDAO dao=new SCDAO();
	ArrayList<SCVO> sclist=dao.sclist(lcode);
	
	JSONObject jObject=new JSONObject();
	
	JSONArray array=new JSONArray();
	for(SCVO vo:sclist){
		JSONObject obj=new JSONObject();
		obj.put("scode",vo.getScode());
		obj.put("sname", vo.getSname());
		obj.put("sdept",vo.getSdept());
		obj.put("year", vo.getYear());
		
		array.add(obj);
	}
		jObject.put("items", array);
		out.println(jObject);

%>