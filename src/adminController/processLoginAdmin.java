package adminController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.adminDAO;
import dao.userDAO;
import model.adminProfile;

public class processLoginAdmin extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("login.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		String adminNameOrEmail = req.getParameter("adminNameOrEmail");
		String password = req.getParameter("password");
		
		HttpSession session = req.getSession();
		
		adminProfile profile = null;
		
		// chua ki tu @ thi se la email
		if(adminNameOrEmail.contains("@")) {
			profile = adminDAO.checkLoginEmail(adminNameOrEmail, password);
		}
		//khong chua thi la username
		else {
			profile = adminDAO.checkLoginAdminName(adminNameOrEmail, password);
		}
		
		
		if(profile != null) {
			
			// tao session user
			session.setAttribute("admin", profile);
			
			// session nay de lay avatar nguoi dung va hien thi ra
			String adminAvatarPath = adminDAO.getAdminAvatarPath(profile.getAdminName());
			String fullAvatarPath = req.getContextPath() + "/img/avatar/" + adminAvatarPath;
			session.setAttribute("fullAvatarPath", fullAvatarPath);
			
			resp.sendRedirect("home");
		}
		else {
			session.setAttribute("message", "Tên người dùng hoặc mật khẩu không chính xác!");
			resp.sendRedirect("admin/login.jsp");
		}
	}
	
	
	
	
	
	
	
	
	

}
