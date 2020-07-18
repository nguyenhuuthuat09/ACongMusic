package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.songDAO;
import model.songInfo;

public class processHomePage extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");

		int page = 1;
		int count = 12; // số lượng bài hát sẽ hiện ra
		
		int start = 1;
		
		
		List<songInfo> listVietNam = songDAO.getListSongByCountryID(1, start, count);
		List<songInfo> listAuMy = songDAO.getListSongByCountryID(2, start, count);
		List<songInfo> listHanQuoc = songDAO.getListSongByCountryID(3, start, count);
		
		List<songInfo> listVietNamTop = songDAO.getListSongByCountryIDOrderByListendCountWeekDESC(1, start, count);
		List<songInfo> listAuMyTop = songDAO.getListSongByCountryIDOrderByListendCountWeekDESC(2, start, count);
		List<songInfo> listHanQuocTop = songDAO.getListSongByCountryIDOrderByListendCountWeekDESC(3, start, count);

		RequestDispatcher dispatcher = req.getRequestDispatcher("home.jsp");
		req.setAttribute("listVietNam", listVietNam);
		req.setAttribute("listAuMy", listAuMy);
		req.setAttribute("listHanQuoc", listHanQuoc);
		req.setAttribute("listVietNamTop", listVietNamTop);
		req.setAttribute("listAuMyTop", listAuMyTop);
		req.setAttribute("listHanQuocTop", listHanQuocTop);
		dispatcher.forward(req, resp);

	}
}
