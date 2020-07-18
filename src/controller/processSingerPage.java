package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.singerDAO;
import dao.songDAO;
import model.singerInfo;
import model.songInfo;

@WebServlet(urlPatterns = "/nghe-si")
public class processSingerPage extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		if(req.getParameter("id") == null || req.getParameter("id").isEmpty()) {
			resp.sendRedirect("nghe-si-page");
			return;
		}
		
		int singer_id = Integer.valueOf(req.getParameter("id"));
		
		if(singerDAO.isSingerIDExist(Integer.valueOf(singer_id))) {
			singerInfo singer = singerDAO.getSingerInfoBySingerID(singer_id);
			
			int page = 1;
			int count = 10;
			
			if(req.getParameter("page") != null) {			
				page = Integer.parseInt(req.getParameter("page"));
			}
			
			int start = (page - 1) * count;
			
			List<songInfo> list = songDAO.getListSongBySingerID(singer_id, start, count);
			
			List<songInfo> listTopSongSinger = songDAO.getListSongBySingerIDOrderListenCountWeekDESC(singer_id, 0, 5);
			
			int amountOfSongs = songDAO.getAmountOfSongsBySingerID(singer_id);
			
			int amountOfPages = (int) Math.ceil(amountOfSongs * 1.0 / count);
			
			if (page > amountOfPages && amountOfPages != 0) {
				resp.sendRedirect("nghe-si?id=" + String.valueOf(singer_id));
				return;
			}
			
			req.setAttribute("singer", singer);
			req.setAttribute("list", list);
			req.setAttribute("listTopSongSinger", listTopSongSinger);
			req.setAttribute("amountOfPages", amountOfPages);
			req.setAttribute("currentPage", page);

			
			getServletContext().getRequestDispatcher("/nghe-si/singer-page.jsp").forward(req, resp);
			return;
		}
		else {
			resp.sendRedirect("nghe-si-page");
		}
		
		
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);

	}
}
