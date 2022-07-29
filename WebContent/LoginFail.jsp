<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피시인사이드</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<script>
		swal("로그인 실패!", "아이디나 비밀번호를 확인해주세요!", "error").then(function() {
		    location.href="Controller?command=login"
		});
	</script>
</body>
</html>