<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ex0504.*, java.util.*, org.json.simple.*, java.text.*"%>

<%
	DecimalFormat df=new DecimalFormat("##0.00");

	enrollDAO dao=new enrollDAO();
	ArrayList<enrollVO> list=dao.clist();

	JSONObject jObject=new JSONObject();
	JSONArray array=new JSONArray();
	
	for(enrollVO vo:list){
		JSONObject obj=new JSONObject();
		obj.put("lcode", vo.getLcode());
		obj.put("lname", vo.getLname());
		obj.put("pname", vo.getPname());
		String avg=df.format(vo.getAvg());
		obj.put("avg", avg);
		array.add(obj);
		
	}
	jObject.put("clist", array);
	out.println(jObject);


%>