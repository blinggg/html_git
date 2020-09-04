<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소등록</title>
</head>
<body>
	<h1>글쓰기</h1>
	
	<form action="sqlInsert.jsp">
		이름:<input type=text name=aname><br>
		<hr>
		전화번호:<input type=text name=tel><br>
		
		주소:<textarea rows="5" cols="50" name=address></textarea>
		<hr>
		<input type=submit value=저장>
		<input type=reset value=취소>

	</form>

</body>
</html>