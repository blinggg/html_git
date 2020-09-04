<%@page import="java.beans.DesignMode"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ex0506.*, java.util.*, java.text.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>   
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
	<table id=ctbl border=1 width=650>
		<tr class=title>
			<td>강좌번호</td>
			<td>강좌명</td>
			<td>교수명</td>
		</tr>
		
	<%
	CDAO dao=new CDAO();
	ArrayList<CVO> list=dao.list();
	for(CVO vo:list){
		out.println("<tr class=row>");
		out.println("<td class=lcode>"+vo.getLcode()+"</td>");
		out.println("<td>"+vo.getLname()+"</td>");
		out.println("<td>"+vo.getPname()+"</td>");
		out.println("</tr>");
	}
	%>
	</table>
	
	<div id=spec>
		강좌코드:<span id=lcode></span>
		수강신청인원:<span id=cnt></span>
		평균:<span id=avg></span>
	</div>	
	
	<h1>[학생별 평균점수]</h1>
	<table id=stbl border=1 width=650></table>
	<script id="stemp" type="text/x-handlebars-template">
		<tr class=title>
			<td>학번</td>
			<td>학생명</td>
			<td>학생학과</td>
		</tr>
		{{#each slist}}
		<tr class=row>
			<td class=scode>{{scode}}</td>
			<td>{{sname}}</td>
			<td>{{grade}}</td>
		</tr>
		{{/each}}
	</script>
</body>

<script>
	var lcode;
	var cnt;
	var avg;
	
	$("#stbl").hide();


	//학생목록의 행을 클릭했을 때
	$("#ctbl").on("click", ".row", function(){
		//alert("..");
		lcode=$(this).find(".lcode").html();
		$("#stbl").show();
		getList();
	});
	
	//특정학생이 수강신청한 강좌목록 보이기
	function getList(){
		$.ajax({
			type:"get",
			url:"cjson.jsp",
			dataType:"json",
			data:{"lcode":lcode},
			success:function(data){
				var temp=Handlebars.compile($("#stemp").html());
            	$("#stbl").html(temp(data));
            	lcode=$(this).find(".lcode").html();
				$("#lcode").html(lcode);
				$("#cnt").html(data.cnt);
				$("#avg").html(data.avg);
		}
	});
}



</script>
</html>