package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import JBcrypt.BCrypt;
import dao.userDAO;
import model.userProfile;
import util.validateInput;

public class updateUserPassword extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("user/account.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		String oldPassword = req.getParameter("oldPassword");
		String newPassword = req.getParameter("newPassword");
		String reEnterNewPassword = req.getParameter("reEnterNewPassword");
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("user/account.jsp");
		
		HttpSession session = req.getSession();
		
		userProfile profile = (userProfile) session.getAttribute("user");
		String currentPassword = profile.getPassword();
		
		BCrypt bcrypt = new BCrypt();
		
		if(!bcrypt.checkpw(oldPassword, currentPassword)) {
			req.setAttribute("error", "Mật khẩu cũ không chính xác!");
			dispatcher.forward(req, resp);
		}
		else if(!validateInput.checkPassword(newPassword)) {
			req.setAttribute("error", "Mật khẩu phải có độ dài từ 6 đến 20 kí tự!");
			dispatcher.forward(req, resp);
		}
		else if(!newPassword.equals(reEnterNewPassword)) {
			req.setAttribute("error", "Mật khẩu nhập lại không khớp!");
			dispatcher.forward(req, resp);
		}
		else {
			
			String passwordHash = bcrypt.hashpw(newPassword, bcrypt.gensalt());
			
			boolean result = userDAO.updatePassword(profile.getUsername(), passwordHash);
			
			if(result) {
				
				userProfile newProfile = new userProfile(profile.getUser_id(), profile.getUsername(), profile.getEmail(), 
						passwordHash, profile.getDateOfBirth(), profile.getMonthOfBirth(), 
						profile.getMonthOfBirth(), profile.getSex(), profile.getUser_img_path());
				
				session.setAttribute("user", newProfile);
				req.setAttribute("message", "Cập nhật mật khẩu thành công!");
				dispatcher.forward(req, resp);
			}
			else {
				session.setAttribute("error", "Có lỗi xảy ra. Vui lòng thử lại!!");
	        	resp.sendRedirect("user/account.jsp");
			}
		}
		
	}
	
	

	
}
