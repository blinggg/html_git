<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="ex0428.*, java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>   
<title>강좌 목록</title>
</head>
<body>
	<h1>[강좌목록]</h1>
	<form action="clist.jsp">
		<select name=type>
			<option value=lcode>강좌코드</option>
			<option value=lname>강좌명</option>
			<option value=pname>교수명</option>
		</select>
		<input type=text name=word>
		<input type=submit value=검색>
	</form>
	<table id=tbl width=700 border=1>
		<tr>
			<td>강좌코드</td>
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
			ArrayList<CVO> clist=dao.clist(type, word);
			
			for(CVO vo:clist){
				out.println("<tr class=row>");
				out.println("<td class=lcode>"+vo.getLcode()+"</td>");
				out.println("<td class=lname>"+vo.getLname()+"</td>");
				out.println("<td>"+vo.getRoom()+"</td>");
				out.println("<td>"+vo.getPname()+"</td>");
				out.println("<td>"+vo.getSdept()+"</td>");
				out.println("</tr>");
			}
		%>
		
	</table>
	<div id=students>
		<h1><span id=lname></span>을 신청한 학생목록</h1>
			<table id=tbl1 border=1 width=700></table>
			 <script id="temp1" type="text/x-handlebars-template">
				{{each items}}
					<tr>
						<td>{{scode}}</td>
						<td>{{sname}}</td>
						<td>{{sdept}}</td>
						<td>{{year}}</td>
					</tr>
				{{/each}}
			</script>
		</div>
</body>
	<script>
		//테이블의 각 행을 클릭했을 때
		$("#tbl").on("click", ".row", function(){
			var lname=$(this).find(".lname").html();
			$("#lname").html(lname);
			
			var lcode=$(this).find(".lcode").html();
			$.ajax({
				type:"get",
				url:"students.jsp",
				dataType:"json",
				data:{"lcode":lcode},
				success:function(data){
					var temp=Handlebars.compile($("#temp1").html());
		            $("#tbl1").html(temp(data));
				}
			});
		});
	</script>
</html>