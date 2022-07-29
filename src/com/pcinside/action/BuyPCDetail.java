package com.pcinside.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pcinside.dao.HotItemDao;
import com.pcinside.dao.PCDao;
import com.pcinside.dto.PCDto;
import com.sun.javafx.collections.SetAdapterChange;

public class BuyPCDetail implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int pcNum = Integer.parseInt(request.getParameter("pcNum"));
		PCDao pcDao = new PCDao();
		HotItemDao hotItemDao = new HotItemDao();
		
		PCDto pc = pcDao.pcDetail(pcNum);
		String pcName = pcDao.pcName(pcNum);
		int likeChk = hotItemDao.likeChk((String)session.getAttribute("ID"), pcNum);
		String opinion1 = pcDao.opinion(pc.getOpinion1());
		String opinion2 = pcDao.opinion(pc.getOpinion2());
		String opinion3 = pcDao.opinion(pc.getOpinion3());
		String baseBranch = pcDao.location(pcNum);
		
		request.setAttribute("pcNum", pcNum);
		request.setAttribute("pc", pc);
		request.setAttribute("pcName", pcName);
		request.setAttribute("likeChk", likeChk);
		request.setAttribute("opinion1", opinion1);
		request.setAttribute("opinion2", opinion2);
		request.setAttribute("opinion3", opinion3);
		request.setAttribute("baseBranch", baseBranch);
		
		RequestDispatcher rd = request.getRequestDispatcher("BuyPCDetail.jsp");
		rd.forward(request, response);
		
	}

}
