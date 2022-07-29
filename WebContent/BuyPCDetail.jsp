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
	PCDto pc = (PCDto)(request.getAttribute("pc"));
	int pcNum = (int)request.getAttribute("pcNum");
	int likeChk = (int)request.getAttribute("likeChk");
	String baseBranch = (String)request.getAttribute("baseBranch");
	boolean login = (String)session.getAttribute("ID") == null ? false : true;
	boolean admin = (String)session.getAttribute("ADMIN") == null ? false : true;
%>
<meta charset="UTF-8">
<title>피시인사이드</title>
<link rel="stylesheet" href="css/buyPCDetailStyle.css">
<script src="js/jquery-3.6.0.min.js"></script>
<script>
	function popOpen(){
		$(".siteMapScreen").slideDown();	
	}
	function popDown(){
		$(".siteMapScreen").slideUp();
	}
</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=164e56f1543027199ed84833d4d20f20&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=164e56f1543027199ed84833d4d20f20"></script>
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
		<div class="section01">
			<div class="pcWrap">
				<div class="pcImage">
					<img src="PCImage/<%=pc.getImage()%>.png">
				</div>
				<div class="pcInfo">
					<div class="pcName">${pcName }</div>
					<div class="pcSub">메인보드: <%=pc.getMotherBoardMaker()%> <%=pc.getMotherBoardName()%><br>RAM: <%=pc.getRamMaker()%> <%=pc.getRamGen()%> <%=pc.getRamVol()%><br>
					<% 
						if(pc.getSsdMaker() != null){
							out.println("SSD: " + pc.getSsdMaker() + " " + pc.getSsdVol());
							out.println("<br>");			
						}
						if(pc.getHddMaker() != null){
							out.println("HDD: " + pc.getHddMaker() + " " + pc.getHddVol());
							out.println("<br>");
						}
					%>
					파워서플라이: <%=pc.getPowerMaker()%> <%=pc.getPowerCap()%></div>
					<div class="pcPrice"><%=pc.getPrice()%>원</div>
					
					
					<a href=<% 
						if(login && admin == false){
							out.println("'Controller?command=buypcin'");
						}else if(login == false){
							out.println("'Controller?command=login'");
						}
					%>>
						<div class="buyBtn"><span>구매 문의</span></div>
					</a>
					<%	
						
						if(login){
							if(likeChk == 1){
								out.println("<a href='Controller?command=unlikeaction&pcNum="+pcNum+"' class='likeBtn'><img src='Images/liked.png'></a>");
							}else{
								out.println("<a href='Controller?command=likeaction&pcNum="+pcNum+"' class='likeBtn'><img src='Images/like.png'></a>");
							}
						}
							
					%>
				</div>
			</div>
		</div>
		<div class="section02">
			<div class="section02Tit">현재 보고계신 컴퓨터는<br>
				CPU는 <span><%=pc.getCpuMaker()%> <%=pc.getCpuType()%> <%=pc.getCpuName()%></span>
				RAM은 <span><%=pc.getRamVol()%></span><br>
				그래픽카드는 <span><%=pc.getGraphicName()%></span>이에요<br>
				아래의 특장점을 확인해 보세요
			</div>
			<ul class="section02Item">
				<%
					if(pc.getMining() == null){
						out.println("<li class='item'>");
						out.println("<div class='itemTit'>무채굴</div>");
						out.println("<div class='itemCon'>성능점검 및 채굴이력 확인결과 무채굴로 판별되었어요</div>");
						out.println("</li>");
					}
					if(pc.getSmoking() == null){
						out.println("<li class='item'>");
						out.println("<div class='itemTit'>비흡연</div>");
						out.println("<div class='itemCon'>내부점검 결과 비흡연으로 판별되었어요</div>");
						out.println("</li>");
					}
				%>
			</ul>
		</div>
		<div class="section03">
			<ul class="iconList">
				<li class ="icon">
					<img src="Images/cpu_icon.png">
					<span>CPU</span>
				</li>
				<li class ="icon">
					<img src="Images/mainBoard_icon.png">
					<span>메인보드</span>
				</li>
				<li class ="icon">
					<img src="Images/ram_icon.png">
					<span>메모리</span>
				</li>
				<li class ="icon">
					<img src="Images/graphic_icon.png">
					<span>그래픽카드</span>
				</li>
				<%
					if(pc.getSsdMaker() != null){
						out.println("<li class ='icon'>");
						out.println("<img src='Images/ssd_icon.png'>");
						out.println("<span>SSD</span>");
						out.println("</li>");
					}
					if(pc.getHddMaker() != null){
						out.println("<li class ='icon'>");
						out.println("<img src='Images/hdd_icon.png'>");
						out.println("<span>HDD</span>");
						out.println("</li>");
					}
				%>
				<li class ="icon">
					<img src="Images/power_icon.png">
					<span>파워서플라이</span>
				</li>
			</ul>
		</div>
		<div style="margin-bottom: 95px;"></div>
		<div class="section04">
			<ul class="opinion">
				<li>${opinion1 }</li>
				<li>${opinion2 }</li>
				<li>${opinion3 }</li>
			</ul>
		</div>
		<div class="section05">
			<div class="locationTit">대리점 위치</div>
			<div class="location" id="map">
				<script>
					var container = document.getElementById('map');
					var options = {
						center: new kakao.maps.LatLng(33.450701, 126.570667),
						level: 3
					};
			
					var map = new kakao.maps.Map(container, options);
					
					var geocoder = new kakao.maps.services.Geocoder();
					geocoder.addressSearch('<%=baseBranch%>', function(result, status) {

					     if (status === kakao.maps.services.Status.OK) {

					        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

					        var marker = new kakao.maps.Marker({
					            map: map,
					            position: coords
					        });

					        var infowindow = new kakao.maps.InfoWindow({
					            content: '<div style="width:250px;text-align:center;padding:6px 0;"><%=baseBranch%></div>'
					        });
					        infowindow.open(map, marker);

					        map.setCenter(coords);
					    } 
					});    
				</script>
			</div>
		</div>
		<div style="margin-bottom: 120px;"></div>
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