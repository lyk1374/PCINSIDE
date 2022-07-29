package com.pcinside.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pcinside.dao.*;
import com.pcinside.dto.*;

public class Announcement implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		AnnouncementDao aDao = new AnnouncementDao();
		int announcementAll = aDao.announcementAll();
		ArrayList<AnnouncementDto> list = aDao.getAnnouncementList(pageNum);
		request.setAttribute("announcementAll", announcementAll);
		request.setAttribute("list", list);
		request.setAttribute("pageNum", pageNum);
		RequestDispatcher rd = request.getRequestDispatcher("Announcement.jsp");
		rd.forward(request, response);
	}

}
