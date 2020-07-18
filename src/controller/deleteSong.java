package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.songDAO;

public class deleteSong extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("user-bai-hat");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        
        int song_id = Integer.valueOf(req.getParameter("song_id"));
        
        boolean result = songDAO.deleteSong(song_id);
		
        if(result) {
        	RequestDispatcher dispatcher = req.getRequestDispatcher("user-bai-hat");
        	req.setAttribute("messageDelete", "Xóa bài hát thành công");
        	dispatcher.forward(req, resp);
        }
        else {
        	RequestDispatcher dispatcher = req.getRequestDispatcher("user/edit-song-info?id=" + String.valueOf(song_id));
        	req.setAttribute("errorDelete", "Có lỗi xảy ra. Vui lòng thử lại!");
        	dispatcher.forward(req, resp);
        }
		
	}
}
