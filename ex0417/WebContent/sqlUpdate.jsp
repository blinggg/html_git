<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex0417.*" %>

<%
	String strGno=request.getParameter("gno");
	int gno=Integer.parseInt(strGno);
	
	String strKor=request.getParameter("kor");
	int kor=Integer.parseInt(strKor);
	
	String strEng=request.getParameter("eng");
	int eng=Integer.parseInt(strEng);
	
	String strMat=request.getParameter("mat");
	int mat=Integer.parseInt(strMat);
	
	GradeDAO dao=new GradeDAO();
	GradeVO vo=new GradeVO();
	
	vo.setGno(gno);
	vo.setKor(kor);
	vo.setEng(eng);
	vo.setMat(mat);
	
	dao.update(vo);
%>

<script>
	alert("수정되었습니다.");
	location.href="list.jsp";

</script>