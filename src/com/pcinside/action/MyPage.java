package com.pcinside.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pcinside.dao.*;
import com.pcinside.dto.*;

public class MyPage implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		PCDao pDao = new PCDao();
		ArrayList<PCDto> list = pDao.myPagePC((String)session.getAttribute("ID"));
		request.setAttribute("list", list);
		RequestDispatcher rd = request.getRequestDispatcher("MyPage.jsp");
		rd.forward(request, response);
	}


}
