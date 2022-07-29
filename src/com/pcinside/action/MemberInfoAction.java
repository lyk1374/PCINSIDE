package com.pcinside.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pcinside.dao.MemberDao;
import com.pcinside.dto.MemberDto;

public class MemberInfoAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
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
			RequestDispatcher rd = request.getRequestDispatcher("MemberInfoPwWrong.jsp");
			rd.forward(request, response);
		}else{
			pwGo = 1;
		}
		if(userAuthcode.equals(authcode) == false){
			RequestDispatcher rd = request.getRequestDispatcher("MemberInfoAuthWrong.jsp");
			rd.forward(request, response);
		}else{
			authcodeGo = 1;
		}
		if(pwGo == 1 && authcodeGo == 1){
			int authcodeInt = Integer.parseInt(authcode);
			MemberDto memberDto = new MemberDto(id, pw, name, email, phone, authcodeInt);
			memberDao.memberModify(memberDto);
			RequestDispatcher rd = request.getRequestDispatcher("MemberInfoSuccess.jsp");
			rd.forward(request, response);
		}	
	}

}
