<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="css/loginStyle.css">
<script src="js/jquery-3.6.0.min.js"></script>
<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script>
	function popOpen(){
		$(".siteMapScreen").slideDown();	
	}
	function popDown(){
		$(".siteMapScreen").slideUp();
	}
</script>
<script>
	
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
			<span class="titleTxt01">로그인</span>
			<span class="pageLocate">
				<a href="Controller?command=main" class="page">홈</a>
				<a href="Controller?command=login" class="page">로그인</a>
			</span>
			<div style="margin-bottom: 20px;"></div>
			<div class="titleTxt02">피시인사이드의 다양한 서비스 이용을 위해 로그인이 필요합니다. 아이디와 비밀번호를 입력해주세요.</div>
		</div>
		<div class="innerContent">
			<div class="tep_menu">
				<div class="wrap2">
					<form id="login_form" action="Controller">
						<input type="hidden" name="command" value="loginaction">
						<div class="left">
							<div class="loginbar">
								<div class="form_area">
									<div class="id_tit">
										<p>
											<label for="pw01" style="margin-right:17px; font-weight: 600;">아이디</label>
											<input type="text" class="input_type01"  maxlength="16" style="height: 26px;width: 320px;" name="id">
										</p>
									</div>
								</div>
								<div class="form_area">
									<div class="pw_tit">
										<p>
											<label for="pw01" style="font-weight: 600;">비밀번호</label>	
											<input type="password" class="input_type01"  maxlength="16" style="height: 26px; width: 320px;" name="pw">
										</p>
									</div>
								</div>
							</div>
							<ul class="login22" style="margin-left: 89px;">				
								<li style="width: 100px; float: left; margin-left: -2px;">		
									<a href="Controller?command=searchidpw" style= "color: #000; line-height:1; vertical-align: middle; font-weight: 400; font-size: 14px;">아이디찾기</a>
								</li>
								<li style="width: 100px; float: left; margin-left: -8px;">		
									<a href="Controller?command=searchidpw" style="margin-left: -18px; color: #000; line-height: 1; vertical-align: middle; font-weight: 400; font-size: 14px;">비밀번호찾기</a>
								</li>
								<li style="width: 100px; float: left; margin-left: -10px;">
									<a href="Controller?command=signin" style="margin-left: -18px; color: #000; line-height: 1; vertical-align: middle; font-weight: 400; font-size: 14px;">회원가입</a>
								</li>
							</ul>
							<input type="submit" class="loginBtn" value="로그인">
						</div>
						<div class="inner_right">
							<div class="side_area">
								<ul class="side_area">
									<li>
										<img src="Images/banner_login.jpg">
									</li>
								</ul>
							</div>
						</div>
						<a href="#" id="kakao-login-btn" class="kakaoBtn"><img src="Images/kakao_login.png"></a>
						<script>
							Kakao.init('164e56f1543027199ed84833d4d20f20');
							$("#kakao-login-btn").on("click", function(){
								Kakao.Auth.login({
									success: function(authObj) {
										Kakao.API.request({
											url: '/v2/user/me',
							            	success: function(response) {
							            		var account = response.kakao_account;
							            		var email = account.email;
							              		location.href="Controller?command=loginactionkakao&email="+email+""; 
							        		}
							         	})
										console.log(authObj);
							          	var token = authObj.access_token;
							        },
							        fail: function(err) {
							        	alert(JSON.stringify(err));
							        }
								});      
							})
							</script>
						<div class="naverBtn"><div id="naver_id_login"></div></div>
						<script>
							var naver_id_login = new naver_id_login("kWr6JckFVGTPDUehfEx9", "http://localhost:9090/PCINSIDE_FINAL/NaverLoginCallback.jsp");
						  	var state = naver_id_login.getUniqState();
						  	naver_id_login.setButton("green", 3, 40);
						  	naver_id_login.setState(state);
						  	naver_id_login.init_naver_id_login();
						</script>
						
						
						<div class="clear"></div>
						<div class="caution">
							<p class="caution_tit">로그인 안내</p>
							<ul>
								<li>ㆍ비밀번호 입력이 5회 연속 오류 시 본인확인을 거친 후 비밀번호를 변경하셔야 합니다.</li>
								<li>ㆍ 로그인에 문제가 있으시면 8304-5594로 문의바랍니다.</li>
							</ul>
						</div>
					</form>
				</div>
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