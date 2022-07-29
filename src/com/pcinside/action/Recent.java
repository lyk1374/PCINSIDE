package com.pcinside.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pcinside.dao.RecentDao;
import com.pcinside.dto.RecentDto;

public class Recent implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		RecentDao rDao = new RecentDao();
		int recentAll = rDao.recentAll();
		ArrayList<RecentDto> list = rDao.getRecent();
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("recentAll", recentAll);
		request.setAttribute("list", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("Recent.jsp");
		rd.forward(request, response);
	}

}
