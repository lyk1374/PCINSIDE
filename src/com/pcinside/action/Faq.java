package com.pcinside.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pcinside.dao.FaqDao;
import com.pcinside.dto.FAQDto;

public class Faq implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FaqDao fDao = new FaqDao();
		ArrayList<FAQDto> list = fDao.faqList();
		request.setAttribute("list", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("Faq.jsp");
		rd.forward(request, response);
	}

}
