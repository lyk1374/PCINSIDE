package com.pcinside.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pcinside.dao.PartPriceDao;
import com.pcinside.dto.PartDto;

public class PartPrice implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PartPriceDao partDao = new PartPriceDao();
		String str = request.getParameter("str");
		ArrayList<PartDto> list = partDao.getPartInfo(str);
		request.setAttribute("list", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("PartPrice.jsp");
		rd.forward(request, response);
	}

}
