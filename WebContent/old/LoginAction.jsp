<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.pcinside.dao.*" %>   
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>피시인사이드</title>
<script>
	history.replaceState({}, null, location.pathname);
</script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<%	
		MemberDao memberDao = new MemberDao();
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		int val = memberDao.login(id, pw);
		String adminChk = memberDao.adminChk(id);
		
		if(val == 1){
				session.setAttribute("ID", id);
				session.setAttribute("ADMIN", adminChk);
			%>	
				<script>
					location.href = "Main.jsp"
				</script>
			<%
		}else {
			%>
				<script>
					swal("로그인 실패!", "아이디나 비밀번호를 확인해주세요!", "error").then(function() {
					    history.back();
					});
				</script>
			<%
		}
	%>
</body>
</html>