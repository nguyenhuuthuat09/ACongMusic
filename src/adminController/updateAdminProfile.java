package adminController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.adminDAO;
import model.adminProfile;
import util.validateInput;

public class updateAdminProfile extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("admin/profile.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        
        HttpSession session = req.getSession();
        
        adminProfile currentProfile = (adminProfile) session.getAttribute("admin");
        
        String adminName = currentProfile.getAdminName();
        String email = req.getParameter("email");
        String password = currentProfile.getPassword();
        String dateOfBirth = req.getParameter("dateOfBirth");
        String monthOfBirth = req.getParameter("monthOfBirth");
        String yearOfBirth = req.getParameter("yearOfBirth");
        String sex = req.getParameter("sex");
        
        RequestDispatcher dispatcher = req.getRequestDispatcher("admin/profile.jsp");
        
        // neu email submit len khong giong email hien tai nhung lai ton tai trong csdl roi
        if (!email.equals(currentProfile.getEmail()) && adminDAO.isEmailExist(email)) {
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
			adminProfile newProfile = new adminProfile(adminName, email, password, dateOfBirth, 
	        		monthOfBirth, yearOfBirth, sex);
	        
	        boolean result = adminDAO.updateAdminProfile(newProfile, adminName);
	        
	        if(result) {
	        	session.setAttribute("admin", newProfile);
	        	req.setAttribute("message", "Cập nhật thành công!");
	        	dispatcher.forward(req, resp);
	        }
	        else {
	        	session.setAttribute("errorUpdateProfile", "Có lỗi xảy ra. Vui lòng thử lại!!");
	        	resp.sendRedirect("admin/profile.jsp");
	        }
		}
	}

}
