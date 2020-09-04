<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex0417.*, java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적관리 리스트</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script> <!-- 제이쿼리 임포트해줘야지 사용가능함 -->
<style>
	h1,h3 {text-align:center;}
	#content {width:700px; background:#9F81F7;color:white;
			  margin:auto;padding:10px;}
	#tbl{margin:auto;}
	td {text-align:center;}
	inputP{text-align:center;}
	
</style>
</head>
<body>
<h1>[성적처리]</h1>
	<div id=content>
		이름:<input type=text id=txtName>
		<hr>
		국어:<input type=text id=txtKor>
		<hr>
		영어:<input type=text id=txtEng>
		<hr>
		수학:<input type=text id=txtMat>
		<hr>
		<input type=button value=등록 id=btnInsert>
		<h3>[성적목록]</h3>
		<table id=tbl border=1 width=600>
			<tr class=title>
			<td>NO.</td>
			<TD>이름</TD>
			<TD>국어</TD>
			<TD>영어</TD>
			<TD>수학</TD>
			<TD>수정</TD>
			<TD>삭제</TD>
			</tr>
			
			<!--테이블보고 out.println  -->
			<tr class=row>
			<td>1</td>
			<TD>정은경</TD>
			<TD><input class=kor type=text size=2 value=90></TD>
			<TD><input class=eng type=text size=2 value=80></TD>
			<TD><input class=mat type=text size=2 value=70></TD>
			<TD><button class=update>수정</button></TD>
			<TD><button class=delete>삭제</button></TD>
			</tr>
			
			<% 
				GradeDAO dao=new GradeDAO();
				ArrayList<GradeVO> list=dao.list();
			
				for(int i=0; i<list.size(); i++){
					GradeVO vo=list.get(i);
					int gno=vo.getGno();
					String gname=vo.getGname();
					int kor=vo.getKor();
					int eng=vo.getEng();
					int mat=vo.getMat();
					out.println("<tr class=row>");
					out.println("<td class=gno>"+gno+"</td>");
					out.println("<td class=gname>"+gname+"</td>");
					out.println("<td><input type=text class=kor size=2 value="+kor+"></td>");
					out.println("<td><input type=text class=eng size=2 value="+eng+"></td>");
					out.println("<td><input type=text class=mat size=2 value="+mat+"></td>");
					out.println("<td><button class=update>수정</button></td>");
					out.println("<td><button class=delete>삭제</button></td>");
					out.println("</tr>");
				}
			%>
		</table>
	</div>
</body>
<script>

	//insert 
	$("#btnInsert").on("click",function(){
		if(!confirm("저장하시겠습니까?")) return;
		var gname=$("#txtName").val();
		var kor=$("#txtKor").val();
		var eng=$("#txtEng").val();
		var mat=$("#txtMat").val();
		
		if(gname==""){
			alert("이름을 입력하세요!");
			$("#txtName").val("");
			$("#txtName").focus();
			
		}else if(kor==""||kor.replace(/[0-9]/g,'')){
			alert("점수를 숫자로 입력하세요!");
			$("#txtKor").val("");
			$("#txtKor").focus();
			
		}else if(eng==""||eng.replace(/[0-9]/g,'')){
			alert("점수를 숫자로 입력하세요!");
			$("#txtEng").val("");
			$("#txtEng").focus();
			
		}else if(mat==""||mat.replace(/[0-9]/g,'')){
			alert("점수를 숫자로 입력하세요!");
			$("#txtMat").val("");
			$("#txtMat").focus();
		
		}else{
			location.href="sqlInsert.jsp?gname="+gname+"&kor="+kor+"&eng="+eng+"&mat="+mat;
		}
	});
	
	//행에 있는 삭제버튼을 클릭했을 때
	$("#tbl").on("click", ".row .delete", function(){
		var row=$(this).parent().parent();
		var gno=row.find(".gno").html();
		if(!confirm(gno+"번을 삭제하시겠습니까?")) return;
		location.href="sqlDelete.jsp?gno="+gno;
		alert(gno);
	});
	
	//행에 있는 수정 버튼을 클릭했을 때
	$("#tbl").on("click", ".row .update", function(){
		var row=$(this).parent().parent();
		var gno=row.find(".gno").html();
		if(!confirm(gno+"번을 수정하시겠습니까?")) return;
		location.href="sqlUpdate.jsp?gno="+gno+"&kor="+kor+"&eng="+eng+"&mat="+mat;
		alert(gno);
	});
	

</script>
</html>