<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>블로그 글쓰기</title>
	<link rel="stylesheet" href="home.css"/>
	<style>
		.tbl{width:700px;border:3px solid gray;border-collapse:collapse;margin:20px auto;}
		.tbl td, .tbl tr{text-align:center;padding:10px;border:1px solid black;}
	</style>
</head>
<body>
	<div id=page>
		<div id=header>
			<h1>♥gang's blog♥</h1>
			<div id=content></div>
				<div id=menu>
					<div class=item><a href="list.jsp">목록으로 </a></div>
				</div>
				<div class=box>
				<form action="sqlInsert.jsp" >
					<table class="tbl">
						<tr>
							<th width=100>제목:</th>
							<td><input type="text" size=90 name="title"></td>
						</tr>
						<tr>
							<th>내용:</th>
							<td><textarea rows="10" cols="90" name="article"></textarea>
							</td>
						</tr>
					
						</table>
						<div style="text-align:center">
							
							<input type="submit" value="저장">&nbsp;&nbsp;&nbsp;
							<input type="reset"  value="취소">
						</div>
				</form>
				</div>
			
			<div id=footer>
				<h3>Content Writer:gang's</h3>
			</div>
		</div>
	</div>
</body>
</html>