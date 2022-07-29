<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.pcinside.dao.*" %>
<%@ page import="com.pcinside.dto.*" %>  
<%
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
%>