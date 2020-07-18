package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.songDAO;
import dao.userDAO;
import model.songInfo;
import model.userProfile;

@WebServlet(urlPatterns = "/bai-hat")
public class processSongListenPage extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		int song_id = Integer.valueOf(req.getParameter("id"));
		
		if(songDAO.isSongIDExist(Integer.valueOf(song_id))) {
			songInfo song = songDAO.getSongInfoByID(song_id);
			
			int user_id_upload = song.getUser_id_upload();
			
			userProfile profile = userDAO.getUserProfileByID(user_id_upload);
			
			List<songInfo> listBaiHatMoiCungQuocGia = songDAO.getListSongByCountryID(song.getCountry_id(), 1, 5);
			
			req.setAttribute("song", song);
			req.setAttribute("listBaiHatMoiCungQuocGia", listBaiHatMoiCungQuocGia);
			req.setAttribute("userUpload", profile);
			
			getServletContext().getRequestDispatcher("/bai-hat/song-listen-page.jsp").forward(req, resp);
			return;
		}
		else {
			resp.sendRedirect("home");
		}
		
		
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);

	}
	
}
