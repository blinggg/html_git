<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.*, ex0427.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[수강신청 테이블 목록]</title>
</head>
<body>
	<h1>[수강신청 테이블 목록]</h1>
	<form action="list.jsp">
	<select name=type>
		<option value=lcode selected>강좌번호</option>
		<option value=lname>강좌명</option>
		<option value=pname>교수명</option>
	</select>
	
		<input type=text name=word>
		<input type=submit value=검색>
	</form>
	
	<table width=700 border=1>
		<tr>
		<td>강좌번호</td>
		<td>강좌명</td>
		<td>강의실</td>
		<td>교수명</td>
		<td>교수학과</td>
		</tr>
		
		<%
			String type=request.getParameter("type")==null?
					"lcode":request.getParameter("type");
			String word=request.getParameter("word")==null?
					"":request.getParameter("word");
		
		
			CDAO dao=new CDAO();
			ArrayList<CVO> list=dao.list(type,word);
			
			for(CVO vo:list){
				out.println("<tr>");
				out.println("<td>"+vo.getLcode()+"</td>");
				out.println("<td>"+vo.getLname()+"</td>");
				out.println("<td>"+vo.getRoom()+"</td>");
				out.println("<td>"+vo.getPname()+"</td>");
				out.println("<td>"+vo.getDept()+"</td>");
				out.println("</tr>");
			}
		
		%>
		
	</table>
</body>
</html>