package com.pcinside.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pcinside.javamail.EmailChk;

public class EmailChkAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		int authcode = Integer.parseInt(request.getParameter("authcode"));
		EmailChk ec = new EmailChk();
		ec.authStart(email, authcode);
		
		RequestDispatcher rd = request.getRequestDispatcher("close.jsp");
		rd.forward(request, response);
	}

}
