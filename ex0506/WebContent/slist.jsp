<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="ex0506.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>   
<title>학생목록</title>
<style>
	.title{text-align:center;background:#BDFF8B;color:black;}
	.row:hover{background:#9CE465;color:white;cursor:pointer;}
	#stbl td, #ctbl td{text-align:center;border:2px solid #ABD58A;}
	#stbl, #ctbl{border-collapse:collapse;margin-bottom:10px;}
	#spec{background:#9CE465;width:630px;padding:10px;margin-bottom:10px;color:white;}
</style>
</head>
<body>
	<div id=students>
	<h1>[학생목록]</h1>
	<table id=stbl border=1 width=650></table>
	<script id="stemp" type="text/x-handlebars-template">
		<tr class=title>
			<td>학번</td>
			<td>학생명</td>
			<td>학과</td>
		</tr>
		{{#each slist}}
			<tr class=row>
				<td class=scode>{{scode}}</td>
				<td>{{sname}}</td>
				<td>{{dept}}</td>
			</tr>
		{{/each}}	
	</script>
</div>	

	<div id=spec>
		학번:<span id=scode></span>
		수강과목수:<span id=cnt></span>
		평균:<span id=avg></span>
	</div>	
	
		<h1>[수강신청목록]</h1>
			<table id=ctbl border=1 width=650></table>
			<script id="ctemp" type="text/x-handlebars-template">
		<tr class=title>
			<td>강좌번호</td>
			<td>강좌명</td>
			<td>점수</td>
		</tr>

		{{#each elist}}
			<tr class=row>
				<td class=lcode>{{lcode}}</td>
				<td>{{lname}}</td>
				<td>{{grade}}</td>
			</tr>
		{{/each}}	

	</script>
</body>
<script>
	var scode;
	var cnt;
	var avg;
	$("#ctbl").hide();
	
	
	//학생목록 출력하기
	$.ajax({
		type:"get",
		url:"sjson.jsp",
		dataType:"json",
		success:function(data){
			var temp=Handlebars.compile($("#stemp").html());
        	$("#stbl").html(temp(data));
		}
	});

	//학생목록의 행을 클릭했을 때
		$("#stbl").on("click", ".row", function(){
			//alert("..");
			scode=$(this).find(".scode").html();
			$("#scode").html(scode);
			$("#ctbl").show();
			getList();
		});
		
		//특정학생이 수강신청한 강좌목록 보이기
		function getList(){
			$.ajax({
				type:"get",
				url:"sjson.jsp",
				dataType:"json",
				data:{"scode":scode},
				success:function(data){
					var temp=Handlebars.compile($("#ctemp").html());
		            $("#ctbl").html(temp(data));
					$("#scode").html(scode);
					$("#cnt").html(data.cnt);
					$("#avg").html(data.avg);
				}
			});
		}
</script>
</html>