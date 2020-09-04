<%@page import="java.beans.DesignMode"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ex0506.*, java.util.*, java.text.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[강좌의 평균점수]</title>
<style>
	.title{text-align:center;background:#FFB0B0;color:white;}
	.row:hover{background:#F7DCDC;color:white;cursor:pointer;}
	#ctbl td, #stbl td{text-align:center;border:1px solid #FCD2D2;border-collapse:collapse;}
	#tbl, #etbl{border-collapse:collapse;}
	
</style>
</head>
<body>
	<h1>[강좌의 평균점수]</h1>
	<table id=ctbl border=1 width=700>
		<tr class=title>
			<td>강좌번호</td>
			<td>강좌명</td>
			<td>교수명</td>
			<td>강의실</td>
			<td>평균</td>
			<td>수강하는 학생수</td>
		</tr>
		
	<%
	EDAO dao=new EDAO();
	ArrayList<CVO> list=dao.clist();
	for(CVO vo:list){
		out.println("<tr class=row>");
		out.println("<td>"+vo.getLcode()+"</td>");
		out.println("<td>"+vo.getLname()+"</td>");
		out.println("<td>"+vo.getPname()+"</td>");
		out.println("<td>"+vo.getRoom()+"</td>");
		DecimalFormat df=new DecimalFormat("#0.00");
		String stravg=df.format(vo.getAvg());		
		out.println("<td>"+stravg+"</td>");
		out.println("<td>"+vo.getCnt()+"</td>");
		out.println("</tr>");
	}
	%>
	</table>
	<h1>[학생별 평균점수]</h1>
	<table id=stbl border=1 width=700>
		<tr class=title>
			<td>학번</td>
			<td>학생명</td>
			<td>학생학과</td>
			<td>평균점수</td>
			<td>수강과목수</td>
		</tr>
		
		<%
	EDAO sdao=new EDAO();
	ArrayList<SVO> slist=dao.slist();
	for(SVO vo:slist){
		out.println("<tr class=row>");
		out.println("<td>"+vo.getScode()+"</td>");
		out.println("<td>"+vo.getSname()+"</td>");
		out.println("<td>"+vo.getDept()+"</td>");
		DecimalFormat df=new DecimalFormat("#0.00");
		String stravg=df.format(vo.getAvg());		
		out.println("<td>"+stravg+"</td>");
		out.println("<td>"+vo.getCnt()+"</td>");
		out.println("</tr>");
	}
	%>
		
</body>
</html>