package com.pcinside.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pcinside.dao.HotItemDao;
import com.pcinside.dto.PCDto;

public class HotItem implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		HotItemDao hotItemDao = new HotItemDao();
		int hotItemAll = hotItemDao.hotItemAll();
		ArrayList<Integer> cntList = hotItemDao.hotItemCntList(pageNum);
		ArrayList<Integer> pcList = hotItemDao.hotItemPCList(pageNum);
		ArrayList<PCDto> pcInfo = new ArrayList<PCDto>();
		for(int i = 0; i < pcList.size(); i++) {
			pcInfo.add(hotItemDao.hotItemPC(pcList.get(i)));
		}
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("hotItemAll", hotItemAll);
		request.setAttribute("cntList", cntList);
		request.setAttribute("pcList", pcList);
		request.setAttribute("pcInfo", pcInfo);
		
		RequestDispatcher rd = request.getRequestDispatcher("HotItem.jsp");
		rd.forward(request, response);
	}

}
