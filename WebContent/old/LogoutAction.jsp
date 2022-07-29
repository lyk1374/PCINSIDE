<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.pcinside.dao.*" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피시인사이드</title>
</head>
<body>
	<%	
		MemberDao memberDao = new MemberDao();
		String kakao = memberDao.getKakaoNaver((String)(session.getAttribute("ID")));
		if(kakao.equals("카카오")){
			session.invalidate();
			%>
				<script>
					location.href = "http://developers.kakao.com/logout";
					location.href = "Main.jsp";
				</script>
			<%
		}else {
			session.invalidate();
			%>
				<script>
					location.href = "Main.jsp";
				</script>
			<%			
		}
	%>
</body>
</html>