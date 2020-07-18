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

@WebServlet(urlPatterns = "/admin/delete-user")
public class deleteUserAccount extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("tim-kiem-thanh-vien.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String user_id = req.getParameter("user_id");
		String verifyDelete = req.getParameter("verifyDelete");
		
		if(verifyDelete.equals("delete")) {
			
			boolean delete_user = userDAO.deleteUserAccount(Integer.valueOf(user_id));
			
			if(delete_user) {
				
				HttpSession session = req.getSession();
				
				session.setAttribute("messageSuccess", "Xóa người dùng thành công.");
				
				resp.sendRedirect("tim-kiem-thanh-vien.jsp");
				
			}
			else {
				userProfile user = userDAO.getUserProfileByID(Integer.valueOf(user_id));
				
				String username = user.getUsername();
				
				HttpSession session = req.getSession();
				
				session.setAttribute("erorrAdminDeleteUser", "Có lỗi xảy ra. Vui lòng thử lại!!!");
				
				resp.sendRedirect("kq-tim-kiem-thanh-vien?username=" +username);
			}
			
			HttpSession session = req.getSession();
			
			session.setAttribute("erorrVerifyDeleteUser", "");
			
		}
		else {
			
			userProfile user = userDAO.getUserProfileByID(Integer.valueOf(user_id));
			
			String username = user.getUsername();
			
			HttpSession session = req.getSession();
			
			session.setAttribute("erorrVerifyDeleteUser", "Vui lòng nhập 'delete' để xác nhận.");
			
			resp.sendRedirect("kq-tim-kiem-thanh-vien?username=" +username);
			
			
		}
		
		
		
	}
	
	
}
