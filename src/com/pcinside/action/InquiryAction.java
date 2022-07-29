package com.pcinside.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pcinside.dao.InquiryDao;
import com.pcinside.dto.InquiryDto;

public class InquiryAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
	
		InquiryDto iDto = new InquiryDto(name,phone,email,title,content);
		
		InquiryDao idao = new InquiryDao();
		
		idao.inquiry(iDto);
		
		RequestDispatcher rd = request.getRequestDispatcher("InquirySuccess.jsp");
		rd.forward(request, response);
	}

}
