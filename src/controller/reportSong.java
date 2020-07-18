package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.reportDAO;
import model.userProfile;

@WebServlet(urlPatterns = "/sendReport")
public class reportSong extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("home");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		if(req.getParameter("report_reason_id") == null) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("report");
			req.setAttribute("errorSendReport", "Vui lòng chọn lý do report!");
			dispatcher.forward(req, resp);
			return;
		}
		else {
			int song_id_report = Integer.valueOf(req.getParameter("song_id_report"));
			String email_request = req.getParameter("email_request");
			int report_reason_id = Integer.valueOf(req.getParameter("report_reason_id"));
			String report_reason_more = req.getParameter("report_reason_more");
			
			HttpSession session = req.getSession();
			
			userProfile userRequest = (userProfile) session.getAttribute("user");
			
			boolean result = reportDAO.addReport(song_id_report, userRequest.getUser_id(), email_request, report_reason_id, report_reason_more);
			
			if(result) {
				resp.sendRedirect("send-report-success.jsp");
				return;
			}
			else {
				RequestDispatcher dispatcher = req.getRequestDispatcher("report");
				req.setAttribute("errorSendReport", "Có lỗi xảy ra. Vui lòng thử lại!");
				dispatcher.forward(req, resp);
				return;
			}
		}
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
