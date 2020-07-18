package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.singerDAO;
import dao.songDAO;
import model.singerInfo;

public class processNgheSiMain extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");

		int page = 1;
		int count = 15; // số lượng bài hát sẽ hiện ra
		
		if(req.getParameter("page") != null) {			
			page = Integer.parseInt(req.getParameter("page"));
		}
		
		int start = (page - 1) * count;
		
		List<singerInfo> list = singerDAO.getListSingerOffsetCount(start, count);
		
		int amountOfSingers = singerDAO.getAmountOfSingers();
		
		int amountOfPages = (int) Math.ceil(amountOfSingers * 1.0 / count);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("nghe-si/nghe-si.jsp");
		req.setAttribute("list", list);
		req.setAttribute("amountOfPages", amountOfPages);
		req.setAttribute("currentPage", page);
		
		dispatcher.forward(req, resp);
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
