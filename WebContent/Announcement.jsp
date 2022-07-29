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
	boolean login = (String)session.getAttribute("ID") == null ? false : true;
	boolean admin = (String)session.getAttribute("ADMIN") == null ? false : true;
	ArrayList<AnnouncementDto> list = (ArrayList<AnnouncementDto>)(request.getAttribute("list"));
	int announcementAll = (int)(request.getAttribute("announcementAll"));
	int pageNum = (int)(request.getAttribute("pageNum"));
%>
<meta charset="UTF-8">
<title>피시인사이드</title>
<link rel="stylesheet" href="css/announcementStyle.css">
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
	<div class="title">
		<span class="titleTxt01">공지사항</span>
		<span class="pageLocate">
			<a href="Controller?command=main" class="page">홈</a>
			<a href="Controller?command=announcement&pageNum=1" class="page">고객지원</a> 
			<a href="Controller?command=announcement&pageNum=1" class="page">공지사항</a>
		</span>
		<div style="margin-bottom: 20px;"></div>
		<div class="titleTxt02">피시인사이드의 다양한 소식을 전해드려요</div>
	</div>

	<div class="innerContent">
		<div class="board_list_wrap">
			<table class="board_list">
				<tbody>
					<% for(AnnouncementDto a : list){%>
						<tr>
							<td style="color: #888888"><%=a.getBno()%></td>
							<td><a href="Controller?command=announcementshow&bno=<%=a.getBno()%>" style="font-weight: 550;"><%=a.getTitle() %></a></td>
							<td style="color: #888888"><%=a.getTime()%></td>
						</tr>
					 <%}%>
				</tbody>
			</table>
			<div class="paging">
					<a href="Controller?command=announcement&pageNum=1" class="first"></a>
					<%	
						int endPageNum = announcementAll / 10 + (announcementAll % 10 == 0 ? 0 : 1);
						int startPageNum = pageNum-2;
						if(startPageNum+4 > endPageNum) {
							startPageNum -= startPageNum+4 - endPageNum;
						}
						if(startPageNum<1)
							startPageNum=1;
						for(int i=startPageNum; i<=startPageNum+4; i++) {
							if(i!=pageNum) {
								out.println("<a href='Controller?command=announcement&pageNum="+i+"' class='num'>"+i+"</a>");
							} else {
								out.println("<a href='Controller?command=announcement&pageNum="+i+"' class='num now'>"+i+"</a>");
							}
							if(i == endPageNum && endPageNum < 5){
								break;
							}
						}		
					%>
				<a href="Controller?command=announcement&pageNum=<%=endPageNum %>" class="last"></a>
			</div>
			<%if(admin){ %>
				<a href="Controller?command=announcementwrite" class="writeBtn">글쓰기</a>	
			<%} %>
		</div>
	</div>
	<div style="margin-bottom: 120px;"></div>
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