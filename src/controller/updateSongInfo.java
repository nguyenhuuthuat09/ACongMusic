package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.singerDAO;
import dao.songDAO;
import model.songInfo;
import util.validateInput;

public class updateSongInfo extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("user-bai-hat");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");

		int song_id = Integer.valueOf(req.getParameter("song_id"));
		String song_name = req.getParameter("song_name");
		String singer_id = req.getParameter("singer_id");
		
		String[] singer_id_arr = singer_id.split(",");
		
		singer_id = "";
		
		for(String singer_id_item : singer_id_arr) {
			
			singer_id_item = singer_id_item.replaceAll("\\s+","");
			
			if(validateInput.isInteger(singer_id_item)) {
				if(singerDAO.isSingerIDExist(Integer.valueOf(singer_id_item)) ) {
					if(singer_id.equals("")) {
						singer_id += singer_id_item;
					}
					else {
						singer_id += "," + singer_id_item;
					}
				}
				else {
					RequestDispatcher dispatcher = req.getRequestDispatcher("edit-song-info?id=" + String.valueOf(song_id) );
					req.setAttribute("errorSingerID", "ID ca sĩ bạn nhập không tồn tại!");
					dispatcher.forward(req, resp);
					return;
				}
			}
			else {
				RequestDispatcher dispatcher = req.getRequestDispatcher("edit-song-info?id=" + String.valueOf(song_id) );
				req.setAttribute("errorSingerID", "Vui lòng nhập ID ca sĩ hợp lệ!");
				dispatcher.forward(req, resp);
				return;
			}

		}
		

		String[] music_id_list = req.getParameterValues("music_type");

		String music_id = "";
		
		int country_id = 0;

		if(music_id_list == null) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("edit-song-info?id=" + String.valueOf(song_id) );
			req.setAttribute("errorMusicType", "Vui lòng chọn thể loại nhạc.");
			dispatcher.forward(req, resp);
			return;
		}
		else {
			
			boolean validateMusictype = validateInput.validateMusictype(music_id_list);
			
			if (validateMusictype) {
				for (String music_id_item : music_id_list) {	
					
					if (music_id.trim().equals("")) {
						music_id += music_id_item;
					} else {
						music_id += "," + music_id_item;
					}
				}
				
				// set country_id theo music_id
				if (Integer.valueOf(music_id_list[0]) >= 1 && Integer.valueOf(music_id_list[0]) <= 5) {
					country_id = 1;
				} 
				else if (Integer.valueOf(music_id_list[0]) >= 6 && Integer.valueOf(music_id_list[0]) <= 9) {
					country_id = 2;
				}
				else if (Integer.valueOf(music_id_list[0]) == 10 ) {
					country_id = 3;
				}
				else if (Integer.valueOf(music_id_list[0]) == 11 ) {
					country_id = 4;
				}
				else if (Integer.valueOf(music_id_list[0]) == 12 ) {
					country_id = 5;
				}
				else {
					country_id = 6;
				}
				
			}
			else {
				RequestDispatcher dispatcher = req.getRequestDispatcher("edit-song-info?id=" + String.valueOf(song_id) );
				req.setAttribute("errorMusicType", "Thể loại nhạc chỉ được chọn trên cùng một hàng."
						+ "Với thể loại nhạc thuộc hàng Châu á hay Khác thì chỉ được chọn một loại.");
				dispatcher.forward(req, resp);
				return;
			}
			
			
		}

		String song_about = req.getParameter("song_about");
		String song_lyrics = req.getParameter("song_lyrics");
		
		
		songInfo songNewInfo = new songInfo(0, song_name, singer_id, null, music_id, null, country_id, "", "", song_about, song_lyrics, "", "", "", 0, "");
		
		boolean result = songDAO.updateSongInfo(songNewInfo, song_id);
		
		if(result) {
			songInfo song = songDAO.getSongInfoByID(song_id);
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("edit-song-info?id=" + String.valueOf(song_id));
			req.setAttribute("song", song);
			req.setAttribute("messageUpdate", "Cập nhật thông tin bài hát thành công!");
			dispatcher.forward(req, resp);
		}
		else {
			RequestDispatcher dispatcher = req.getRequestDispatcher("edit-song-info?id=" + String.valueOf(song_id));
			req.setAttribute("errorUpdate", "Có lỗi xảy ra! Vui lòng thử lại!");
			dispatcher.forward(req, resp);
		}
		
		
		
	}

}
