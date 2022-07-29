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
<link rel="stylesheet" href="css/warrantyStyle.css">
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
		<div class="picture"></div>
		<div class="txtBox">
			<div class="txtBoxtxt">
				이제 피시인사이드 워런티로<br>
				걱정없이 사용하세요
			</div>
			<div class="btn">
				<div class="btnImg"><img src="Images/img_wrt_ico_01_pc.png"></div>
				<a href="#assure" class ="btnTxt">보장범위</a>
			</div>
			<div class="btn">
				<div class="btnImg"><img src="Images/img_wrt_ico_02_pc.png"></div>
				<a href="#price" class ="btnTxt">가격정보</a>
			</div>
		</div>
		<div class ="section section01" id="assure">
			<div class="assureTit01">국내 최장 기간, 최대 한도 보장</div>
			<div class="assureTit02">더 길게 누리는 피시인사이드 워런티</div>
			<div class="bar">
				<div class="barImg"></div>
				<div class="blueBar"></div>
				<div class="redBar"></div>
			</div>
			<div class="barTxtBox">
				<span class="barTxtBoxArea01">
					<span class="barTxt">컴퓨터 구입 및<br>워런티 가입</span>
				</span>
				<span class="barTxtBoxArea02">
					<span class="barTxt">부품 보증기간 및<br></span>
					<span class="barTxtSp">성능점검 책임보험 1개월</span>
				</span>
				<span class="barTxtBoxArea03">
					<span class="barTxt">보장 만료<br></span>
				</span>
			</div>
			<ul class="asrListBox">
				<li class="asrList">
					<div class="asrImg">
						<img src="Images/img_asrImg_pc.png">
						<div class="asrTit">PW1</div>
					</div>
					<div class="asrTxt">가입 후 1개월</div>
				</li>
				<li class="asrList">
					<div class="asrImg">
						<img src="Images/img_asrImg_pc.png">
						<div class="asrTit">PW3</div>
					</div>
					<div class="asrTxt">가입 후 3개월</div>
				</li>
				<li class="asrList">
					<div class="asrImg">
						<img src="Images/img_asrImg_pc.png">
						<div class="asrTit">PW6</div>
					</div>
					<div class="asrTxt">가입 후 6개월</div>
				</li>
				<li class="asrList">
					<div class="asrImg">
						<img src="Images/img_asrImg_pc.png">
						<div class="asrTit">PW12</div>
					</div>
					<div class="asrTxt">가입 후 12개월</div>
				</li>
			</ul>
			<div class="asrTip">* 피시인사이드 보증연장서비스는 보증기간이 종료되는 시점부터 적용되어 더 길게 혜택을 누릴 수 있습니다.</div>
		</div>
		<div class="section section2">
			<div class="assureTit01">CPU부터 파워까지</div>
			<div class="assureTit02">폭 넓~게 보장해 드려요</div>
			<ul class="partList">
				<li class="partBox">
					<div class="partTit">CPU</div>
					<img class="partIco" src="Images/cpu_icon.png">
				</li>
				<li class="partBox">
					<div class="partTit">메인보드</div>
					<img class="partIco" src="Images/mainBoard_icon.png">
				</li>
				<li class="partBox">
					<div class="partTit">메모리</div>
					<img class="partIco" src="Images/ram_icon.png">
				</li>
				<li class="partBox">
					<div class="partTit">그래픽카드</div>
					<img class="partIco" src="Images/graphic_icon.png">
				</li>
				<li class="partBox">
					<div class="partTit">저장소</div>
					<img class="partIco" src="Images/ssd_icon.png">
				</li>
				<li class="partBox">
					<div class="partTit">파워서플라이</div>
					<img class="partIco" src="Images/power_icon.png">
				</li>
			</ul>
			<div class="partTip">* 순정부품에 한해서만 보장받을 수 있습니다.</div>
		</div>
		<div class="section section03" id="price">
			<div class="assureTit01">평균 10% 저렴!</div>
			<div class="assureTit02">타사 대비 합리적인 가격</div>
			<span class="priceTit01">보증 가격</span>
			<span class="priceTit02">VAT포함/단위: 원</span>
			<div style="margin-bottom: 30px;"></div>
			<table class ="priceTable">
				<tr>
					<th></th>
					<th>PW1</th>
					<th>PW3</th>
					<th>PW6</th>								
					<th>PW12</th>								
				</tr>
				<tr>
					<td>30만원 이하</td>
					<td>5천원</td>
					<td>1만5천원</td>
					<td>3만원</td>
					<td>6만원</td>	
				</tr>
				<tr>
					<td>30~50만원</td>
					<td>1만원</td>
					<td>3만원</td>
					<td>6만원</td>
					<td>12만원</td>
				</tr>
				<tr>
					<td>50~70만원</td>
					<td>1만5천원</td>
					<td>4만5천원</td>
					<td>9만원</td>
					<td>18만원</td>
				</tr>
				<tr>
					<td>70만원 이상</td>
					<td>2만원</td>
					<td>6만원</td>
					<td>12만원</td>
					<td>24만원</td>
				</tr>
			</table>	
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