package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.songDAO;
import model.songInfo;
import model.userProfile;

public class processEditSongInfo extends HttpServlet {
	
	// hiện ra thông tin bài hát
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		String song_id = req.getParameter("id");
		
		HttpSession session = req.getSession();
		userProfile profile = (userProfile) session.getAttribute("user");

		songInfo song = songDAO.getSongInfoByID(Integer.valueOf(song_id));
		
		if(songDAO.isSongIDExist(Integer.valueOf(song_id))) {
			// vì là hiện id trên url vì thế nguwòi dùng có thể thay đổi id ngay trên url
			// vì thế mà có thể người dùng nhập id bài hát mà không phải do mình upload
			// Cần kiểm tra xem bài hát người dùng đang yêu cầu sửa có thuộc về người dùng đấy không 
			
			if(song.getUser_id_upload() == profile.getUser_id()) {
				RequestDispatcher dispatcher = req.getRequestDispatcher("user/edit-song-info.jsp");
				req.setAttribute("song", song);	
				dispatcher.forward(req, resp);
			}
			
			else {
				resp.sendRedirect("error-authentication-edit-song-info.jsp");
				
			}
		}
		else {
			RequestDispatcher dispatcher = req.getRequestDispatcher("user-bai-hat");
			dispatcher.forward(req, resp);
			return;
		}
		
		
		
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
