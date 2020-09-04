<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="ex0428.*, java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>   
<title>학생 목록</title>
</head>
<body>
	<h1>[학생 목록]</h1>
	<form action="list.jsp">
		<select name=type>
			<option value=sname>학생명</option>
			<option value=pname>교수명</option>
			<option value=sdept>학생학과</option>
			<option value=year>학년</option>
		</select>
		<input type=text name=word>
		<input type=submit value=검색>
	</form>
	<table id=tbl width=700 border=1> 
		<tr>
			<td>학번</td>
			<td>학생명</td>
			<td>학과</td>
			<td>학년</td>
			<td>생년월일</td>
			<td>교수명</td>
			<td>교수학과</td>
		</tr>
		<%	
			String type=request.getParameter("type")==null?
			"sname":request.getParameter("type"); //삼항연산자
		
			String word=request.getParameter("word")==null?
			"":request.getParameter("word");
			
			SDAO dao=new SDAO();
			ArrayList<SVO> list=dao.list(type, word);
			
			for(SVO vo:list){
				out.println("<tr class=row>");
				out.println("<td class=scode>"+vo.getScode()+"</td>");
				out.println("<td class=sname>"+vo.getSname()+"</td>");
				out.println("<td>"+vo.getSdept()+"</td>");
				out.println("<td>"+vo.getYear()+"</td>");
				out.println("<td>"+vo.getBirthday()+"</td>");
				out.println("<td>"+vo.getPname()+"</td>");
				out.println("<td>"+vo.getPdept()+"</td>");
				out.println("</tr>");
			}
		%>
	</table>
	<div id=enroll>
		<h1><span id=sname></span>의 수강신청 목록<span id=total></span></h1>
		<table id=tbl1 border=1 width=700></table>
		 <script id="temp1" type="text/x-handlebars-template">
			{{#each items}}
				<tr>
					<td>{{lcode}}</td>		
					<td>{{lname}}</td>		
					<td>{{grade}}</td>
					<td>{{edate}}</td>
				</tr>
			{{/each}}
		</script>
	</div>
</body>
	<script>
		//테이블의 각 행을 클릭했을 때
		$("#tbl").on("click", ".row", function(){
			var sname=$(this).find(".sname").html();
			$("#sname").html(sname);
			
			var scode=$(this).find(".scode").html();
			$.ajax({
				type:"get",
				url:"enroll.jsp",
				dataType:"json",
				data:{"scode":scode},
				success:function(data){
					$("#total").html(data.total);
					var temp=Handlebars.compile($("#temp1").html());
		            $("#tbl1").html(temp(data));
				}
			});
		});
	</script>
</html>