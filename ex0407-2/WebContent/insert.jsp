<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ex01.*" %>
    
<%
    	request.setCharacterEncoding("UTF-8");/**/
		String pno=request.getParameter("pno"); /*파라미터값은 무조건 문자이므로*/
    	String pname=request.getParameter("pname");
    	String strprice=request.getParameter("price");/*int값도 문자로 받고*/
    	int price=Integer.parseInt(strprice);		/*int값으로 변환하기*/	
    	
    	ProductVO vo=new ProductVO();
    	vo.setPno(pno);
    	vo.setPname(pname);
    	vo.setPrice(price);
    	
    	ProductDAO dao=new ProductDAO();
    	dao.insert(vo);
%>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>데이터 저장</title>
</head>
<body>
	<h1>데이터가 저장되었습니다.</h1>
	<a href="list.jsp">목록으로 이동</a>	
</body>
</html>