package com.pcinside.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pcinside.dao.MemberDao;
import com.pcinside.dto.MemberDto;

public class SignInAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String pwChk = request.getParameter("pwChk");
		String phone = request.getParameter("phone");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String userAuthcode = request.getParameter("userAuthcode");
		String authcode = request.getParameter("authcode");
		MemberDao memberDao = new MemberDao();
		int idGo = 0;
		int pwGo = 0;
		int authcodeGo = 0;
		ArrayList<String> idList = memberDao.getIdList();
		
		for(int i = 0; i < idList.size(); i++){
			if(idList.get(i).equals(id)){
				RequestDispatcher rd = request.getRequestDispatcher("SignInIdWrong.jsp");
				rd.forward(request, response);
			}else if(i == idList.size() - 1){
				idGo = 1;
			}
		}
		
		if(pw.equals(pwChk) == false){
			RequestDispatcher rd = request.getRequestDispatcher("SignInPwWrong.jsp");
			rd.forward(request, response);
		}else{
			pwGo = 1;
		}
		
		if(userAuthcode.equals(authcode) == false){
			RequestDispatcher rd = request.getRequestDispatcher("SignInAuthWrong.jsp");
			rd.forward(request, response);
		}else{
			authcodeGo = 1;
		}
		
		if(idGo == 1 && pwGo == 1 && authcodeGo == 1){
			int authcodeInt = Integer.parseInt(authcode);
			MemberDto memberDto = new MemberDto(id, pw, name, email, phone, authcodeInt);
			memberDao.signIn(memberDto);
			RequestDispatcher rd = request.getRequestDispatcher("SignInSuccess.jsp");
			rd.forward(request, response);
		}	
	}

}
