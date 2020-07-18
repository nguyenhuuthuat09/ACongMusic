package controller;

import java.io.IOException;

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

@WebServlet(urlPatterns = "/report")
public class processReportSong extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("home");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();

		
		if (session.getAttribute("user") == null) {
			
			
			session.setAttribute("message", "Vui lòng đăng nhập để tiếp tục.");
			String contextPath = req.getContextPath();
			
			resp.sendRedirect(contextPath + "/login.jsp");
		}
		else {
			
			
			int song_id_report = Integer.valueOf(req.getParameter("song_id_report"));
			int user_id_report = Integer.valueOf(req.getParameter("user_id_report"));

			songInfo songReport = songDAO.getSongInfoByID(song_id_report);
			userProfile profileReport = userDAO.getUserProfileByID(user_id_report);

			RequestDispatcher dispatcher = req.getRequestDispatcher("report.jsp");

			req.setAttribute("songReport", songReport);
			req.setAttribute("profileReport", profileReport);

			dispatcher.forward(req, resp);
		}

		

	}

}
