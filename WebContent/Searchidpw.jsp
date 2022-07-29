<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.pcinside.dao.*" %>    
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
	boolean login = (String)session.getAttribute("ID") == null ? false : true;
	boolean admin = (String)session.getAttribute("ADMIN") == null ? false : true;
%>
<meta charset="UTF-8">
<title>피시인사이드</title>
<link rel="stylesheet" href="css/searchidpwStyle.css">
<script src="js/jquery-3.6.0.min.js"></script>
<script>
	function popOpen(){
		$(".siteMapScreen").slideDown();	
	}
	function popDown(){
		$(".siteMapScreen").slideUp();
	}
</script>
</head>
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
						<a href="Controller?command=hotitem" class="depth02Tit">핫상품</a>
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
	<section class="member-wrap">
		<form action="Controller">
			<input type="hidden" name="command" value="searchidaction">
			<div class="id2">
				<div>아이디찾기</div>
			</div>
			<table class="form-table">
				<colgroup>
					<col width="30%">
					<col width="*">
				</colgroup>
				<tbody>
					<tr class="join-form-name">
						<th scope="row">이메일</th>
						<td><input type="text" name="email" id="emailInput" placeholder="이메일을 입력하세요"><a href="#" class="getAuthcode" id="getIdAuthcode">인증번호 받기</a></td>
						<script>
							$("#getIdAuthcode").click(function (){
								<%int authCode = (int)(Math.random() * 90000) + 10000;%>
								window.open("Controller?command=emailchkaction&email=" + $("#emailInput").val() + "&authcode=<%=authCode%>");
							})						
						</script>
					</tr>
					<tr class="join-form-name">
						<th scope="row">인증번호</th>
						<td><input type="text" name="userAuthcode" placeholder="인증번호"></td>
						<input type="hidden" value="<%=authCode%>" name="authcode">
					</tr>
				</tbody>
			</table>
			<p class= "join-btn-wrap">
				<input type="submit" class="btn-confirm" value="아이디찾기">
			</p>
		</form>
		
		<form action="Controller">
			<input type="hidden" name="command" value="searchpwaction">
			<div class="id2">
				<div>비밀번호 찾기</div>
			</div>
			<table class="form-table">
				<colgroup>
					<col width=30%>
					<col width="*">
				</colgroup>
				<tbody>
					<tr class="join-form-name">
						<th scope="row">아이디</th>
						<td><input type="text" name="id" placeholder="아이디"></td>
					</tr>
					<tr class="join-form-name">
						<th scope="row">이메일</th>
						<td><input type="text" name="email" id="emailInput2" placeholder="이메일을 입력해주세요"><a href="#" class="getAuthcode" id="getPwAuthcode">인증번호 받기</a></td>
						<script>
							$("#getPwAuthcode").click(function (){
								<%int authCode2 = (int)(Math.random() * 90000) + 10000;%>
								window.open("Controller?command=emailchkaction&email=" + $("#emailInput2").val() + "&authcode=<%=authCode2%>");
							})	
						</script>
					</tr>	
					<tr class="join-form-name">
						<th scope="row">인증번호</th>
						<td><input type="text" name="userAuthcode" placeholder="인증번호"></td>
						<input type="hidden" value="<%=authCode2%>" name="authcode">
					</tr>			
				</tbody>
			</table>
			<p class= "join-btn-wrap">
				<input type="submit" class="btn-confirm" value="비밀번호찾기">
			</p>
		</form>
	</section>
	<div style="margin-bottom: 120px;"></div>
	<div class="footer">
		<div class="info">
			<span class="infoContent">(주)피시인사이드</span>
			<span class="infoContent">대표: 이영걸</span>
			<span class="infoContent">주소: 서울시 마포구 서강로 136 아이비타워 2,3층</span>
		</div>
		<div class="tel">
			<div class="telSupport">고객지원</div>
			<div class="telNum">8304-5594</div>
			<div class="time">평일 09:00~17:20 / 토,일, 공휴일 휴무</div>
		</div>
		<div class="copyright">
			© 2022 PCINSIDE All Rights Reserved.
		</div>
	</div>
</body>
</html>