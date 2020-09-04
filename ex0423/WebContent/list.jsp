<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ex01.*, org.json.simple.*, java.util.*"%>

<%
	shopdao dao=new shopdao();
	int count=dao.count();
	
	JSONObject jObject=new JSONObject();
	jObject.put("total", count);
	
	ArrayList<shopvo> array=dao.list();
	JSONArray jArray=new JSONArray();
	for(shopvo vo:array){
		JSONObject obj=new JSONObject();
		obj.put("sid",vo.getSid());
		obj.put("title", vo.getTitle());
		obj.put("hprice", vo.getHprice());
		obj.put("lprice", vo.getLprice());
		jArray.add(obj);
	}
	
	jObject.put("items",jArray);
	out.println(jObject);
	



%>