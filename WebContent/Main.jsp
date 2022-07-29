<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.pcinside.dao.*" %>
<%@ page import="com.pcinside.dto.*" %>
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
	ArrayList<ReviewDto> reviewList = (ArrayList<ReviewDto>)(request.getAttribute("reviewList"));
	ArrayList<String> pcNameList = (ArrayList<String>)(request.getAttribute("pcNameList"));
	ArrayList<FAQDto> faqList = (ArrayList<FAQDto>)(request.getAttribute("faqList"));
	boolean login = (String)session.getAttribute("ID") == null ? false : true;
	boolean admin = (String)session.getAttribute("ADMIN") == null ? false : true;
%>
<meta charset="UTF-8">
<title>피시인사이드</title>
<link rel="stylesheet" href="css/mainStyle.css">
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
<script>
</script>
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
	<div id="fullpage">
		<div class="section section01">
			<div class="section01Tit">
				<div>내 컴퓨터,</div>
				<div>잘 사고 잘 팔았다!</div>
			</div>
			<div class="buyBox">
				<div class="buyBoxTab">
					<span>얼마까지 알아보고 오셨어요?</span>
				</div>
				<img src="Images/img_main_box04_pc.png">
				<form action="Controller" id="frm">
					<input type="hidden" name="command" value="buypc">
					<input type="number" placeholder="얼마?" class="boxSearch" name="price">
					<div class="buyBoxBottom">
						<a href="#" onclick="document.getElementById('frm').submit();">
							<span>검색</span>
						</a>
					</div>
				</form>
			</div>
			<div class="linkList">
				<div class="link01">
					<a href="Controller?command=buypc" class="link01Pad">
						<div class="linkType">내컴퓨터사기</div>
						<div class="linkTit">고객이 사용할 컴퓨터니까<br>2번 점검해서 2배로 안심</div>
						<div class="linksub">기본성능점검+전문가 책임진단까지</div>
						<div style="position: absolute; top: 80px; right:60px;"><img src="Images/img_wrt_ico_01_pc.png"></div>
					</a>
				</div>
				<div class="link02">
					<a href="Controller?command=sellpc" class="link02Pad">
						<div class="linkType">내컴퓨터팔기</div>
						<div class="linkTit">트집없이<br>처음가격 그대로</div>
						<div style="position: absolute; top: 145px; right:40px;"><img src="Images/img_main_box04_pc.png"></div>
					</a>
				</div>
				<div class="link03">
					<a href="Controller?command=sellpc" class="link03Pad">
						<div class="linkType03">내컴퓨터팔기</div>
						<div class="linkTit03">딜러 만남 없이<br>하루만에 최고가</div>
						<div style="position: absolute; top: 155px; right:40px;"><img src="Images/img_main_box05_pc.png"></div>
					</a>
				</div>
			</div>	
		</div>
		<div class="section section02">
			<div class="section02Inside">
				<div class="title">
					<div class="titleTxt01">Trust Warranty</div>
					<div class="titleTxt02">소중한 내 컴퓨터니까, 든든하게 보장 서비스 챙기세요</div>
				</div>
				<ul>
					<li class="item">
						<div class="imgWrap"><img src="Images/img_main_trust02_pc.png"></div>
						<div class="itemTit">타사 대비 합리적인 가격</div>
						<span>월 만원대로 수리비 절약</span>
					</li>
					<li class="item">
						<div class="imgWrap"><img src="Images/img_main_trust03_pc.png"></div>
						<div class="itemTit">업계 최고 보장 한도</div>
						<span>CPU부터 파워까지<br>구석구석 폭 넓~게 보장</span>
					</li>
					<li class="item">
						<div class="imgWrap"><img src="Images/img_main_trust01_pc.png"></div>
						<div class="itemTit">업계 최고 보장 한도</div>
						<span>CPU부터 파워까지<br>구석구석 폭 넓~게 보장</span>
					</li>
				</ul>
			</div>
		</div>
		<div class="section section03">
			<div class="section03Inside">
				<div class="section03Tit">Best Review</div>
				<div class="section03Txt">순도100% 피시인사이드 이용고객 후기를 만나보세요.</div>
				<ul class="reviewList">
				<% for(int i = 0; i < reviewList.size(); i++){%>
					<li class='review'>
						<a href="Controller?command=review">
							<span><%=pcNameList.get(i) %></span>
							<div class='reviewTit'><%=reviewList.get(i).getTitle() %></div>
							<div class='reviewTxt'><%=reviewList.get(i).getContent() %></div>
						</a>
					</li>
				<%}%>							
				</ul>
			</div>
		</div>
		<div class="section section04">
			<div class="section04Inside">
				<div class="partnerTit">함께하는 파트너 ></div>
				<ul class="partnerList">
					<a href="https://www.intel.co.kr"><li class="partner"><img src="Images/intel.png"></li></a>
					<a href="https://www.amd.com/ko"><li class="partner"><img src="Images/AMD.png"></li></a>
					<a href="https://www.nvidia.com/ko-kr"><li class="partner"><img src="Images/nvidia.png"></li></a>
					<a href="https://www.amd.com/ko/graphics/radeon-rx-graphics"><li class="partner"><img src="Images/radeon.png"></li></a>
				</ul>
				<div class="faqBox">
					<div class="partnerTit">무엇이 궁금하세요? ></div>
					<ul>
					<%for(FAQDto f : faqList){%>
						<li class='faqList'>
							<a href='Faq.jsp'><%=f.getTitle()%></a>
						</li>
					<%}%>
					</ul>
				</div>
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