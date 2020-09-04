<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="ex0428.*, java.util.*, org.json.simple.*,java.text.*" %>
<%
	String scode=request.getParameter("scode");
	EDAO dao=new EDAO();
	ArrayList<EVO> list=dao.list(scode);
	
	JSONObject jObject=new JSONObject();
	jObject.put("total", dao.count(scode));
	
	JSONArray array=new JSONArray();
	for(EVO vo:list){
		JSONObject obj =new JSONObject();
		obj.put("scode", vo.getScode());
		obj.put("sname", vo.getSname());
		obj.put("lcode", vo.getLcode());
		obj.put("lname", vo.getLname());
		obj.put("grade", vo.getGrade());
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy년MM월dd일");
		String edate=sdf.format(vo.getEdate());
		
		obj.put("edate", edate);
		array.add(obj);
		
	}
	jObject.put("items",array);
	out.println(jObject);

%>