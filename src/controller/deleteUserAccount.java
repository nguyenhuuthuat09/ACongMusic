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

public class deleteUserAccount extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("user/account.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        
        HttpSession session = req.getSession();
        
        userProfile profile = (userProfile) session.getAttribute("user");
        
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        
        RequestDispatcher dispatcher = req.getRequestDispatcher("user/account.jsp");
        
        if(!username.equals(profile.getUsername())) {
        	req.setAttribute("errorDeleteAccount", "Username không chính xác.");
			dispatcher.forward(req, resp);
        }
        else if (!password.equals(profile.getPassword())) {
        	req.setAttribute("errorDeleteAccount", "Mật khẩu không chính xác.");
			dispatcher.forward(req, resp);
        }
        else {
        	
        	
        	boolean result = userDAO.deleteUserAccount(profile.getUser_id());
        	
        	if(result) {
        		session.invalidate();
        		resp.sendRedirect("home");
        	}
        	else {
        		req.setAttribute("errorDeleteAccount", "Có lỗi xảy ra. Vui lòng thử lại!");
    			dispatcher.forward(req, resp);
        	}
        }
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
