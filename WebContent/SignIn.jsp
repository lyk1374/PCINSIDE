<%@page import="java.util.ArrayList"%>
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
	ArrayList<String> idList = (ArrayList<String>)request.getAttribute("idList");
	ArrayList<String> emailList = (ArrayList<String>)request.getAttribute("emailList");
	boolean login = (String)session.getAttribute("ID") == null ? false : true;
	boolean admin = (String)session.getAttribute("ADMIN") == null ? false : true;
%>
<meta charset="UTF-8">
<title>피시인사이드</title>
<link rel="stylesheet" href="css/signInStyle.css">
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
			<span class="titleTxt01">회원가입</span>
			<div style="margin-bottom: 20px;"></div>
		</div>
		<div class="innerContent">
			<form action="Controller">
				<input type="hidden" name="command" value="signinaction">
				<dl>
					<dt class="tit">아이디</dt>
					<dd><div class="inputBox"><input type="text" id="idInput" placeholder="아이디 입력" name="id" required></div></dd>
					<a class="overlapChk" href="javascript:void(0);">중복체크</a>
					<script>
						$(".overlapChk").click(function(){
							var arr = new Array();
							<%
								for(int i = 0; i < idList.size(); i++){
									%>arr[<%=i%>]='<%=idList.get(i)%>';<%
								}
							%>
							for(var i = 0; i < arr.length; i++){
								if($("#idInput").val() == arr[i]){
									alert("중복된 아이디입니다!")
									break;
								}else if($("#idInput").val() == ""){
									alert("아이디를 입력해주세요!")
									break;
								}
								else if(i == arr.length - 1){
									alert("중복된 아이디가 아닙니다! 사용하셔도 좋습니다.")
								}
							}
						})
					</script>
				</dl>
				<dl>
					<dt class="tit">비밀번호</dt>
					<dd><div class="inputBox"><input type="password" placeholder="비밀번호 입력" name="pw" required></div></dd>
				</dl>
				<dl>
					<dt class="tit">비밀번호 확인</dt>
					<dd><div class="inputBox"><input type="password" placeholder="비밀번호 재입력" name="pwChk" required></div></dd>
				</dl>
				<dl>
					<dt class="tit">연락처</dt>
					<dd><div class="inputBox"><input type="text" placeholder="연락처 입력" name="phone" size="11" required></div></dd>
				</dl>
				<dl>
					<dt class="tit">이름</dt>
					<dd><div class="inputBox"><input type="text" placeholder="이름 입력" name="name" size="11" required></div></dd>
				</dl>
				<dl>
					<dt class="tit">이메일</dt>
					<dd>
						<div class="inputBox"><input type="email" id="emailInput" placeholder="이메일 입력" name="email" required></div>
					</dd>
					<a class="overlapChk2" href="javascript:void(0);">중복체크</a><a class="authcodeGo" href="javascript:void(0);">인증코드 발송</a>
					<script>
					var cnt = 0;
					$(".overlapChk2").click(function(){
						cnt = 0;
						var arr = new Array();
						<%
							for(int i = 0; i < emailList.size(); i++){
								%>arr[<%=i%>]='<%=emailList.get(i)%>';<%
							}
						%>
						
						for(var i = 0; i < arr.length; i++){
							if($("#emailInput").val() == arr[i]){
								alert("중복된 이메일입니다!")
								cnt = 0;
								break;
							}else if($("#emailInput").val() == ""){
								alert("이메일을 입력해주세요!")
								cnt = 0;
								break;
							}
							else if(i == arr.length - 1){
								alert("중복된 이메일이 아닙니다! 사용하셔도 좋습니다.")
								cnt = 1;
							}
						}
					})
					$(".authcodeGo").click(function(){
						var arr = new Array();
						<% 
							for(int i = 0; i < emailList.size(); i++){
								%>arr[<%=i%>]='<%=emailList.get(i)%>';<%
							}
						%>
						for(var i = 0; i < arr.length; i++){
							if($("#emailInput").val() == arr[i]){
								cnt = 0;
								break;
							}
						}	
						
						if(cnt == 1){
							<%int authCode = (int)(Math.random() * 90000) + 10000;%>
							window.open("Controller?command=emailchkaction&email=" + $("#emailInput").val() + "&authcode=<%=authCode%>");
						}else if(cnt == 0){
							alert("이메일을 확인해주세요!")
						}
						
					})
					</script>
				</dl>
				<dl>
					<dt class="tit">인증코드</dt>
					<dd><div class="inputBox"><input type="text" placeholder="인증코드작성" name="userAuthcode" required></div></dd>
				</dl>
				<br>
				<br>
				<input type="hidden" value="<%=authCode%>" name="authcode">
				<input type="submit" value="완료" style="margin-left: 380px;">
			</form>
		</div>
	</div>
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