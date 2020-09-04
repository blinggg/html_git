<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="ex01.*" %>   
 
<%
	String strbno=request.getParameter("bno"); /**/
	int bno=Integer.parseInt(strbno);	/*bno를 숫자로 변경함*/
	
	BDAO dao=new BDAO();
	dao.delete(bno);
%>

<script>
	alert("삭제되었습니다..");
	location.href="list.jsp";

</script>