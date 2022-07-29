<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.pcinside.dao.*" %>
<%@page import="com.pcinside.dto.*" %>
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
	MemberDto member = (MemberDto)request.getAttribute("member");
	ArrayList<String> list = (ArrayList<String>)request.getAttribute("list");
	boolean login = (String)session.getAttribute("ID") == null ? false : true;
	boolean admin = (String)session.getAttribute("ADMIN") == null ? false : true;
%>
<meta charset="UTF-8">
<title>피시인사이드</title>
<link rel="stylesheet" href="css/memberInfoStyle.css">
<script src="js/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
	<div class="title">
		<span class="titleTxt01">회원정보수정</span>
	</div>
			<script>
				if("카카오" == "<%=member.getName()%>"){
					swal("카카오!", "카카오계정은 수정이 불가능합니다!", "error").then(function() {
					    history.back();
					});
				}
				if("네이버" == "<%=member.getName()%>"){
					swal("네이버!", "네이버계정은 수정이 불가능합니다!", "error").then(function() {
					    history.back();
					});
				}
			</script>
	<div class="innerContent">
		<div class="inner_cont">
			<form action="Controller">
				<input type="hidden" name="command" value="memberinfoaction">
				<div class="my edit">
					<div class="forms mgt_none">
						<div class="form_wrap half">
							<label for="inpName" class="form_tit" style="position:relative;top:98px;">이름</label>
							<div class="form_box">
								<input type="text" class="inp_txt" style="position: relative;top: 92px;" placeholder="이름 입력" value = "<%=member.getName()%>" name="name">				
							</div>
						</div>
					</div>
					<div class="form_wrap half" >
						<strong class="form_tit" style="position: relative;left: 527px;top: 12px;">휴대폰번호</strong>
						<div class="form_box_flex" style="position: relative;left: 521px;top:7px;" >
							<div class="form_inner">
								<input type="text" class="inp_txt" placeholder="휴대폰번호 입력" value="<%=member.getPhone()%>" name="phone">
							</div>
						</div>
					</div>
					<div class="forms">
						<div class="form_wrap half">
							<label for="i_sPassWord" class="form_tit">새 비밀번호</label>
							<div class="form_box placeholder">
								<input type="password" class="inp_txt" id="i_sPassWord" maxlength="20" placeholder="비밀번호 입력" name="pw">
							</div>
						</div>
					</div>
					<div class="form_wrap helf">
						<label for="i_sPassWordCon" class="form_tit">새 비밀번호 확인</label>
						<div class="form_box placeholder" style="display:flow-root;">
							<input type="password" class="inp_txt" maxlength="20" placeholder="비밀번호 다시 입력" name="pwChk">
						</div>
					</div>
					<div class="form_wrap half">
						<strong class="form_tit">이메일</strong>
						<div class="form_box type_email">
							<input type="text" class="inp_txt" id="emailInput" placeholder="이메일 입력" name="email">
							<a class="overlapChk2" href="javascript:void(0);">중복체크</a>
							<a class="authcodeGo" href="javascript:void(0);">인증코드 발송</a>
						</div>
						<script>
							var cnt = 0;
							$(".overlapChk2").click(function(){
								cnt = 0;
								var arr = new Array();
								<%
									for(int i = 0; i < list.size(); i++){
										%>arr[<%=i%>]='<%=list.get(i)%>';<%
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
									for(int i = 0; i < list.size(); i++){
										%>arr[<%=i%>]='<%=list.get(i)%>';<%
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
						<div style="margin-top: 20px;"></div>
						<strong class="form_tit">인증코드</strong>
						<input type="text" class="inp_txt" placeholder="인증번호 입력" name ="userAuthcode">
						<input type="hidden" value="<%=authCode%>" name="authcode">
						<div class="selectric-wrapper selectric-below selected">
							<ul>
								<li style= "position:absolute; left:150px; top: -93px;">
									<input type="submit" value="수정">
								</li>
							</ul>
						</div>
					</div>
				</div>
			</form>			
		</div>
		<div style="margin-bottom:120px;"></div>
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