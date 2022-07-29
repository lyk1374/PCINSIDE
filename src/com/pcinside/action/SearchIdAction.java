package com.pcinside.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pcinside.dao.MemberDao;

public class SearchIdAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String userAuthcode = request.getParameter("userAuthcode");
		String authcode = request.getParameter("authcode");
		MemberDao memberDao = new MemberDao();
		
		int authcodeGo = 0;
		if(userAuthcode.equals(authcode) == false){
			RequestDispatcher rd = request.getRequestDispatcher("SearchIdFail.jsp");
			rd.forward(request, response);
		}else{
			authcodeGo = 1;
		}
		if(authcodeGo == 1){
			String id = memberDao.getIdFromEmail(email);
			request.setAttribute("id", id);
			RequestDispatcher rd = request.getRequestDispatcher("SearchIdSuccess.jsp");
			rd.forward(request, response);
		}	
	}

}
