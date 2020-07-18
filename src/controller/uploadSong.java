package controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.mysql.fabric.xmlrpc.base.Array;

import dao.singerDAO;
import dao.songDAO;
import model.songInfo;
import model.userProfile;
import util.stringUlti;
import util.validateInput;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB
public class uploadSong extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("user/upload.jsp");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		try {
			
			// thư mục lưu file nhạc
			String audioSaveDirectory = "audio";
			
			// thư mục lưu file ảnh bài hát
			String songImageSaveDirectory = "img/bai-hat";
			
			// Đường dẫn tuyệt đối tới thư mục gốc của web app.
			String appPath = req.getServletContext().getRealPath("");
			// System.out.println(appPath);
			appPath = appPath.replace('\\', '/');
			
			// Thư mục để save file audio tải lên.
			String fullAudioSavePath = null;
			if (appPath.endsWith("/")) {
				fullAudioSavePath = appPath + audioSaveDirectory;
			} else {
				fullAudioSavePath = appPath + "/" + audioSaveDirectory;
			}

			// Tạo thư mục lưu audio nếu nó không tồn tại.
			File fileAduioSaveDir = new File(fullAudioSavePath);
			if (!fileAduioSaveDir.exists()) {
				fileAduioSaveDir.mkdir();
			}
			
			// Thư mục để save file ảnh bài hát tải lên.
			String fullSongImageSavePath = null;
			if (appPath.endsWith("/")) {
				fullSongImageSavePath = appPath + songImageSaveDirectory;
			} else {
				fullSongImageSavePath = appPath + "/" + songImageSaveDirectory;
			}
			
			// Tạo thư mục lưu ảnh bài hát nếu nó không tồn tại.
			File fileImageSaveDir = new File(fullSongImageSavePath);
			if (!fileImageSaveDir.exists()) {
				fileImageSaveDir.mkdir();
			}
			
			System.out.println("1");
			
			Part audioFile = req.getPart("audioFile");
			
			System.out.println("1.5");
			
			Part image = req.getPart("image");
			
			
			
			System.out.println("2");
			
			String audioFileContentType = audioFile.getContentType();
			String imageContentType = image.getContentType();
			
			if(!audioFileContentType.equals("audio/mpeg")) {
				
				System.out.println("3");
				
				RequestDispatcher dispatcher = req.getRequestDispatcher("user/upload.jsp");
				req.setAttribute("errorAudio", "Vui lòng chọn file có định dạng .mp3");
				dispatcher.forward(req, resp);
			} 
			
			else if (!imageContentType.equals("image/png") && !imageContentType.equals("image/jpeg")) {
				
				System.out.println("4");
				
				RequestDispatcher dispatcher = req.getRequestDispatcher("user/upload.jsp");
				req.setAttribute("errorImage", "Vui lòng chọn file có định dạng .png hoặc .jpg");
				dispatcher.forward(req, resp);
			} 
			
			else {
				
				System.out.println("5");
				
				HttpSession session = req.getSession();
				userProfile profile = (userProfile) session.getAttribute("user");
				
				String username = profile.getUsername();
				
				String audioFileUploadName = audioFile.getSubmittedFileName();
				System.out.println(audioFileUploadName);
				String audioFileSaveName = stringUlti.standardizeFileAudioName(audioFileUploadName, username);
				System.out.println(audioFileSaveName);
				
				String imageUploadName = audioFile.getSubmittedFileName();
				String imageSaveName = stringUlti.standardizeFileImageName(imageUploadName, username);
				
				String audioFilePath = fullAudioSavePath + "/" + audioFileSaveName;
				String imagePath = fullSongImageSavePath + "/" + imageSaveName;
				
				audioFile.write(audioFilePath);
				image.write(imagePath);
				
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
							RequestDispatcher dispatcher = req.getRequestDispatcher("user/upload.jsp");
							req.setAttribute("errorSingerID", "ID ca sĩ bạn nhập không tồn tại!");
							dispatcher.forward(req, resp);
							return;
						}
					}
					else {
						RequestDispatcher dispatcher = req.getRequestDispatcher("user/upload.jsp");
						req.setAttribute("errorSingerID", "Vui lòng nhập ID ca sĩ hợp lệ!");
						dispatcher.forward(req, resp);
						return;
					}

				}
				
				String[] music_id_list = req.getParameterValues("music_type");
				
				String music_id = "";
				int country_id = 0;
				
				if(music_id_list == null) {
					RequestDispatcher dispatcher = req.getRequestDispatcher("user/upload.jsp");
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
						RequestDispatcher dispatcher = req.getRequestDispatcher("user/upload.jsp");
						req.setAttribute("errorMusicType", "Thể loại nhạc chỉ được chọn trên cùng một hàng."
								+ "Với thể loại nhạc thuộc hàng Châu á hay Khác thì chỉ được chọn một loại.");
						dispatcher.forward(req, resp);
						return;
					}
					
					
				}
							
				
				String song_path = audioFileSaveName;
				
				
				String song_about = req.getParameter("song_about");
				
				if(song_about.equals(null) || song_about.isEmpty() || song_about.trim().equals("")) {
					song_about = "Hiện chưa có thông tin.";
				}
				
				String song_lyrics = req.getParameter("song_lyrics");
				
				if(song_lyrics.equals(null) || song_lyrics.isEmpty() || song_lyrics.trim().equals("")) {
					song_lyrics = "Bài hát hiện chưa có lời.";
				}
				
				/*
				// phải thay kí tự xuống dòng thành <br/> để có thể thêm vào csdl mà k bị lỗi
				// vì khi thêm vào cơ sở dữ liệu, nếu gặp ksi tự xuống dòng thì sẽ bị ngắt
				// và không được thêm đầy đủ vào csdl
				song_about.replaceAll("(\\\\r\\\\n|\\\\n)", "<br />");
				song_lyrics.replaceAll("(\\\\r\\\\n|\\\\n)", "<br />");
				
				System.out.println(song_about);
				*/
				
				String song_img_path = imageSaveName;
				
				
				
				int user_id_upload = profile.getUser_id();
				
				String upload_date = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss").format(Calendar.getInstance().getTime());
				
				// mới upload thì listen_count sẽ là 0
				songInfo song = new songInfo(0, song_name, singer_id, null, music_id, null, country_id, "", 
						song_path, song_about, song_lyrics, song_img_path, "0", "0",user_id_upload, upload_date);
				
				boolean result = songDAO.addSongToQueue(song);
				
				if(result) {
					RequestDispatcher dispatcher = req.getRequestDispatcher("upload-success.jsp");
					dispatcher.forward(req, resp);
				}		
				else {
					RequestDispatcher dispatcher = req.getRequestDispatcher("user/upload.jsp");
					req.setAttribute("error", "Có lỗi xảy ra. Vui lòng thử lại!");
					
					dispatcher.forward(req, resp);
				}
				
			}
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		

		
	}
	
	
	
	
}
