package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.musicTypeDAO;
import dao.singerDAO;
import dao.songDAO;
import dao.userDAO;
import model.musicType;
import model.singerInfo;
import model.songInfo;
import model.userProfile;

@WebServlet(urlPatterns = "/the-loai")
public class processTheLoai extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		int music_id = 1;

		int page = 1;
		int count = 8; // số lượng bài hát sẽ hiện ra
		
		if(req.getParameter("music_id") != null && !req.getParameter("music_id").isEmpty()) {			
			music_id = Integer.parseInt(req.getParameter("music_id"));
		}
		
		if(!musicTypeDAO.isMusicIDExist(music_id)) {
			resp.sendRedirect("the-loai");
			return;
		}
		
		if(req.getParameter("page") != null && !req.getParameter("page").isEmpty()) {			
			page = Integer.parseInt(req.getParameter("page"));
		}
		
		int start = (page - 1) * count;
		
		List<songInfo> list = songDAO.getListSongByMusicType(music_id, start, count);
		
		int amountOfSingers = songDAO.getAmountOfSongsByMusicID(music_id);
		
		int amountOfPages = (int) Math.ceil(amountOfSingers * 1.0 / count);
		
		if (page > amountOfPages && amountOfPages != 0) {
			resp.sendRedirect("the-loai");
			return;
		}
		
		List<songInfo> listTopWeek = songDAO.getListSongByMusicTypeOrderListenCountWeekDESC(music_id, 0, 10);
		
		musicType music_type = musicTypeDAO.getMusicInfoByID(music_id);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("the-loai/music-type-page.jsp");
		req.setAttribute("list", list);
		req.setAttribute("listTopWeek", listTopWeek);
		req.setAttribute("amountOfPages", amountOfPages);
		req.setAttribute("currentPage", page);
		req.setAttribute("music_type", music_type);
		
		dispatcher.forward(req, resp);
		return;
		
		
		
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);

	}
	
}
