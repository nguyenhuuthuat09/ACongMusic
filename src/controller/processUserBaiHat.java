package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.singerDAO;
import dao.songDAO;
import dao.userDAO;
import model.singerInfo;
import model.songInfo;
import model.userProfile;

public class processUserBaiHat extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		userProfile profile = (userProfile) session.getAttribute("user");

		RequestDispatcher dispatcher = req.getRequestDispatcher("user/bai-hat.jsp");

		List<songInfo> list = songDAO.getListSongByUserIDUpload(profile.getUser_id());

		req.setAttribute("songList", list);

		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
