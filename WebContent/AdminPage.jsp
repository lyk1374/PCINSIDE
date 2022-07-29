<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.pcinside.dto.*"%>
<%@ page import="com.pcinside.dao.*"%>
<!DOCTYPE html>
<html>
<head>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-233393413-1"></script>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-233393413-1');
</script>

<%	
	ArrayList<InquiryDto> list = (ArrayList<InquiryDto>)(request.getAttribute("list"));
%>
<meta charset="UTF-8">
<title>피시인사이드</title>
<link rel="stylesheet" href="css/adminPageStyle.css">
</head>
<body>
	<div class="content">
		<section class="regItem">
			<div class="regItemWrap">
				<div class="tit">PC등록</div>
				<form action="PCUploadAction.jsp" enctype="multipart/form-data" method="post">
					<span>CPU제조사: </span><input type="text" class="inputBox" name="cpuMaker">
					<span>CPU타입: </span><input type="text" class="inputBox" name="cpuType">
					<span>CPU세대: </span><input type="text" class="inputBox" name="cpuGen"><br>
					<span>CPU이름: </span><input type="text" class="inputBox" name="cpuName">
					<span>메인보드 제조사: </span><input type="text" class="inputBox" name="motherBoardMaker">
					<span>메인보드 이름: </span><input type="text" class="inputBox" name="motherBoardName"><br>
					<span>그래픽카드 칩셋: </span><input type="text" class="inputBox" name="graphicChipset">
					<span>그래픽카드 이름: </span><input type="text" class="inputBox" name="graphicName">
					<span>램 제조사: </span><input type="text" class="inputBox" name="ramMaker"><br>
					<span>램 세대: </span><input type="text" class="inputBox" name="ramGen">
					<span>램 용량: </span><input type="text" class="inputBox" name="ramVol">
					<span>SSD 제조사: </span><input type="text" class="inputBox" name="ssdMaker"><br>
					<span>SSD 용량: </span><input type="text" class="inputBox" name="ssdVol">
					<span>HDD 제조사: </span><input type="text" class="inputBox" name="hddMaker">
					<span>HDD 용량: </span><input type="text" class="inputBox" name="hddVol"><br>
					<span>파워 제조사: </span><input type="text" class="inputBox" name="powerMaker">
					<span>파워 용량: </span><input type="text" class="inputBox" name="powerCap">
					<span>흡연여부(true): </span><input type="text" class="inputBox" name="smoking"><br>
					<span>채굴여부(true): </span><input type="text" class="inputBox" name="mining">
					<span>소견1(오름차순 숫자): </span><input type="text" class="inputBox" name="opinion1">
					<span>소견2: </span><input type="text" class="inputBox" name="opinion2"><br>
					<span>소견3: </span><input type="text" class="inputBox" name="opinion3">
					<span>가격: </span><input type="text" class="inputBox" name="price">
					<span>판매 대리점(숫자): </span><input type="text" class="inputBox" name="baseBranch"><br>
					<input type="file" name="image">
					<input type="submit" class="regBtn" value="등록">
				</form>
			</div>
		</section>
		<section class="chart">
			<div class="chartWrap">
				<div class="tit">통계</div>
			</div>
		</section>
		<section class="siteInfo">
			<div class="siteInfoWrap">
				<div class="tit">사이트 정보</div>
				<div>회원 수: <span>${totalMember }</span></div>
			</div>
		</section>
		<section class="chatting">
			<div class="chattingWrap">
				<div class="tit">1대1채팅</div>
				<div class="chat01">
					<textarea id="messageWindow" rows="10" cols="50" readonly></textarea>
       				<br/>
       				<input id="inputMessage" type="text"/>
       				<input type="submit" value="send" onclick="send()" />
				</div>
			</div>
		</section>
		<section class="inquiry">
			<div class="inquiryWrap">
				<div class="tit">1대1문의 내역</div>
				
				<%for(InquiryDto i : list){%>
					<div class='inquiry01'>
						<div class='inquiryInfo'>
							이름: <span><%=i.getName()%></span>
							전화번호: <span><%=i.getPhone()%></span>
							이메일: <span><%=i.getEmail()%></span>
						</div>
						<div class='inquiryName'>
							문의제목: <span><%=i.getTitle()%></span>
						</div>
						<div class='inquiryCon'>
							내용: <span><%=i.getContent()%></span>
						</div>
					</div>
					<br>
				<%}%>
			</div>
		</section>
	</div>
</body>
<script type="text/javascript">
        var textarea = document.getElementById("messageWindow");
        var webSocket = new WebSocket('ws://localhost:9090/PCINSIDE_FINAL/broadcasting');
        var inputMessage = document.getElementById('inputMessage');
    webSocket.onerror = function(event) {
      onError(event)
    };

    webSocket.onopen = function(event) {
      onOpen(event)
    };

    webSocket.onmessage = function(event) {
      onMessage(event)
    };

    function onMessage(event) {
        textarea.value += event.data + "\n";
    }

    function onOpen(event) {
        textarea.value += "연결 성공\n";
    }

    function onError(event) {
      alert(event.data);
    }

    function send() {
        textarea.value += "나 : " + inputMessage.value + "\n";
        webSocket.send("운영자: " + inputMessage.value);
        inputMessage.value = "";
    }
  </script>
</html>