package com.pcinside.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pcinside.dao.*;
import com.pcinside.dto.*;

public class AnnouncementModify implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		AnnouncementDao aDao = new AnnouncementDao();
		AnnouncementDto aDto = aDao.getTitleAndContent(bno);
		request.setAttribute("aDto", aDto);
		request.setAttribute("bno", bno);
		RequestDispatcher rd = request.getRequestDispatcher("AnnouncementModify.jsp");
		rd.forward(request, response);
	}

}
