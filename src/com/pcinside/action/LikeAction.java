package com.pcinside.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pcinside.dao.HotItemDao;

public class LikeAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		HotItemDao hotItemDao = new HotItemDao();
		int pcNum = Integer.parseInt(request.getParameter("pcNum"));
		hotItemDao.like((String)session.getAttribute("ID"), pcNum);
		
		RequestDispatcher rd = request.getRequestDispatcher("Controller?command=buypcdetail&pcNum="+pcNum+"");
		rd.forward(request, response);
	}

}
