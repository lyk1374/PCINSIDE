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
	String name = (String)request.getAttribute("name");
	String phone = (String)request.getAttribute("phone");
%>
<meta charset="UTF-8">
<title>피시인사이드</title>
<link rel="stylesheet" href="css/sellPCChatStyle.css">
</head>
<body>
	<div class="chatWrap">
		<textarea id="messageWindow" rows="10" cols="50" readonly></textarea>
		<br/>
		<input id="inputMessage" class="chat" type="text"/>
		<input type="submit" value="보내기" class="chatGo" onclick="send()"/>
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
        textarea.value += "채팅방에 입장하셨습니다.\n";
    }

    function onError(event) {
      alert(event.data);
    }

    function send() {
    	textarea.value += "나 : " + inputMessage.value + "\n";
        webSocket.send("<%=name%>" + "/" + "<%=phone%>: " + inputMessage.value);
        inputMessage.value = "";
    }
  </script>


</html>