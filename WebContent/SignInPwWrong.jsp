<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피시인사이드</title>
</head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<body>
	<script>
		swal("비밀번호를 확인해주세요!").then(function() {
		    location.href="Controller?command=signin"
		});
	</script>
</body>
</html>