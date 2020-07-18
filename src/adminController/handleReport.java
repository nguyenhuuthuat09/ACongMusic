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

@WebServlet(urlPatterns = "/admin/handle-report")
public class handleReport extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.sendRedirect("thong-bao-report");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String handle_report_type = req.getParameter("handle_report_type");
		
		int report_id = Integer.valueOf(req.getParameter("report_id"));
		int song_id_report = Integer.valueOf(req.getParameter("song_id_report"));
		int user_id_report = Integer.valueOf(req.getParameter("user_id_report"));

		// nếu là xóa tài khoản
		if (handle_report_type.equals("delete")) {

			String verifyDelete = req.getParameter("verifyDelete");

			if (verifyDelete.equals("delete")) {
				
				songInfo songReport = songDAO.getSongInfoByID(song_id_report);
				reportInfo report = reportDAO.getReportInfoByReportID(report_id);
				
				boolean resultDelete = userDAO.deleteUserAccount(songReport.getUser_id_upload());
				//boolean resultCloseAfterDelete = reportDAO.setReportToReviewed(report.getReport_id());
				
				if(resultDelete ) {
			
					resp.sendRedirect("thong-bao-report");
					return;
				}
				else {
					
					
					userProfile profileReport = userDAO.getUserProfileByID(user_id_report);

					RequestDispatcher dispatcher = req.getRequestDispatcher("chi-tiet-report.jsp");
					req.setAttribute("errorDelete", "Xóa không thành công!!! Có lỗi xảy ra vui lòng thử lại");
					req.setAttribute("report", report);
					req.setAttribute("songReport", songReport);
					req.setAttribute("profileReport", profileReport);

					dispatcher.forward(req, resp);
					return;
				}
				
			} else {

				reportInfo report = reportDAO.getReportInfoByReportID(report_id);
				songInfo songReport = songDAO.getSongInfoByID(song_id_report);
				userProfile profileReport = userDAO.getUserProfileByID(user_id_report);

				RequestDispatcher dispatcher = req.getRequestDispatcher("chi-tiet-report.jsp");
				req.setAttribute("errorVerifyDelete", "Vui lòng điền 'delete' vào ô dưới để xác nhận.");
				req.setAttribute("report", report);
				req.setAttribute("songReport", songReport);
				req.setAttribute("profileReport", profileReport);

				dispatcher.forward(req, resp);
				return;

			}

		}

		// nếu là đóng report
		else if (handle_report_type.equals("close-only")) {

			String verifyCloseOnly = req.getParameter("verifyCloseOnly");

			if (verifyCloseOnly.equals("close only")) {
				
				reportInfo report = reportDAO.getReportInfoByReportID(report_id);
				
				boolean resultCloseOnly = reportDAO.setReportToReviewed(report.getReport_id());
				
				if(resultCloseOnly) {
					resp.sendRedirect("thong-bao-report");
					return;
				}
				else {
					
					songInfo songReport = songDAO.getSongInfoByID(song_id_report);	
					userProfile profileReport = userDAO.getUserProfileByID(user_id_report);

					RequestDispatcher dispatcher = req.getRequestDispatcher("chi-tiet-report.jsp");
					req.setAttribute("errorCloseOnly", "Thao tác không thành công!!! Có lỗi xảy ra vui lòng thử lại");
					req.setAttribute("report", report);
					req.setAttribute("songReport", songReport);
					req.setAttribute("profileReport", profileReport);

					dispatcher.forward(req, resp);
					return;
				}

			} else {

				reportInfo report = reportDAO.getReportInfoByReportID(report_id);
				songInfo songReport = songDAO.getSongInfoByID(song_id_report);
				userProfile profileReport = userDAO.getUserProfileByID(user_id_report);

				RequestDispatcher dispatcher = req.getRequestDispatcher("chi-tiet-report.jsp");
				req.setAttribute("errorVerifyCloseOnly", "Vui lòng điền 'close only' vào ô dưới để xác nhận.");
				req.setAttribute("report", report);
				req.setAttribute("songReport", songReport);
				req.setAttribute("profileReport", profileReport);

				dispatcher.forward(req, resp);
				return;
			}

		}

	}
}
