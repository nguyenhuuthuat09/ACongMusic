package adminController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.songQueueDAO;
import dao.userDAO;
import model.songQueueInfo;
import model.userProfile;

@WebServlet(urlPatterns = "/admin/thong-tin-bai-hat-dang-cho")
public class processThongTinBaiHatDangCho extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("phe-duyet-bai-hat");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		String song_id = req.getParameter("song_id");
		
		songQueueInfo song = songQueueDAO.getSongQueueInfoByID(Integer.valueOf(song_id));
		
		userProfile profile = userDAO.getUserProfileByID(song.getUser_id_upload());
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("thong-tin-bai-hat-dang-cho.jsp");
		
		req.setAttribute("song", song);
		req.setAttribute("profile", profile);
		
		
		dispatcher.forward(req, resp);
		
			
		
	}

}
