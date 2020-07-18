package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JBcrypt.*;
import dao.userDAO;
import model.userProfile;
import util.validateInput;


public class processRegister extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("register.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		String username = req.getParameter("username");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String reEnterPassword = req.getParameter("reEnterPassword");
		String dateOfBirth = req.getParameter("dateOfBirth");
		String monthOfBirth = req.getParameter("monthOfBirth");
		String yearOfBirth = req.getParameter("yearOfBirth");
		String sex = req.getParameter("sex");
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("register.jsp");
		
		if (!validateInput.checkUsername(username)) {
			req.setAttribute("error", "Tên người dùng không hợp lệ.");
			dispatcher.forward(req, resp);
		}
		else if (userDAO.isUsernameExist(username)) {
			req.setAttribute("error", "Tên người dùng đã tồn tại.");
			dispatcher.forward(req, resp);
		}
		else if (userDAO.isEmailExist(email)) {
			req.setAttribute("error", "Email đã tồn tại.");
			dispatcher.forward(req, resp);
		}
		else if (!validateInput.checkPassword(password)) {
			req.setAttribute("error", "Mật khẩu không hợp lệ.");
			dispatcher.forward(req, resp);
		}
		else if (!validateInput.checkReEnterPassword(password, reEnterPassword)) {
			req.setAttribute("error", "Mật khẩu nhập lại không khớp.");
			dispatcher.forward(req, resp);
		}
		else if (!validateInput.checkDateOfBirth(dateOfBirth)){
			req.setAttribute("error", "Ngày sinh không hợp lệ.");
			dispatcher.forward(req, resp);
		}
		else if (!validateInput.checkMonthOfBirth(monthOfBirth)){
			req.setAttribute("error", "Tháng sinh không hợp lệ.");
			dispatcher.forward(req, resp);
		}
		else if (!validateInput.checkYearOfBirth(yearOfBirth)){
			req.setAttribute("error", "Năm sinh không hợp lệ.");
			dispatcher.forward(req, resp);
		}
		else {
			
			// mã hóa mật khẩu trước khi thêm vào database
			BCrypt bcrypt = new BCrypt();
			
			String passwordHash = bcrypt.hashpw(password, bcrypt.gensalt());
			
			// user_id để bằng 0 hay 1 số int bất kì để không lỗi
			// giá trị này không được sử dụng khi thêm vào csdl vì user_int là tự động tăng
			userProfile profile = new userProfile(0 ,username, email, passwordHash, 
					dateOfBirth, monthOfBirth, yearOfBirth, sex, "");
			
			boolean result = userDAO.addNewUser(profile);
			
			if(result) {
				RequestDispatcher dispatcherTemp = req.getRequestDispatcher("login.jsp");
				req.setAttribute("message", "Đăng kí thành công. Vui lòng đăng nhập bằng tài khoản bạn mới tạo!");
				dispatcherTemp.forward(req, resp);
			}
			else {
				req.setAttribute("error", "Có lỗi xảy ra. Vui lòng thử lại!!!");
				dispatcher.forward(req, resp);
			}
			
			
		}
	}

}
