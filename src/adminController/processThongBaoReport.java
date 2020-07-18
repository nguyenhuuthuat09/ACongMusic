package adminController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.reportDAO;
import dao.songDAO;
import dao.userDAO;
import model.reportInfo;
import model.songInfo;
import model.userProfile;

@WebServlet(urlPatterns = "/admin/thong-bao-report")
public class processThongBaoReport extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		int page = 1;
		int count = 5; // số report sẽ hiện ra
		
		if(req.getParameter("page") != null) {			
			page = Integer.parseInt(req.getParameter("page"));
		}
		
		int start = (page - 1) * count;
		
		List<reportInfo> listReport = reportDAO.getListReportNotReviewed(start, count);
		List<songInfo> listSong = new ArrayList<>();
		List<userProfile> listUser = new ArrayList<>();
		
		for(reportInfo report : listReport) {
			
			int song_id = report.getSong_id();
			
			songInfo song = songDAO.getSongInfoByID(song_id);
			
			listSong.add(song);
			listUser.add(userDAO.getUserProfileByID(song.getUser_id_upload()));
			
		}
		
		int amountOfReportNotReviewed = reportDAO.getAmountReportNotReviewed();
		
		int amountOfPages = (int) Math.ceil(amountOfReportNotReviewed * 1.0 / count);
		
		if (page > amountOfPages && amountOfPages != 0) {
			resp.sendRedirect("thong-bao-report");
			return;
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("thong-bao-report.jsp");
		req.setAttribute("listReport", listReport);
		req.setAttribute("listSong", listSong);
		req.setAttribute("listUser", listUser);
		req.setAttribute("amountOfPages", amountOfPages);
		req.setAttribute("currentPage", page);
		
		dispatcher.forward(req, resp);
		
		

		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	
}
