package com.pcinside.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pcinside.dao.*;

public class LogoutAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDao mDao = new MemberDao();
		String kakao = mDao.getKakaoNaver((String)(session.getAttribute("ID")));
		RequestDispatcher rd = request.getRequestDispatcher("Controller?command=main");
		if(kakao.equals("카카오")){
			session.invalidate();
			rd.forward(request, response);
		}else {
			session.invalidate();
			rd.forward(request, response);
		}
	}


}
