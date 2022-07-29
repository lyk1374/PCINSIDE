package com.pcinside.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pcinside.dao.*;
import com.pcinside.dto.*;

public class AdminPage implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDao mDao = new MemberDao();
		int totalMember = mDao.getTotalMember();
		InquiryDao inquiryDao = new InquiryDao();
		ArrayList<InquiryDto> list = inquiryDao.getInquiryList();
		
		request.setAttribute("list", list);
		request.setAttribute("totalMember", totalMember);
		RequestDispatcher rd = request.getRequestDispatcher("AdminPage.jsp");
		rd.forward(request, response);
	}

}
