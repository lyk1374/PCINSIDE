package com.pcinside.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pcinside.dao.PCDao;
import com.pcinside.dto.PCDto;

public class BuyPC implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int price = 0;
		try {
			price = Integer.parseInt(request.getParameter("price"));
		}catch(Exception e) {
			price = 0;
		}
		ArrayList<PCDto> list = null;
		PCDao pcDao = new PCDao();
		if(price == 0) {
			list = pcDao.pcList();
		}else {
			list = pcDao.pcListSearchByPrice(price);
		}
		request.setAttribute("list", list);
		RequestDispatcher rd = request.getRequestDispatcher("BuyPC.jsp");
		rd.forward(request, response);
	}

}
