package com.pcinside.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pcinside.dao.MemberDao;

public class SignIn implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDao memberDao = new MemberDao();
		ArrayList<String> idList = memberDao.getIdList();
		ArrayList<String> emailList = memberDao.getEmailList();
		
		request.setAttribute("idList", idList);
		request.setAttribute("emailList", emailList);
		RequestDispatcher rd = request.getRequestDispatcher("SignIn.jsp");
		rd.forward(request, response);
	}

}
