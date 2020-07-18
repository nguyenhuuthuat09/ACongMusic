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
import dao.songDAO;
import model.musicType;
import model.songInfo;

@WebServlet(urlPatterns = "/bang-xep-hang")
public class processBangXepHang extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		int music_id = 1;
		
		if(req.getParameter("music_id") != null ) {  // có tồn tại param music_id
			
			// param music_id khác rỗng
			if(!req.getParameter("music_id").isEmpty()) { 
				music_id = Integer.valueOf(req.getParameter("music_id"));
			}
			else {
				resp.sendRedirect("bang-xep-hang");
				return;
			}	
		}
		
		if(!musicTypeDAO.isMusicIDExist(music_id)) {
			resp.sendRedirect("bang-xep-hang");
			return;
		}

		List<songInfo> list = songDAO.getListSongByMusicTypeOrderListenCountWeekDESC(music_id, 0, 10);
		
		
		List<songInfo> listBaiHatMoiCungTheLoai = songDAO.getListSongByMusicType(music_id, 0, 5);
		
		musicType music_type = musicTypeDAO.getMusicInfoByID(music_id);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("bang-xep-hang/bang-xep-hang-page.jsp");
		req.setAttribute("list", list);
		req.setAttribute("music_type", music_type);
		req.setAttribute("listBaiHatMoiCungTheLoai", listBaiHatMoiCungTheLoai);
		
		dispatcher.forward(req, resp);
		return;
		
		
		
		
		
		
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
