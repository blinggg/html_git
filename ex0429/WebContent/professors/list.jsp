<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="ex0429.*, java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>   
<title>교수목록</title>
<style>
	.title{text-align:center;background:#4394E7;color:white;}
	.row:hover{background:#ABC8E5;color:white;cursor:pointer;}
	#slist, #clist{display:none;}
	#tbl td,#stbl td, #ctbl td{text-align:center;}
	#tbl, #stbl, #ctbl{border-collapse:collapse;}
	td{border:2px solid #216FC0;}
	
</style>
</head>
<body>
	<div id=menu>
		<span class=m><a href="/ex0429/professors/list.jsp" style=text-decoration:none;background:#4394E7;color:white;>교수관리</a></span>
		<span class=m><a href="/ex0429/students/list.jsp" style=text-decoration:none;background:#4394E7;color:white;>학생관리</a></span>
		<span class=m><a href="/ex0429/courses/list.jsp" style=text-decoration:none;background:#4394E7;color:white;>강좌관리</a></span>
	</div>
	<h1>[교수목록]</h1>
	<table id=tbl border=1 width=700>
		<tr class=title>
			<td>교수번호</td>
			<td>교수이름</td>
			<td>소속학과</td>
			<td>임용일</td>
			<td>직급</td>
			<td>급여</td>
		</tr>
		
		<%
			PDAO dao=new PDAO();
			ArrayList<PVO> list=dao.list();
			
			for(PVO vo:list){
				out.println("<tr class=row>");
				out.println("<td class=pcode>"+vo.getPcode()+"</td>");
				out.println("<td class=pname>"+vo.getPname()+"</td>");
				out.println("<td>"+vo.getDept()+"</td>");
				out.println("<td>"+vo.getHiredate()+"</td>");
				out.println("<td>"+vo.getTitle()+"</td>");
				out.println("<td>"+vo.getSalary()+"</td>");
				out.println("</tr>");
			}
		%>
	</table>
	
	<div id=slist>
		<h1>[학생목록]</h1>
		<div><h3>담당교수:<span class=pname></span><h3></div>
		<table id=stbl border=1 width=700></table>
		 <script id="stemp" type="text/x-handlebars-template">
				<tr class=title>
					<td>학생코드</td>
					<td>학생명</td>
					<td>학생학과</td>
					<td>학년</td>
					<td>생년월일</td>	
				</tr>
	
				{{#each slist}}
				<tr class=row>
					<td>{{scode}}</td>
					<td>{{sname}}</td>
					<td>{{dept}}</td>
					<td>{{year}}</td>
					<td>{{birthday}}</td>
				</tr>
			{{/each}}
		</script>
	</div>
	
	<div id=clist>
		<h1>[강좌목록]</h1>
		<div><h3>담당교수:<span class=pname></span><h3></div>
		<table id=ctbl border=1 width=700></table>
		 <script id="ctemp" type="text/x-handlebars-template">
			<tr class=title>
					<td>강좌코드</td>
					<td>강좌명</td>
					<td>강의시간수</td>
					<td>강의실</td>
					<td>최대수강인원수</td>
					<td>수강신청인원수</td>	
				</tr>

			{{#each clist}}
			<tr class=row>
				<td>{{lcode}}</td>
				<td>{{lname}}</td>
				<td>{{hours}}</td>
				<td>{{room}}</td>
				<td>{{capacity}}</td>
				<td>{{persons}}</td>
			</tr>
			{{/each}}
		</script>
	</div>
</body>
<script>

var pcode;


	//교수테이블의 행을 클릭했을 때 교수명이 뜨게 하기
	$("#tbl").on("click", ".row", function(){
		pcode=$(this).find(".pcode").html();
		var pname=$(this).find(".pname").html();
		$("#slist").show();
		$("#clist").show();
		$("#slist .pname").html(pname);
		$("#clist .pname").html(pname);
		getList();
	});
	
	function getList(){
	$.ajax({
		type:"get",
		url:"json.jsp",
		dataType:"json",
		data:{"pcode":pcode},
		success:function(data){
			var temp=Handlebars.compile($("#stemp").html());
            $("#stbl").html(temp(data));
            var temp=Handlebars.compile($("#ctemp").html());
            $("#ctbl").html(temp(data));
			
			}
		});
	}

</script>
</html> 