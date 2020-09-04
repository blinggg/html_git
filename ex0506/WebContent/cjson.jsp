<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ex0506.*, java.util.*, org.json.simple.*"%>

<%	String lcode=request.getParameter("lcode");
	
	CDAO dao=new CDAO();
	ArrayList<SVO> list=dao.slist(lcode); //특정 강의를 듣는 학생목록 출력하기
	SVO vo=dao.avg(lcode);
	
	JSONObject jObject=new JSONObject();
	JSONArray jArray=new JSONArray();
	
	for(SVO v:list){
	JSONObject obj=new JSONObject();
	obj.put("scode",v.getScode());
	obj.put("sname", v.getSname());
	obj.put("grade", v.getCnt());
	jArray.add(obj);
	
	}
	jObject.put("slist", jArray);
	
	jObject.put("avg", vo.getAvg());
	jObject.put("cnt", vo.getCnt());
	
	out.println(jObject);
	
%>