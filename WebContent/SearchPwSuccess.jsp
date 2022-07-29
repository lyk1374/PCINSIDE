<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	String pw = (String)request.getAttribute("pw");
%>
<meta charset="UTF-8">
<title>피시인사이드</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<script>
		swal("회원님의 비밀번호는 <%=pw%> 입니다.").then(function() {
			location.href = "Controller?command=login";
		});
	</script>
</body>
</html>