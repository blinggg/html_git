<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex01.*" %> 

<%
	String aname=request.getParameter("aname");
	String tel=request.getParameter("tel");
	String address=request.getParameter("address");
	
	out.println("<h1>"+aname+"</h1>");
	out.println("<h1>"+tel+"</h1>");
	out.println("<h1>"+address+"</h1>");
	
	AddVO vo=new AddVO();
	vo.setAname(aname);
	vo.setTel(tel);
	vo.setAddress(address);
	
	AddDAO dao=new AddDAO();
	dao.insert(vo);
%>   

<script>
	alert("저장되었습니다.")
	location.href="list.jsp";
</script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>