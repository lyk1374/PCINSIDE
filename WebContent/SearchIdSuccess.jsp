<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	String id = (String)request.getAttribute("id");
%>
<meta charset="UTF-8">
<title>피시인사이드</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<script>
		swal("회원님의 아이디는 <%=id%> 입니다.").then(function() {
			location.href = "Controller?command=login";
		});
	</script>
</body>
</html>