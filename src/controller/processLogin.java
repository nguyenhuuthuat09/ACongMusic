package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.userDAO;
import model.userProfile;

public class processLogin extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("login.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		String usernameOrEmail = req.getParameter("usernameOrEmail");
		String password = req.getParameter("password");
		
		HttpSession session = req.getSession();
		
		userProfile profile = null;
		
		// chua ki tu @ thi se la email
		if(usernameOrEmail.contains("@")) {
			profile = userDAO.checkLoginEmail(usernameOrEmail, password);
		}
		//khong chua thi la username
		else {
			profile = userDAO.checkLoginUsername(usernameOrEmail, password);
		}
		
		
		if(profile != null) {
			
			// tao session user
			session.setAttribute("user", profile);
						
			resp.sendRedirect("home");
		}
		else {
			session.setAttribute("message", "Tên người dùng hoặc mật khẩu không chính xác!");
			resp.sendRedirect("login.jsp");
		}
	}

}
