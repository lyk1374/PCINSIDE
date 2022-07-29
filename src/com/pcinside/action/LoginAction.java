package com.pcinside.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pcinside.dao.MemberDao;

public class LoginAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDao memberDao = new MemberDao();
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		int val = memberDao.login(id, pw);
		String adminChk = memberDao.adminChk(id);
		if(val == 1){
			session.setAttribute("ID", id);
			session.setAttribute("ADMIN", adminChk);
			RequestDispatcher rd = request.getRequestDispatcher("Controller?command=main");
			rd.forward(request, response);
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("LoginFail.jsp");
			rd.forward(request, response);
		}
	}

}
