<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex01.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*" %><!-- 심플데이트 포맷, 데시멀 포맷 세트 -->

<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>gang's Blog</title>
   <link rel="stylesheet" href="home.css"/>
</head>
<body>
   <div id="page">
      <div id="header">
         <h1>Welcome to gang's Blog</h1>
      </div>
      <div id="menu">
         <div class="item"><a href="insert.jsp">글쓰기</a></div> <!-- 404 오류 파일이 존재하지 않을 때 -->
      </div>
      <div id="content">
         <%
            BDAO dao=new BDAO();
            ArrayList<BVO> list=dao.list();
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-mm-dd"); /*내가 원하는 날짜를 적는 문구*/
          	DecimalFormat df=new DecimalFormat("#,###.00"); /*내가 원하는 숫자타입으로 표현*/
            for(int i=0; i<list.size(); i++){
               BVO vo=list.get(i);
              String strdate=sdf.format(vo.getWdate());
            out.println("<div class='box'>");
            out.println("<h1 class='title'>"+vo.getBno()+")"+vo.getTitle()+"</h1>");
            out.println("<h3 class='date'>"+strdate+"</h3>");
            out.println("<p class='article'>"+vo.getArticle()+"</p>");
            out.println("<a href='sqlDelete.jsp?bno="+vo.getBno()+"'>삭제</a>");
            out.println("</div>");}
           
         %>
      </div>
      <div id="footer">
         <h3>Content Writer:gang's</h3>
      </div>
      
   </div>
</body>
</html>