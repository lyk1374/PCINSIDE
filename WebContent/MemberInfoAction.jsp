<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.pcinside.dao.*" %>
<%@page import="com.pcinside.dto.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피시인사이드</title>
</head>
<body>
	<%	
		String id = (String)session.getAttribute("ID");
		String pw = request.getParameter("pw");
		String pwChk = request.getParameter("pwChk");
		String phone = request.getParameter("phone");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String userAuthcode = request.getParameter("userAuthcode");
		String authcode = request.getParameter("authcode");
		
		MemberDao memberDao = new MemberDao();
		int pwGo = 0;
		int authcodeGo = 0;
		
		if(pw.equals(pwChk) == false){
			%>
				<script>
					alert("비밀번호를 확인해주세요!")
					history.back();
				</script>
			<%
		}else{
			pwGo = 1;
		}
		if(userAuthcode.equals(authcode) == false){
			%>
				<script>
					alert("인증번호를 확인해주세요!")
					history.back();
				</script>
			<%
		}else{
			authcodeGo = 1;
		}
		if(pwGo == 1 && authcodeGo == 1){
			int authcodeInt = Integer.parseInt(authcode);
			MemberDto memberDto = new MemberDto(id, pw, name, email, phone, authcodeInt);
			memberDao.memberModify(memberDto);
			%>
				<script>
					alert("회원정보가 수정되었습니다!")
					location.href = "MyPage.jsp";
				</script>
			<%
		}
	%>
</body>
</html>