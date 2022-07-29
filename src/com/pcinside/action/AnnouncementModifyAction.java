package com.pcinside.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pcinside.dao.AnnouncementDao;
import com.pcinside.dto.AnnouncementDto;

public class AnnouncementModifyAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		AnnouncementDao aDao = new AnnouncementDao();
		AnnouncementDto aDto = new AnnouncementDto(bno, title, content);
		aDao.modifyAnnouncement(aDto);
		
		RequestDispatcher rd = request.getRequestDispatcher("Controller?command=announcement&pageNum=1");
		rd.forward(request, response);
	}

}
