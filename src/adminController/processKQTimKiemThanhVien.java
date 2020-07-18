package adminController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.userDAO;
import model.userProfile;

@WebServlet(urlPatterns = "/admin/kq-tim-kiem-thanh-vien")
public class processKQTimKiemThanhVien extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		String username = req.getParameter("username");
		
		userProfile user = userDAO.getUserProfileByUsername(username);
		
		HttpSession session = req.getSession();
		
		session.setAttribute("messageSuccess", "");
		session.setAttribute("erorrAdminDeleteUser", "");
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("kq-tim-kiem-thanh-vien.jsp");
		
		req.setAttribute("user", user);
		req.setAttribute("usernameParam", username);
		
		dispatcher.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
