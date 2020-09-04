<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>   
<title>강좌별 학생의 평균점수 구하기</title>
<style>
	.title{text-align:center;background:#7DEDA5;color:black;width:650px;}
	.row:hover{background:#B7FFAF;color:white;cursor:pointer;}
	#tbl td, #etbl td{text-align:center;border:2px solid #C9E9D4;}
	#tbl, #etbl{border-collapse:collapse;width:650px;}
	#clist,#slist{background:#FFB0B0;width:630px;color:white;
				height:50px;margin-bottom:10px;padding:10px;}
	#clist{width:630px;padding:10px;}

</style>
</head>
<body>
	<div class=title>
	<h3>강좌별 학생의 평균점수 구하기</h3>
	</div>
	
	<table id=tbl border=1 width=650></table>
	<script id="temp" type="text/x-handlebars-template">
		<tr class=title>
			<td>강좌코드</td>
			<td>강좌명</td>
			<td>교수명</td>
			<td>과목별평균</td>
		</tr>
			{{#each clist}}
				<tr class=row>
				<td class=lcode>{{lcode}}</td>
				<td>{{lname}}</td>
				<td>{{pname}}</td>
				<td>{{avg}}</td>
				</tr>
			{{/each}}
		</script>
</body>
<script>

		$.ajax({
			type:"get",
			url:"json.jsp",
			dataType:"json",
			success:function(data){
				var temp=Handlebars.compile($("#temp").html());
	            $("#tbl").html(temp(data));
			}
		});
</script>
</html>