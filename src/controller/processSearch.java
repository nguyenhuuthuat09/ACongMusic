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

@WebServlet(urlPatterns = "/tim-kiem")
public class processSearch extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		if(req.getParameter("q") == null) {
			resp.sendRedirect("home");
			return;
		}
		else {
			if(req.getParameter("q").isEmpty()) {
				resp.sendRedirect("home");
				return;	
			}
			else {
				
				String q = req.getParameter("q");
				
				// lấy tối đa 6 bài hát
				List<songInfo> listSong = songDAO.searchSongName(q, 0, 6);
				
				// lấy tối đa 6 ca sĩ
				List<singerInfo> listSinger = singerDAO.searchSingerName(q, 0, 6);
				
				RequestDispatcher dispatcher = req.getRequestDispatcher("/tim-kiem/tim-kiem.jsp");
				
				req.setAttribute("q", q);
				req.setAttribute("listSong", listSong);
				req.setAttribute("listSinger", listSinger);
				
				dispatcher.forward(req, resp);

			}
				
		}
			
	}
	
	
}
