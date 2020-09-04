 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex0429.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>   
<title>학생목록</title>
<style>
	.title{text-align:center;background:#FFB0B0;color:white;}
	.row:hover{background:#F7DCDC;color:white;cursor:pointer;}
	#tbl td, #etbl td{text-align:center;border:2px solid #FCD2D2;}
	#tbl, #etbl{border-collapse:collapse;width:650px;}
	#clist,#slist{background:#FFB0B0;width:630px;color:white;
				height:50px;margin-bottom:10px;padding:10px;}
	#clist{width:630px;padding:10px;}
	
</style>

</head>
<body>
	<div id=menu>
		<span class=m><a href="/ex0429/professors/list.jsp" style=text-decoration:none;background:#FFB0B0;color:white;>교수관리</a></span>
		<span class=m><a href="/ex0429/students/list.jsp" style=text-decoration:none;background:#FFB0B0;color:white;>학생관리</a></span>
		<span class=m><a href="/ex0429/courses/list.jsp" style=text-decoration:none;background:#FFB0B0;color:white;>강좌관리</a></span>
	</div>
	
	<h1>학생목록</h1>
	<table id=tbl border=1 width=650>
		<tr class=title>
			<td>학번</td>
			<td>학생명</td>
			<td>학과</td>
			<td>생년월일</td>
			<td>지도교수</td>
			<td>수강신청</td>
		</tr>
		
		<%
			SDAO sdao=new SDAO();
			ArrayList<SVO> list=sdao.list("%%");
			
			for(SVO vo:list){
				out.println("<tr class=row>");
				out.println("<td class=scode>"+vo.getScode()+"</td>");
				out.println("<td class=sname>"+vo.getSname()+"</td>");
				out.println("<td>"+vo.getDept()+"</td>");
				out.println("<td>"+vo.getBirthday()+"</td>");
				out.println("<td>"+vo.getAdvisor()+"</td>");
				out.println("<td><button>수강신청</button></td>");
				out.println("</tr>");
			}
		%>
	</table>
	<div id=enroll style=display:none;>
		<h1>수강신청목록</h1>
		<div id=slist>
			학번:<span id=scode></span><br>
			성명:<span id=sname></span>
		</div>
		<div id=clist>
		강좌명:<select id=lcode></select>
		</div>
		
		 <script id="temp" type="text/x-handlebars-template">
		{{#each clist}}		
			<option value={{lcode}}>{{lcode}}:{{lname}}</option>
		{{/each}}
</script>
	<input type=button value=신청 id=btnEnroll>
	</div>
	<table id=etbl border=1 width=650></table>
	<script id="etemp" type="text/x-handlebars-template">
		<tr class=title>
			<td>강좌번호</td>
			<td>강좌명</td>
			<td>수강신청일</td>
			<td>점수</td>
			<td>수강취소</td>
		</tr>

		{{#each elist}}
			<tr class=row>
				<td class=lcode>{{lcode}}</td>
				<td>{{lname}}</td>
				<td>{{edate}}</td>
				<td>{{grade}}</td>
				<td><button>수강취소</button></td>
			</tr>
		{{/each}}
	</script>
</body>
<script>
	//전역변수 선언하기
	var scode;
	var lcode;
	
	//수강 취소 버튼을 클릭했을 때
	$("#etbl").on("click", ".row button", function(){
		//alert("수강취소?");
		if(!confirm("수강취소 하시겠습니까?")) return;
		var row=$(this).parent().parent();
		lcode=row.find(".lcode").html();
		$.ajax({
			type:"post",
			url:"delete.jsp",
			data:{"scode":scode, "lcode":lcode},
			success:function(){
				alert("수강취소완료!");
				getList();
			}
		});
	});
	
	
	//신청 버튼을 클릭했을 때
	$("#btnEnroll").on("click",function(){
		//alert("..");
		if(!confirm("수강신청 하시겠습니까?")) return;
		lcode=$("#lcode").val();
		//alert(scode +":"+ lcode);
		
		$.ajax({
			type:"post",
			url:"insert.jsp",
			data:{"scode":scode, "lcode":lcode},
			success:function(){
				alert("수강신청완료!");
				getList();
			}
		});
	});
	
	function getList(){
		$.ajax({
			type:"get",
			url:"ejson.jsp",
			dataType:"json",
			data:{"scode":scode},
			success:function(data){
				var temp=Handlebars.compile($("#etemp").html());
	            $("#etbl").html(temp(data));
			}
		});
	}
	
	//수강신청 버튼을 클릭했을 때
	$("#tbl").on("click", ".row button", function(){
		var row=$(this).parent().parent();
		scode=row.find(".scode").html();
		var sname=row.find(".sname").html();
		$("#scode").html(scode);
		$("#sname").html(sname);
		$("#enroll").show();
		getList();
	});

	$.ajax({
		type:"get",
		url:"cjson.jsp",
		dataType:"json",
		success:function(data){
			var temp=Handlebars.compile($("#temp").html());
            $("#lcode").html(temp(data));
		}
	});
		
</script>
</html>