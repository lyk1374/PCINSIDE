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
	int bno = (int)request.getAttribute("bno");
	FreeBoardDto writing = (FreeBoardDto)request.getAttribute("writing");
	ArrayList<CommentDto> list = (ArrayList<CommentDto>)request.getAttribute("list");
	boolean login = (String)session.getAttribute("ID") == null ? false : true;
	boolean admin = (String)session.getAttribute("ADMIN") == null ? false : true;
%>
<meta charset="UTF-8">
<title>피시인사이드</title>
<link rel="stylesheet" href="css/freeBoardShowStyle.css">
<script src="js/jquery-3.6.0.min.js"></script>
<script>
	function popOpen(){
		$(".siteMapScreen").slideDown();	
	}
	function popDown(){
		$(".siteMapScreen").slideUp();
	}
</script>
<script>
	$(function() {
		$(".commentModify").click(function() {
			if($(this).parent().parent().find(".commentModifyArea").html().length > 0){
				$(this).parent().parent().find(".commentModifyArea").find(".ta").remove();
			}else{
				$(this).parent().parent().find(".commentModifyArea").html("<textarea name='content' class='ta' cols row='4' placeholder='여러분의 소중한 댓글을 입력해주세요'></textarea><input type='submit' class='ta' value='댓글작성'  style='margin: 0 2px;text-decoration: none;font-size: 19px;font-weight: 400; float: right; margin-top:85px;'>");
			}
		});
	});
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
	<div class="board_wrap">
		<div class="title2">
		<span class="titleTxt01">자유게시판</span> <span class="pageLocate">
			<a href="Controller?command=main" class="page">홈</a>
			<a href="Controller?command=announcement&pageNum=1" class="page">고객지원</a>
			<a href="Controller?command=freeboard&pageNum=1" class="page">자유게시판</a>
		</span>
		<div style="margin-bottom: 20px;"></div>
		<div class="titleTxt02">피시인사이드의 다양한 소식을 전해드려요</div>
		<div style="margin-bottom: 40px;"></div>
		</div>
		<div class="board_list_Wrap">
			<div class="board_view">
				<div class="title"><%=writing.getTitle()%></div>
				<div class="info">
					<dl>
						<dt>번호</dt>
						<dd><%=writing.getBno()%></dd>
					
					</dl>
					<dl>
						<dt>글쓴이</dt>
						<dd><%=writing.getWriter()%></dd>
					
					</dl>
					<dl>
						<dt>작성일</dt>
						<dd><%=writing.getTime()%></dd>
					</dl>
				</div>
				<div class="cont">
					<%=writing.getContent()%>
				</div>
			</div>
			<div class="board_page">
			</div>
			<div class="bt_wrap">
				<a href="Controller?command=freeboard&pageNum=1" class="on">목록</a>
				<%if(writing.getWriter().equals(session.getAttribute("ID"))){%>
					<a href="Controller?command=freeboardmodify&bno=<%=writing.getBno()%>&title=<%=writing.getTitle()%>&content=<%=writing.getContent()%>">수정</a>
					<a href="Controller?command=freeboarddeleteaction&bno=<%=writing.getBno()%>">삭제</a>
				<%} %>
			</div>
		</div>
		<div class="comment-form">
				
			<%if(login) {%>	
			<form action="Controller">
				<input type="hidden" name=command value="freeboardcommentwriteaction">
				<textarea name="content" cols row="4" placeholder="여러분의 소중한 댓글을 입력해주세요" style="width: 1049px;"></textarea>
				<input type="hidden" value="<%=bno%>" name="bno">
				<input type="submit" value="댓글작성" style="margin: 0 2px;text-decoration: none;font-size: 19px;font-weight: 400; float: right; margin-top:82px;">
			</form>
			<%} %>
			
			
			<div class="comments">
				<div class="comment-list">
					<ul style="margin-top:40px;">
					<%
					int cnt = 0;
					for(CommentDto f : list){%>
						<li id='comment1'>
							<div class='author-meta'>
								<span class='nickname'><%=f.getMemberID()%></span>
								<span class='date'><%=f.getTime()%></span>"
							</div>
							<p><%=f.getContent()%></p>
							<form action='Controller'>
								<input type="hidden" name="command" value="freeboardcommentmodifyaction">
								<div class='commentModifyArea'></div>
								<input type='hidden' name='rno' value="<%=f.getRno()%>">
								<input type='hidden' name='bno' value="<%=f.getBno()%>">
								<div class='control'>
							<%if(f.getMemberID().equals(session.getAttribute("ID"))){%>
								<a href='#' onclick='return false;' class='commentModify'>수정</a>
							</form>
							<form action='Controller' id='frm<%=cnt%>'>
								<input type="hidden" name="command" value="freeboardcommentdeleteaction">
								<input type='hidden' name='rno' value='<%=f.getRno()%>'>
								<input type='hidden' name='bno' value='<%=f.getBno()%>'>
								<a href='#' onclick='return false;' id='delete<%=cnt%>'>삭제</a>
							</form>
							<%}%>
							</div>
							<script>
								$('#delete<%=cnt%>').click(function() {
									$("#frm<%=cnt%>").submit();
								});
							</script>		
						</li>
						<% cnt++;%>																																																					
					<%}%>
	
					</ul>			
				</div>
			</div>
		</div>
	</div>
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