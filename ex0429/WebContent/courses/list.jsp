<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ex0429.*, java.util.*, org.json.simple.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>   
<title>[강좌목록]</title>
	<link rel=stylesheet href=../home.css>
</head>
<body>
<div id=menu>
		<span class=m><a href="/ex0429/professors/list.jsp" style=text-decoration:none;background:#FFB0B0;color:white;>교수관리</a></span>
		<span class=m><a href="/ex0429/students/list.jsp" style=text-decoration:none;background:#FFB0B0;color:white;>학생관리</a></span>
		<span class=m><a href="/ex0429/courses/list.jsp" style=text-decoration:none;background:#FFB0B0;color:white;>강좌관리</a></span>
	</div>
	
	<h1>[강좌목록]</h1>
	<table id=tbl>
		<tr class=title>
			<td>강좌번호</td>
			<td>강좌명</td>
			<td>강의실</td>
			<td>담당교수</td>
			<td>성적입력</td>
		</tr>
		<%
			CDAO cdao=new CDAO();
			ArrayList<CVO> list=cdao.list("%%");
			
			for(CVO vo:list){
				out.println("<tr class=row>");
				out.println("<td class=lcode>"+ vo.getLcode()+"</td>");
				out.println("<td class=lname>"+ vo.getLname()+"</td>");
				out.println("<td>"+ vo.getRoom()+"</td>");
				out.println("<td>"+ vo.getInstructor()+"</td>");
				out.println("<td><button>성적입력</button></td>");
				out.println("</tr>");
			}
		%>
	</table>
	<div id=enroll>
		<div id=courses>
			<span class=lti>강좌번호 :</span>
			<span id=lcode></span>&nbsp;&nbsp;&nbsp;&nbsp;
			<span class=lti>강좌명 :</span>
			<span id=lname></span>
		</div>
	</div>
	
	<div id=elist>
		<input type=button value=선택수정 id=btnSave>
		<table id=etbl></table>
			<script id="temp" type="text/x-handlebars-template">
				<tr class=title>
					<td><input type=checkbox class=chkAll></td>
					<td>학생번호</td>
					<td>학생명</td>
					<td>수강신청일</td>
					<td>점수</td>
					<td>수정</td>
				</tr>

					{{#each elist}}
					<tr class=row>
					<td><input type=checkbox class=chk></td>
					<td class=scode>{{scode}}</td>
					<td>{{sname}}</td>
					<td>{{edate}}</td>
					<td><input size=2 type=text class=grade value={{grade}}></td>
					<td><button>수정</button></td>
					</tr>
					{{/each}}
			</script>
		</div>
</body>
<script>

	$("#enroll").hide();
	var lcode;
	
	//전체 선택 버튼을 클릭했을 때
	$("#etbl").on("click", ".chkAll", function(){
		if($(this).is(":checked")){
			$("#etbl .row .chk:checkbox").each(function(){
			$(this).prop("checked", true);
		});
			
	}else{
		$("#etbl .row .chk:checkbox").each(function(){
			$(this).prop("checked", false);
			});
		}
	});
	
	
	//선택수정 버튼을 눌렀을 때
	$("#btnSave").on("click", function(){
		if(!confirm("선택한 학생의 점수를 수정하싈?")) return;
		$("#etbl .row .chk:checked").each(function(){
			var row=$(this).parent().parent();
			var scode=row.find(".scode").html();
			var grade=row.find(".grade").val();
			$(this).prop("checked", false);
			$("#chkAll").prop("checked", false);
			alert(grade);
			$.ajax({
				type:"post",
				url:"update.jsp",
				data:{"scode":scode, "lcode":lcode, "grade":grade},
				success:function(){
			}
		});	
	});
		alert("수정완료!");
});
	
	//행에 있는 수정 버튼을 눌렀을 때
	$("#etbl").on("click", ".row button", function(){
		//alert(".");
	if(!confirm("점수를 수정하시겠습니까?")) return;
		lcode=$("#lcode").html();
		var row=$(this).parent().parent();
		var scode=row.find(".scode").html();
		var grade=row.find(".grade").val();
		//alert(lcode+scode+grade);
		
		$.ajax({
			type:"post",
			url:"update.jsp",
			data:{"scode":scode, "lcode":lcode, "grade":grade},
			success:function(){
				alert("수정되었습니다.");
			}
		});
	});
	
	function getList(){
		lcode=$("#lcode").html();	
		//alert(lcode);
		
		$.ajax({
			type:"get",
			url:"json.jsp",
			dataType:"json",
			data:{"lcode":lcode},
			success:function(data){
				var temp=Handlebars.compile($("#temp").html());
	            $("#etbl").html(temp(data));
				}
			});
		}

	//성적입력 버튼을 클릭했을 때
		$("#tbl").on("click",".row button",function(){
			var row=$(this).parent().parent();
			lcode=row.find(".lcode").html();
			var lname=row.find(".lname").html();
			$("#lcode").html(lcode);
			$("#lname").html(lname);
			$("#enroll").show();
			getList();
		});
	
</script>
</html>