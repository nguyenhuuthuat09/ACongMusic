package adminController;

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

import dao.adminDAO;
import model.adminProfile;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB

public class uploadAdminAvatar extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("admin/profile.jsp");
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
				RequestDispatcher dispatcher = req.getRequestDispatcher("admin/profile.jsp");
				req.setAttribute("error", "Vui lòng chọn file .png hoặc .jpg");
				dispatcher.forward(req, resp);
			} else {
				
				HttpSession session = req.getSession();
				adminProfile profile = (adminProfile) session.getAttribute("admin");
				
				String fileName = null;
				// Tên ảnh được lưu sẽ có dạng : adminName-avater.png/.jpg
				if(contentType.equals("image/png")) {
					fileName = profile.getAdminName() + "-avatar.png";
				}
				else {
					fileName = profile.getAdminName() + "-avatar.jpg";
				}
				
				String filePath = fullSavePath + "/" + fileName;
				//System.out.println(filePath);
				
				// upload file lên ổ lưu trữ
				part.write(filePath);

				// cập nhật đường admin_img_path trong csdl
				boolean result = adminDAO.updateAdminAvatar(profile.getAdminName(), fileName);

				if (result) {
					System.out.println("success");
					
					// cap nhap ngay avatar sau khi submit
					String adminAvatarPath = adminDAO.getAdminAvatarPath(profile.getAdminName());
					String fullAvatarPath = req.getContextPath() + "/img/avatar/" + adminAvatarPath;
					session.setAttribute("fullAvatarPath", fullAvatarPath);
					System.out.println(fullAvatarPath);
					resp.sendRedirect("admin/profile.jsp");
				}
			}
		

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
