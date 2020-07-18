package adminController;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.songDAO;
import dao.userDAO;
import model.songInfo;
import model.userProfile;

@WebServlet(urlPatterns = "/admin/kq-tim-kiem-bai-hat")
public class processKQTimKiemBaiHat extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//System.out.println("1");
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		String username = req.getParameter("username");
		String song_name = req.getParameter("song_name");
		
		HttpSession session = req.getSession();
		
		session.setAttribute("messageSuccessDeleteSong", "");
		session.setAttribute("errorUsername", "");
		
		userProfile profile = userDAO.getUserProfileByUsername(username);
		
		if (profile != null) {
			//System.out.println("111");
			
			List<songInfo> list = songDAO.searchSongBySongNameAndUserIDUpload(profile.getUser_id(), song_name);
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("kq-tim-kiem-bai-hat.jsp");
			
			req.setAttribute("list", list);
			req.setAttribute("username", username);
			req.setAttribute("song_name", song_name);
			
			dispatcher.forward(req, resp);
		}
		
		else {
			resp.sendRedirect("tim-kiem-bai-hat.jsp");
			session.setAttribute("errorUsername", "Không có người dùng nào có tên " + username);
			
		}
		
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
