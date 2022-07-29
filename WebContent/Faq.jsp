<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.pcinside.dto.*" %>
<%@page import="com.pcinside.dao.*" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-233393413-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-233393413-1');
</script>

<%		
	ArrayList<FAQDto> list = (ArrayList<FAQDto>)request.getAttribute("list");
	boolean login = (String)session.getAttribute("ID") == null ? false : true;
	boolean admin = (String)session.getAttribute("ADMIN") == null ? false : true;
%>
<meta charset="UTF-8">
<title>피시인사이드</title>
<link rel="stylesheet" href="css/faqStyle.css">
<script src="js/jquery-3.6.0.min.js"></script>
<script src="js/faqScript.js"></script>
</head>
	<script>
	function popOpen(){
		$(".siteMapScreen").slideDown();	
	}
	function popDown(){
		$(".siteMapScreen").slideUp();
	}
 </script>

	
<body>
	<div class="header">
		<div class="logo">
			<a href="Controller?command=main"><img src="Images/logo.png"></a>
		</div>
		<ul>
			<li class="depth01">
				<a href="Controller?command=buypc" class="depth01Tit">내컴퓨터사기</a>
				<ul class="depth02Pnl pcBuy">
					<li class="depth02">
						<a href="Controller?command=buypc" class="depth02Tit">내컴퓨터검색</a>
					</li>
					<li class="depth02">
						<a href="Controller?command=warranty" class="depth02Tit">보증서비스</a>
					</li>
					<li class="depth02">	
						<a href="Controller?command=hotitem&pageNum=1" class="depth02Tit">핫상품</a>
					</li>
				</ul>
			</li>
			<li class="depth01">
				<a href="Controller?command=sellpc" class="depth01Tit">내컴퓨터팔기</a>
			</li>
			<li class="depth01">
				<a href="Controller?command=review" class="depth01Tit">고객후기</a>
			</li>
			<li class="depth01">
				<a href="Controller?command=partprice" class="depth01Tit">부품시세</a>				
			</li>
			<li class="depth01">
				<a href="Controller?command=announcement&pageNum=1" class="depth01Tit">고객지원</a>
				<ul class="depth02Pnl support">
					<li class="depth02">
						<a href="Controller?command=announcement&pageNum=1" class="depth02Tit">공지사항</a>
					</li>
					<li class="depth02">
						<a href="Controller?command=faq" class="depth02Tit">FAQ</a>
					</li>
					<li class="depth02">
						<a href="Controller?command=inquiry" class="depth02Tit">1:1문의</a>
					</li>
					<li class="depth02">
						<a href="Controller?command=recent&pageNum=1" class="depth02Tit">최근거래</a>
					</li>
					<li class="depth02">
						<a href="Controller?command=freeboard&pageNum=1" class="depth02Tit">자유게시판</a>
					</li>
				</ul>
			</li>		
		</ul>
		<div class="btns">
			
			<% 
				if(login && admin){
					out.println("<a href='Controller?command=adminpage'>ADMINPAGE</a>");
					out.println("<a href='Controller?command=logout'>LOGOUT</a>");	
				}else if(login){
					out.println("<a href='Controller?command=mypage'>MYPAGE</a>");
					out.println("<a href='Controller?command=logout'>LOGOUT</a>");
				}else{
					out.println("<a href='Controller?command=login'>LOGIN</a>");
				}
			%>
			<a href="javascript:popOpen()" class="siteMap" ><img src="Images/img_siteMap_pc.png"></a>
		</div>
	</div>
	<div class="siteMapScreen">
		<a href="javaScript:popDown()" class="siteMapDown"></a>
		<ul>
			<li class="menu">
				<div class="menuInn">
					<a href="Controller?command=buypc">내컴퓨터사기</a>
					<ul class="list">
						<li class="menuItem">
							<a href="Controller?command=buypc">내컴퓨터검색</a>
						</li>
						<li class="menuItem">
							<a href="Controller?command=warranty">보증서비스</a>
						</li>
						<li class="menuItem">
							<a href="Controller?command=hotitem&pageNum=1">핫상품</a>
						</li>
					</ul>
				</div>
			</li>
			<li class="menu">
				<div class="menuInn">
					<a href="Controller?command=sellpc">내컴퓨터팔기</a>
				</div>
			</li>
			<li class="menu">
				<div class="menuInn">
					<a href="Controller?command=review">고객후기</a>
				</div>
			</li>
			<li class="menu">
				<div class="menuInn">
					<a href="Controller?command=partprice">부품시세</a>
				</div>
			</li>
			<li class="menu">
				<div class="menuInn">
					<a href="Controller?command=announcement&pageNum=1">고객지원</a>
					<ul class="list">
						<li class="menuItem">
							<a href="Controller?command=announcement&pageNum=1">공지사항</a>
						</li>
						<li class="menuItem">
							<a href="Controller?command=faq">FAQ</a>
						</li>
						<li class="menuItem">
							<a href="Controller?command=inquiry">1:1문의</a>
						</li>
						<li class="menuItem">
							<a href="Controller?command=recent&pageNum=1">최근거래</a>
						</li>
						<li class="menuItem">
							<a href="Controller?command=freeboard&pageNum=1">자유게시판</a>
						</li>
					</ul>
				</div>
			</li>
		</ul>
	</div>
	<div class="content">
		<div class="title">
			<span class="titleTxt01">FAQ</span>
			<span class="pageLocate">
				<a href="Controller?command=main" class="page">홈</a>
				<a href="Controller?command=announcement&pageNum=1" class="page">고객지원</a>
				<a href="Controller?command=faq" class="page">FAQ</a>
			</span>
			<div style="margin-bottom: 20px;"></div>
			<div class="titleTxt02">자주 묻는 질문과 답변을 모아두었어요</div>
		</div>

	<div class="innerContent">
		<div class="tab_content">

		<!-- 버튼요소 -->

			<input type="radio" name="tabmenu" id="tab01" checked> 
			<label for="tab01" style="width: 227px;"><span class="con"style="position: relative;">전체</span></label> 
			
			<input type="radio"name="tabmenu" id="tab02"> 
			<label for="tab02" style="width: 227px;"><span class="con">내컴퓨터팔기</span></label> 
			
			<input type="radio" name="tabmenu" id="tab03"> 
			<label for="tab03" style="width: 227px;"><span class="con">내컴퓨터사기</span></label> 
				
			<input type="radio" name="tabmenu" id="tab04"> 
			<label for="tab04" style="width: 227px;"><span class="con">사이트관련</span></label> 
				
			<input type="radio" name="tabmenu" id="tab05"> 
			<label for="tab05" style="width: 227px;"><span class="con">회원관련</span></label>
		</div>
		<script>
			$(function () {
				$("#tab01").click(function () {
					$(".fItem").each(function(){
						$(this).show();
					})
				})
				$("#tab02").click(function () {
					$(".fItem").each(function(){
						$(this).hide();
						if($(this).find(".fClass").text() == "팔기"){
							$(this).show();
						}
					})
				})
				$("#tab03").click(function () {
					$(".fItem").each(function(){
						$(this).hide();
						if($(this).find(".fClass").text() == "사기"){
							$(this).show();
						}
					})
					
				})
				$("#tab04").click(function () {
					$(".fItem").each(function(){
						$(this).hide();
						if($(this).find(".fClass").text() == "사이트"){
							$(this).show();
						}
					})
				})
				$("#tab05").click(function () {
					$(".fItem").each(function(){
						$(this).hide();
						if($(this).find(".fClass").text() == "회원"){
							$(this).show();
						}
					})
				})
			})
		</script>
		<script>
			
			$(function () {
				$(".pop").click(function (){
					if($(this).parent().parent().siblings(".mid").css("display") == "none"){
						$(this).parent().parent().siblings(".mid").show();									
					}
					else{
						$(this).parent().parent().siblings(".mid").hide();
					}				
				});
			});
		</script>
		<div class="board_list_wrap">
			<ul class="board_list">
				<%
					for(FAQDto q : list){
				%>
				<li class ="fItem">
					<div class="top">
						<span style="color: #888888; font-size:18px;" class="fClass"><%=q.getFaqClass() %></span>
						<span><a href="#" style="font-weight: 550; margin-left: 395px;"><%=q.getTitle() %></a></span>
						<span><a href="#" onclick="return false;" class="pop"><img src="Images/faq2.png" style="float: right; margin-right:20px;"></a></span>
					</div>
					<div class="mid">
						<P class="faqContent"><%=q.getContent() %></P>
					</div>
				</li>
				<%
					}
				%>	
			</ul>
		
		</div>
		<div style="margin: 60px;"></div>
		
	</div>
	</div>
	<div style="clear: both;"></div>
	<div class="footer">
		<div class="info">
			<span class="infoContent">(주)피시인사이드</span> <span class="infoContent">대표:
				이영걸</span> <span class="infoContent">주소: 서울시 마포구 서강로 136 아이비타워 2,3층</span>
		</div>
		<div class="tel">
			<div class="telSupport">고객지원</div>
			<div class="telNum">8304-5594</div>
			<div class="time">평일 09:00~17:20 / 토,일, 공휴일 휴무</div>
		</div>
		<div class="copyright">© 2022 PCINSIDE All Rights Reserved.</div>
	</div>

</body>
</html>