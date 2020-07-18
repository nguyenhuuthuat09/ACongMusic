package adminController;

import java.io.IOException;

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

@WebServlet(urlPatterns = "/admin/chi-tiet-report")
public class processChiTietReport extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("thong-bao-report");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		int report_id = Integer.valueOf(req.getParameter("report_id"));
		int song_id_report = Integer.valueOf(req.getParameter("song_id_report"));
		int user_id_report = Integer.valueOf(req.getParameter("user_id_report"));
		
		reportInfo report = reportDAO.getReportInfoByReportID(report_id);
		songInfo songReport = songDAO.getSongInfoByID(song_id_report);
		userProfile profileReport = userDAO.getUserProfileByID(user_id_report);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("chi-tiet-report.jsp");
		req.setAttribute("report", report);
		req.setAttribute("songReport", songReport);
		req.setAttribute("profileReport", profileReport);
		
		dispatcher.forward(req, resp);
	}

}
