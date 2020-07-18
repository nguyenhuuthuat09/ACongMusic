package adminController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.songDAO;

@WebServlet(urlPatterns = "/admin/delete-song")
public class deleteSong extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("tim-kiem-bai-hat.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String username = req.getParameter("username");
		String song_name = req.getParameter("song_name");
		String song_id = req.getParameter("song_id");
		
		
		boolean resultDeleteSong = songDAO.deleteSong(Integer.valueOf(song_id));
		
		if(resultDeleteSong) {
			
			HttpSession session = req.getSession();
			session.setAttribute("messageSuccessDeleteSong", "Xóa bài hát thành công");
			
			resp.sendRedirect("tim-kiem-bai-hat.jsp");
			return;
		}
		else {
			RequestDispatcher dispatcher =req.getRequestDispatcher("kq-tim-kiem-bai-hat?username=" + username + "&song_name=" +song_name);
			
			req.setAttribute("errorDeleteSong", "Có lỗi xảy ra! Vui lòng thử lại.");
			
			dispatcher.forward(req, resp);
			
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
	
}
