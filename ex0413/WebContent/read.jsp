<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex01.*" %>
<%
	String strBno=request.getParameter("bno");
	int bno=Integer.parseInt(strBno);
	
	BBSDAO dao=new BBSDAO();
	BBSVO vo=dao.read(bno);
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>글 읽기</title>
   <link rel="stylesheet" href="home.css"/>
   </head>
<body>
   <h1>글 읽기</h1>
   <form action="sqlupdate.jsp">
   		<input type="hidden" name= "bno" value="<%=bno%>">
      제목:<input type="text" name="title"  value="<%=vo.getTitle() %>">
      <hr>
      
      내용:<textarea rows="5" cols="50" name="content"><%=vo.getContent()%></textarea>
      <hr>
      <input type="submit" value="수정">
      <input type="reset" value="취소">
      <input type="button" value="삭제" onClick="location.href='sqldelete.jsp?bno=<%=vo.getBno()%>'">
      <input type="button"value="목록" onClick="location.href='list.jsp'">
   </form>
</body>
</html>