package com.pcinside.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pcinside.dao.MemberDao;
import com.pcinside.dto.MemberDto;

public class MemberInfo implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDao memberDao = new MemberDao();
		MemberDto member = memberDao.getMemberInfo((String)session.getAttribute("ID"));
		ArrayList<String> list = memberDao.getEmailList();
		
		request.setAttribute("member", member);
		request.setAttribute("list", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("MemberInfo.jsp");
		rd.forward(request, response);
		
	}

}
