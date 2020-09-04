<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="ex01.*" %>

<%
	String strano=request.getParameter("ano"); //게시글 번호 가져오기
	int ano=Integer.parseInt(strano);		//int값으로 변환
	
	AddDAO dao=new AddDAO();				//dao 메소드 실행하기 위해 객체생성
	AddVO vo=dao.read(ano);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 읽기</title>
</head>
<body>
	<h1>글읽기</h1>
	<form action="sqlUpdate.jsp">
		<input type=hidden name=ano value=<%=ano%>> 
	
		이름:<input type=text name=aname value=<%=vo.getAname()%>>
		전화번호:<input type=text name=tel value=<%=vo.getTel()%>>
		주소<textarea rows="5" cols="50" name=address><%=vo.getAddress() %>></textarea>
		<hr>
		
	<input type=submit value=수정>
	<input type=reset value=취소>
	<input type=button value=삭제 onClick="location.href='sqlDelete.jsp?bno=<%=vo.getAno()%>'">
	<input type=button value=목록 onClick="location.href='list.jsp'">
	</form>
</body>
</html>