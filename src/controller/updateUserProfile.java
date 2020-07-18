package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.userDAO;
import model.userProfile;
import util.validateInput;

public class updateUserProfile extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("user/profile.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        
        HttpSession session = req.getSession();
        
        userProfile currentProfile = (userProfile) session.getAttribute("user");
        
        String username = currentProfile.getUsername();
        String email = req.getParameter("email");
        String password = currentProfile.getPassword();
        String dateOfBirth = req.getParameter("dateOfBirth");
        String monthOfBirth = req.getParameter("monthOfBirth");
        String yearOfBirth = req.getParameter("yearOfBirth");
        String sex = req.getParameter("sex");
        
        RequestDispatcher dispatcher = req.getRequestDispatcher("user/profile.jsp");
        
        // neu email submit len khong giong email hien tai nhung lai ton tai trong csdl roi
        if (!email.equals(currentProfile.getEmail()) && userDAO.isEmailExist(email)) {
			req.setAttribute("errorUpdateProfile", "Email đã tồn tại.");
			dispatcher.forward(req, resp);
		}
        else if (!validateInput.checkDateOfBirth(dateOfBirth)){
			req.setAttribute("errorUpdateProfile", "Ngày sinh không hợp lệ.");
			dispatcher.forward(req, resp);
		}
		else if (!validateInput.checkMonthOfBirth(monthOfBirth)){
			req.setAttribute("errorUpdateProfile", "Tháng sinh không hợp lệ.");
			dispatcher.forward(req, resp);
		}
		else if (!validateInput.checkYearOfBirth(yearOfBirth)){
			req.setAttribute("errorUpdateProfile", "Năm sinh không hợp lệ.");
			dispatcher.forward(req, resp);
		}
		else {
			userProfile newProfile = new userProfile(currentProfile.getUser_id(), username, email, password, dateOfBirth, 
	        		monthOfBirth, yearOfBirth, sex, currentProfile.getUser_img_path());
	        
	        boolean result = userDAO.updateUserProfile(newProfile, username);
	        
	        if(result) {
	        	session.setAttribute("user", newProfile);
	        	req.setAttribute("message", "Cập nhật thành công!");
	        	dispatcher.forward(req, resp);
	        }
	        else {
	        	session.setAttribute("errorUpdateProfile", "Có lỗi xảy ra. Vui lòng thử lại!!");
	        	resp.sendRedirect("user/profile.jsp");
	        }
		}
	}

}
