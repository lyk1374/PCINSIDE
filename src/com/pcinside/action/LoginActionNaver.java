package com.pcinside.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pcinside.dao.MemberDao;

public class LoginActionNaver implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String email = request.getParameter("email");
		String[] temp = email.split("@");
		String id = temp[0];
		MemberDao memberDao = new MemberDao();
		ArrayList<String> idList = memberDao.getIdList();
		int idChk = 0;
		for(int i = 0; i < idList.size(); i++){
			if(id.equals(idList.get(i))){
				idChk = 1;
			}
		}
		if(idChk == 1){
			session.setAttribute("ID", id);
		}else {
			memberDao.signInNaver(id, email);
			session.setAttribute("ID", id);
		}
		RequestDispatcher rd = request.getRequestDispatcher("Controller?command=main");
		rd.forward(request, response);
	}

}
