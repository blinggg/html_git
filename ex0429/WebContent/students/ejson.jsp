<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="ex0429.*, java.util.*, org.json.simple.*" %>

<%	String scode=request.getParameter("scode");
	EDAO edao=new EDAO();
	ArrayList<EVO> elist=edao.list(scode);
	
	JSONObject jObject=new JSONObject();
	JSONArray eArray=new JSONArray();
	
	for(EVO vo:elist){
		JSONObject obj=new JSONObject();
		obj.put("lcode",vo.getLcode());
		obj.put("lname", vo.getLname());
		obj.put("grade",vo.getGrade());
		obj.put("edate",vo.getEdate());
		eArray.add(obj);
	}
	
	jObject.put("elist", eArray);
	out.println(jObject);

%>