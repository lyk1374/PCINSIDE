<%@page import="java.util.ArrayList"%>
<%@page import="com.pcinside.dto.*" %>
<%@page import="com.pcinside.dao.*" %>
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
	ArrayList<PCDto> list = (ArrayList<PCDto>)(request.getAttribute("list"));
	boolean login = (String)session.getAttribute("ID") == null ? false : true;
	boolean admin = (String)session.getAttribute("ADMIN") == null ? false : true;
%>
<meta charset="UTF-8">
<title>피시인사이드</title>
<link rel="stylesheet" href="css/buyPCStyle.css">
<script src="js/jquery-3.6.0.min.js"></script>
<script>
	function popOpen(){
		$(".siteMapScreen").slideDown();	
	}
	function popDown(){
		$(".siteMapScreen").slideUp();
	}
</script>
<script src="js/buyPCScript.js"></script>
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
			<span class="titleTxt01">내컴퓨터사기	</span>
			<span class="pageLocate">
				<a href="Controller?command=main" class="page">홈</a>
				<a href="Controller?command=buypc" class="page">내컴퓨터사기</a>
			</span>
			<div style="margin-bottom: 20px;"></div>
			<div class="titleTxt02">두 번 점검으로 안심 두 배, 피시인사이드 직영 PC를 확인하세요.</div>
		</div>
		<div class="innerContent">
			<div class="search">
				<select class="searchBox">
					<option value="searchRecent">최근등록순</option>
					<option value="searchDesc">높은가격순</option>
					<option value="searchAsc">낮은가격순</option>
				</select>
			</div>
			<div class="sortBox">
				<div class="sortBoxHead">
					<a href ="#" class="reset">초기화</a>
				</div>
				<div class="chkBoxCpu">
					<div class="name">CPU</div>
					<div class="panel">
						<ul class="tree tree01" id="cpuTree01">
							<li>
								<input type="checkBox" name="cpu" class="chkBox chkTree01" id="intelBox">
								<span class="label">인텔</span><br>
								<ul class="tree tree02" id="intel">
									<li>
										<input type="checkBox" class="chkBox chkTree02" id="i3Box">
										<span class="label">i3</span><br>
										<ul class="tree tree03" id="i3">
											<li>
												<input type="checkBox" class="chkBox chkTree03" id="i3gen10Box">
												<span class="label">10세대</span><br>
												<ul class="tree tree04" id="i3gen10">
													<li>
														<input type="checkBox" class="chkBox chkTree04" id="10105Box">
														<span class="label">10105</span><br>
													</li>
												</ul>
											</li>
										</ul>
									</li>
									<li>
										<input type="checkBox" class="chkBox chkTree02" id="i5Box">
										<span class="label">i5</span><br>
										<ul class="tree tree03" id="i5">
											<li>
												<input type="checkBox" class="chkBox chkTree03" id="i5gen2Box">
												<span class="label">2세대</span><br>
												<ul class="tree tree04" id="i5gen2">
													<li>
														<input type="checkBox" class="chkBox chkTree04" id="2500Box">
														<span class="label">2500</span><br>
													</li>
												</ul>
											</li>
											<li>
												<input type="checkBox" class="chkBox chkTree03" id="i5gen3Box">
												<span class="label">3세대</span><br>
												<ul class="tree tree04" id="i5gen3">
													<li>
														<input type="checkBox" class="chkBox chkTree04" id="3470Box">
														<span class="label">3470</span><br>
													</li>
												</ul>
											</li>
											<li>
												<input type="checkBox" class="chkBox chkTree03" id="i5gen4Box">
												<span class="label">4세대</span><br>
												<ul class="tree tree04" id="i5gen4">
													<li>
														<input type="checkBox" class="chkBox chkTree04" id="4590Box">
														<span class="label" id="4590">4590</span><br>
													</li>
													<li>
														<input type="checkBox" class="chkBox chkTree04" id="4670Box">
														<span class="label" id="4670">4670</span><br>
													</li>
												</ul>
											</li>
											<li>
												<input type="checkBox" class="chkBox chkTree03" id="i5gen6Box">
												<span class="label">6세대</span><br>
												<ul class="tree tree04" id="i5gen6">
													<li>
														<input type="checkBox" class="chkBox chkTree04" id="6500Box">
														<span class="label">6500</span><br>
													</li>
												</ul>
											</li>
											<li>
												<input type="checkBox" class="chkBox chkTree03" id="i5gen7Box">
												<span class="label">7세대</span><br>
												<ul class="tree tree04" id="i5gen7">
													<li>
														<input type="checkBox" class="chkBox chkTree04" id="7400Box">
														<span class="label">7400</span><br>
													</li>
													<li>
														<input type="checkBox" class="chkBox chkTree04" id="7500Box">
														<span class="label">7500</span><br>
													</li>
												</ul>
											</li>
											<li>
												<input type="checkBox" class="chkBox chkTree03" id="i5gen8Box">
												<span class="label">8세대</span><br>
												<ul class="tree tree04" id="i5gen8">
													<li>
														<input type="checkBox" class="chkBox chkTree04" id="8400Box">
														<span class="label">8400</span><br>
													</li>
												</ul>
											</li>
											<li>
												<input type="checkBox" class="chkBox chkTree03" id="i5gen9Box">
												<span class="label">9세대</span><br>
												<ul class="tree tree04" id="i5gen9">
													<li>
														<input type="checkBox" class="chkBox chkTree04" id="9400fBox">
														<span class="label">9400f</span><br>
													</li>
												</ul>
											</li>
											<li>
												<input type="checkBox" class="chkBox chkTree03" id="i5gen10Box">
												<span class="label">10세대</span><br>
												<ul class="tree tree04" id="i5gen10">
													<li>
														<input type="checkBox" class="chkBox chkTree04" id="10400fBox">
														<span class="label">10400f</span><br>
													</li>
												</ul>
											</li>
											<li>
												<input type="checkBox" class="chkBox chkTree03" id="i5gen12Box">
												<span class="label">12세대</span><br>
												<ul class="tree tree04" id="i5gen12">
													<li>
														<input type="checkBox" class="chkBox chkTree04" id="12400fBox">
														<span class="label">12400f</span><br>
													</li>
												</ul>
											</li>
										</ul>
									</li>
									<li>
										<input type="checkBox" class="chkBox chkTree02" id="i7Box">
										<span class="label">i7</span><br>
										<ul class="tree tree03" id="i7">
											<li>
												<input type="checkBox" class="chkBox chkTree03" id="i7gen3Box">
												<span class="label">3세대</span><br>
												<ul class="tree tree04" id="i7gen3">
													<li>
														<input type="checkBox" class="chkBox chkTree04" id="3770Box">
														<span class="label">3770</span><br>
													</li>
												</ul>
											</li>
											<li>
												<input type="checkBox" class="chkBox chkTree03" id="i7gen4Box">
												<span class="label">4세대</span><br>
												<ul class="tree tree04" id="i7gen4">
													<li>
														<input type="checkBox" class="chkBox chkTree04" id="4770Box">
														<span class="label">4770</span><br>
													</li>
													<li>
														<input type="checkBox" class="chkBox chkTree04" id="4790Box">
														<span class="label">4790</span><br>
													</li>
												</ul>
											</li>
											<li>
												<input type="checkBox" class="chkBox chkTree03" id="i7gen6Box">
												<span class="label">6세대</span><br>
												<ul class="tree tree04" id="i7gen6">
													<li>
														<input type="checkBox" class="chkBox chkTree04" id="6700Box">
														<span class="label">6700</span><br>
													</li>
													<li>
														<input type="checkBox" class="chkBox chkTree04" id="6700kBox">
														<span class="label">6700k</span><br>
													</li>
												</ul>
											</li>
											<li>
												<input type="checkBox" class="chkBox chkTree03" id="i7gen8Box">
												<span class="label">8세대</span><br>
												<ul class="tree tree04" id="i7gen8">
													<li>
														<input type="checkBox" class="chkBox chkTree04" id="8700Box">
														<span class="label">8700</span><br>
													</li>
													<li>
														<input type="checkBox" class="chkBox chkTree04" id="8700kBox">
														<span class="label">8700k</span><br>
													</li>
												</ul>
											</li>
											<li>
												<input type="checkBox" class="chkBox chkTree03" id="i7gen11Box">
												<span class="label">11세대</span><br>
												<ul class="tree tree04" id="i7gen11">
													<li>
														<input type="checkBox" class="chkBox chkTree04" id="11700fBox">
														<span class="label">11700f</span><br>
													</li>
												</ul>
											</li>
											<li>
												<input type="checkBox" class="chkBox chkTree03" id="i7gen12Box">
												<span class="label">12세대</span><br>
												<ul class="tree tree04" id="i7gen12">
													<li>
														<input type="checkBox" class="chkBox chkTree04" id="12700kBox">
														<span class="label">12700k</span><br>
													</li>
												</ul>
											</li>
										</ul>
									</li>
								</ul>
							</li>
							<li>
								<input type="checkBox" name="cpu" class="chkBox chkTree01" id="amdBox">
								<span class="label">AMD</span><br>
								<ul class="tree tree02" id="amd">
									<li>
										<input type="checkBox" class="chkBox chkTree02" id="ryzen3Box">
										<span class="label">RYZEN3</span><br>
										<ul class="tree tree03" id="ryzen3">
											<li>
												<input type="checkBox" class="chkBox chkTree03" id="r3gen3Box">
												<span class="label">3세대</span><br>
												<ul class="tree tree04" id="r3gen3">
													<li>
														<input type="checkBox" class="chkBox chkTree04" id="3600Box">
														<span class="label">3600</span><br>
													</li>
												</ul>
											</li>
										</ul>
									</li>
									<li>
										<input type="checkBox" class="chkBox chkTree02" id="ryzen5Box">
										<span class="label">RYZEN5</span><br>
										<ul class="tree tree03" id="ryzen5">
											<li>
												<input type="checkBox" class="chkBox chkTree03" id="r5gen1Box">
												<span class="label">1세대</span><br>
												<ul class="tree tree04" id="r5gen1">
													<li>
														<input type="checkBox" class="chkBox chkTree04" id="1600Box">
														<span class="label">1600</span><br>
													</li>
												</ul>
											</li>
											<li>
												<input type="checkBox" class="chkBox chkTree03" id="r5gen3Box">
												<span class="label">3세대</span><br>
												<ul class="tree tree04" id="r5gen3">
													<li>
														<input type="checkBox" class="chkBox chkTree04" id="3500Box">
														<span class="label">3500</span><br>
													</li>
													<li>
														<input type="checkBox" class="chkBox chkTree04" id="3600Box">
														<span class="label">3600</span><br>
													</li>
												</ul>
											</li>
											<li>
												<input type="checkBox" class="chkBox chkTree03" id="r5gen4Box">
												<span class="label">4세대</span><br>
												<ul class="tree tree04" id="r5gen4">
													<li>
														<input type="checkBox" class="chkBox chkTree04" id="5600xBox">
														<span class="label">5600x</span><br>
													</li>
												</ul>
											</li>
										</ul>
									</li>
									<li>
										<input type="checkBox" class="chkBox chkTree02" id="ryzen7Box">
										<span class="label">RYZEN7</span><br>
										<ul class="tree tree03" id="ryzen7">
											<li>
												<input type="checkBox" class="chkBox chkTree03" id="r7gen4Box">
												<span class="label">4세대</span><br>
												<ul class="tree tree04" id="r7gen4">
													<li>
														<input type="checkBox" class="chkBox chkTree04" id="5700gBox">
														<span class="label">5700g</span><br>
													</li>
													<li>
														<input type="checkBox" class="chkBox chkTree04" id="5800xBox">
														<span class="label">5800x</span><br>
													</li>
												</ul>
											</li>
										</ul>
									</li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="itemBox">
				<ul>
				<%for(PCDto p : list){%>
					<li class='item'>
						<a href='Controller?command=buypcdetail&pcNum=<%=p.getPcNum()%>'>
							<div class='itemImg'><img src='PCImage/<%=p.getImage() %>.png'></div>
							<div class='itemName'>
								<span class='pcNum'><%=p.getPcNum()%></span>
								<span class='cpuMaker'><%=p.getCpuMaker()%></span>
								<span class='cpuType'><%=p.getCpuType()%></span>
								<span class='cpuGen'><%=p.getCpuGen()%></span>
								<span class='cpuName'><%=p.getCpuName()%></span>
								<span class='graphicChipset'><%=p.getGraphicChipset()%></span>
								<span class='graphicName'><%=p.getGraphicName()%></span>
							</div>
							<span class='itemPrice' id='price'><%=p.getPrice()%></span><span class='itemPrice'>원</span>
						</a>
					</li>	
				<%}%>					
				</ul>
			</div>
			<script>
				var arr = new Array();
				var i = 0;
				$(".item").each(function(){
					arr[i] = $(this);
					i++;
					$(this).remove();
				});
				for(var j = 0; j < arr.length; j++){
					$(".itemBox").append(arr[j]);
				}
			</script>
		</div>
	</div>
	<div style="clear: both;"></div>
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