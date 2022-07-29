package com.pcinside.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pcinside.dao.*;
import com.pcinside.dto.*;

public class Main implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReviewDao reviewDao = new ReviewDao();
		FaqDao faqDao = new FaqDao();
		PCDao pcDao = new PCDao();
		
		ArrayList<ReviewDto> reviewList = reviewDao.mainScreenReview();
		ArrayList<String> pcNameList = new ArrayList<String>();
		for(int i = 0; i < reviewList.size(); i++) {
			pcNameList.add(pcDao.pcName(reviewList.get(i).getPcNum()));
		}
		ArrayList<FAQDto> faqList = faqDao.mainScreenFAQ();
		
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("pcNameList", pcNameList);
		request.setAttribute("faqList", faqList);
		
		RequestDispatcher rd = request.getRequestDispatcher("Main.jsp");
		rd.forward(request, response);
	}

}
