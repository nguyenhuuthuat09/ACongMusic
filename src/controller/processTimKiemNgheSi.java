package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.singerDAO;
import dao.songDAO;
import model.singerInfo;
import model.songInfo;

@WebServlet(urlPatterns = "/tim-kiem-nghe-si")
public class processTimKiemNgheSi extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");

		if (req.getParameter("q") == null) {
			resp.sendRedirect("home");
			return;
		} else {
			if (req.getParameter("q").isEmpty()) {
				resp.sendRedirect("home");
				return;
			} else {

				String q = req.getParameter("q");
				
				int page = 1;
				int count = 12; // số lượng bài hát sẽ hiện ra
				
				if(req.getParameter("page") != null && !req.getParameter("page").isEmpty()) {			
					page = Integer.parseInt(req.getParameter("page"));
				}
				
				int start = (page - 1) * count;

				// lấy tối đa 6 bài hát
				List<singerInfo> listSinger = singerDAO.searchSingerName(q, start, count);
				
				int amountOfSingers = singerDAO.getAmountSearchSingerName(q);
				
				int amountOfPages = (int) Math.ceil(amountOfSingers * 1.0 / count);
				
				if (page > amountOfPages && amountOfPages != 0) {
					resp.sendRedirect("tim-kiem-nghe-si?q=" + q);
					return;
				}
				

				RequestDispatcher dispatcher = req.getRequestDispatcher("/tim-kiem/tim-kiem-nghe-si.jsp");

				req.setAttribute("q", q);
				req.setAttribute("listSinger", listSinger);
				req.setAttribute("amountOfPages", amountOfPages);
				req.setAttribute("currentPage", page);

				dispatcher.forward(req, resp);

			}

		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

}
