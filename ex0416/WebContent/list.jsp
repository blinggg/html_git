<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ex0416.*, java.util.*, java.text.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록 리스트</title>
	<link rel="stylesheet" href="home.css"> 
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script> <!-- 제이쿼리 임포트해줘야지 사용가능함 -->
	<style>
		#darken-background {
			 position:absolute;
			 top:0px;			/*절대위치*/
			 left:0px;
			 right:0px;
			 height:100%;
			 display:none;
			 background:rgba(0, 0, 0, 0.5);
			 z-index:10000;
			 overflow-y:scroll;
			 }
			 
			 #lightbox {
			 width:700px;
			 margin:20px auto;
			 padding:15px;
			 border: 1px solid #333333;
			 border-radius:5px;
			 background:white;
			 box-shadow:0px 5px 5px rgba(34, 25, 25, 0.4);
			 text-align:center;
			 }
			 
			 .del{cursor:pointer;text-align:center;}
			 .del:hover{color:red;}
	</style>
</head>
<body>
	<h1>[상품목록]</h1>
	<div id=content>
			<div id=menu>
			<button class=btn>1</button>
			<button class=btn>2</button>
			<button class=btn>3</button>
			<button class=btn>4</button>
			<button class=btn>5</button>
			<a href="insert.html">[상품등록]</a>
			</div>
			
		<%
			ProductDAO dao=new ProductDAO();
			ArrayList<ProductVO> list=dao.list();
			
			for(int i=0; i<list.size(); i++){
				ProductVO vo=list.get(i);
				DecimalFormat df=new DecimalFormat("#,###원");
				String strprice=df.format(vo.getPrice());
				
				out.println("<div class='box'>");
				out.println("<img src='http://placehold.it/150x150'>");
				out.println("<div class='pname'>"+vo.getPname()+"</div>");
				out.println("<div class='price'>"+strprice+"</div>");
				out.println("<div class='del' pno="+vo.getPno()+">"+"삭제</div>");
				out.println("</div>");
			}
		%>
			<!--라이트 박스-->
      <div id="darken-background">
         <div id="lightbox">
         <img src="http://placehold.it/500x500"/>
         <div><button id="btnClose">Close</button></div>
         <div id="txtName">Product Name</div>
         <div id="txtPrice">Price</div>
      </div>
	</div>
</div>
</body>

<script>
	$(".box").on("click",".del",function(){
		var pno=$(this).attr("pno");	//pno속성의 값을 가져와서
		if(confirm("삭제하시겠습니까?")==false) return;
		location.href="sqlDelete.jsp?pno=" + pno
	});


   $(".box").on("click","img",function(){
      var box=$(this).parent();   //this를 위로 올라가서 찾을때 parent를 쓴다
      var pname=box.find(".pname").html();
      var price=box.find(".price").html();
      
      $("#txtName").html("pname:"+pname);
      $("#txtPrice").html("price:"+price);
      
   $("#darken-background").show();
   });
   
   $("#btnClose").on("click",function(){
      $("#darken-background").hide();
   });
   
   $("#menu").on("click", ".btn",function(){  //id가 menu를 on했는데 click하면 btn의 function을 실행해라
      var num=$(this).html();                //this = 어떤 버튼이 눌러져있는지 알수 있음
      $("#content").css("width",190*num);    //num=num1이면 1 씩 width가 190씩 증가
   });
  
</script>
</html>