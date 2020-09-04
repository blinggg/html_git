<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ex0417.*, java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script> <!-- 제이쿼리 임포트해줘야지 사용가능함 -->
<style>
		#page{background:#F3F781;}
		#content{margin:10px;}
		h1{margin:10px}
		.box{padding:10px;width:500px;magin-bottom:5px;margin:#F3F781;}
		.date{margin:left;color:gray;}
		.like{margin:right;}
		
	</style>
</head>
<body>
<div id=page>
		<h1>[댓글관리]</h1>
		
		<input type=text id=content size=50 value="댓글을 작성하려면 로그인 해 주세요.">
		<input type=button value=저장 id=btnInsert>
		<br><br>
		
		<!-- <div class=box>
			<div class=title>
				<div class=date>2020/04/17 13:00:00</div>
				<div class=like rno=1>
					<button class=delete>-</button>
					<button class=update>♥</button>
					<span class=cnt>120</span>
			</div>
		</div>	
				<div class=content>
					유럽의 경우와 비교하면, 사망자는 최소한 30만명 이상을 예상한다.
				</div>
				<input type=button value=답글>
			</div>
		</div>-->
		<%
			ReplyDAO dao=new ReplyDAO();
			ArrayList<ReplyVO> list = dao.list();
			for(int i=0; i<list.size(); i++){
				ReplyVO vo=list.get(i);
				int rno=vo.getRno();
				String content=vo.getContent();
				Date wdate=vo.getWdate();
				int cnt=vo.getCnt();
				
				out.println("<div class=box>");
				out.println("<div class=title>");
				out.println("<div class=date>"+wdate+"</div>");
				out.println("<div class=like rno="+rno+">");
				out.println("<button class=delete>-</button>");
				out.println("<button class=update>♥</button>");
				out.println("<span class=cnt>"+cnt+"</span>");
				
				out.println("</div>");
				out.println("</div>");
				
				out.println("<div class=content>"+content+"</div>");
				out.println("</div>");
				}	
			
		%>
<script>

	//행에 있는 삭제버튼을 클릭했을 때
	$(".box").on("click", ".delete", function(){
		var rno=$(this).parent().attr("rno");
		if(!confirm( rno+ "번을 삭제하시겠습니까?")) return;
		location.href="sqlDelete.jsp?rno="+rno;
	});
	
	//좋아요 버튼을 눌렀을 때
	$(".box").on("click", ".update", function(){
		var rno=$(this).parent().attr("rno");
		if(!confirm(rno+ "번을 좋아요 누르시겠습니까?")) return;
		location.href="sqlUpdate.jsp?rno="+rno; 
	});
	
	//저장할 떄
	$("#btnInsert").on("click",function(){
		if(!confirm("저장하시겠습니까?")) return;
	var content=$("#content").val();
	if(content==""){
		alert("이름을 입력하세요!");
	}else{
		location.href="sqlInsert.jsp?content="+content;	
	}
	});
	
</script>			
</body>
</html>