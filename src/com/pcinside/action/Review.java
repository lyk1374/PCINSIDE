package com.pcinside.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pcinside.dao.PCDao;
import com.pcinside.dao.ReviewDao;
import com.pcinside.dto.ReviewDto;

public class Review implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReviewDao reviewDao = new ReviewDao();
		PCDao pcDao = new PCDao();
		int reviewCnt = reviewDao.getAllReview();
		ArrayList<ReviewDto> list = reviewDao.review(1);
		ArrayList<String> pcName = new ArrayList<String>();
		for(int i = 0; i < list.size(); i++) {
			pcName.add(pcDao.pcName(list.get(i).getPcNum()));
		}
		ArrayList<String> reviewImage = new ArrayList<String>();
		for(int i = 0; i < list.size(); i++) {
			reviewImage.add(reviewDao.reviewItemImage(list.get(i).getPcNum()));
		}
		request.setAttribute("reviewCnt", reviewCnt);
		request.setAttribute("list", list);
		request.setAttribute("pcName", pcName);
		request.setAttribute("reviewImage", reviewImage);
		
		RequestDispatcher rd = request.getRequestDispatcher("Review.jsp");
		rd.forward(request, response);
	}

}
