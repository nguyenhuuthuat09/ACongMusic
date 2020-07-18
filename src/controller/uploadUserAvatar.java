package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.userDAO;
import model.userProfile;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB

public class uploadUserAvatar extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("user/profile.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			// thu muc luu anh nguoi dung
			String saveDirectory = "img/avatar";

			// Đường dẫn tuyệt đối tới thư mục gốc của web app.
			String appPath = req.getServletContext().getRealPath("");
			//System.out.println(appPath);
			appPath = appPath.replace('\\', '/');

			// Thư mục để save file tải lên.
			String fullSavePath = null;
			if (appPath.endsWith("/")) {
				fullSavePath = appPath + saveDirectory;
			} else {
				fullSavePath = appPath + "/" + saveDirectory;
			}
			
			// Tạo thư mục nếu nó không tồn tại.
			File fileSaveDir = new File(fullSavePath);
			if (!fileSaveDir.exists()) {
				fileSaveDir.mkdir();
			}

			Part part = req.getPart("avatarImage");
			String contentType = part.getContentType();
			//System.out.println(contentType);

			if (!contentType.equals("image/png") && !contentType.equals("image/jpeg")) {
				System.out.println("1");
				RequestDispatcher dispatcher = req.getRequestDispatcher("user/profile.jsp");
				req.setAttribute("error", "Vui lòng chọn file .png hoặc .jpg");
				dispatcher.forward(req, resp);
			} else {
				
				HttpSession session = req.getSession();
				userProfile profile = (userProfile) session.getAttribute("user");
				
				String fileName = null;
				// Tên ảnh được lưu sẽ có dạng : username-avater.png/.jpg
				if(contentType.equals("image/png")) {
					fileName = profile.getUsername() + "-avatar.png";
				}
				else {
					fileName = profile.getUsername() + "-avatar.jpg";
				}
				
				String filePath = fullSavePath + "/" + fileName;
				//System.out.println(filePath);
				
				// upload file lên ổ lưu trữ
				part.write(filePath);

				// cập nhật đường user_img_path trong csdl
				boolean result = userDAO.updateUserAvatar(profile.getUser_id(), fileName);

				if (result) {
					System.out.println("success");
					
					userProfile newProfile = new userProfile(profile.getUser_id(), 
							profile.getUsername(), profile.getEmail(), 
							profile.getPassword(), profile.getDateOfBirth(), 
							profile.getMonthOfBirth(), profile.getYearOfBirth(), 
							profile.getSex(), fileName);
					
					session.setAttribute("user", newProfile);
					
					resp.sendRedirect("user/profile.jsp");
				}
			}
		

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
