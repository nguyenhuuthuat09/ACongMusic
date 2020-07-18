package adminController;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.reportDAO;
import dao.songQueueDAO;
import model.songQueueInfo;

@WebServlet(urlPatterns = "/admin/phe-duyet-bai-hat")
public class processPheDuyetBaiHat extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");

		int page = 1;
		int count = 5; // số bài hát đang chờ sẽ hiện ra

		if (req.getParameter("page") != null && !req.getParameter("page").isEmpty()) {
			page = Integer.parseInt(req.getParameter("page"));
		}

		int start = (page - 1) * count;

		List<songQueueInfo> list = songQueueDAO.getListSongQueue(start, count);

		int amountOfSong = songQueueDAO.getAmountSongQueue();

		int amountOfPages = (int) Math.ceil(amountOfSong * 1.0 / count);

		if (page > amountOfPages && amountOfPages != 0) {
			resp.sendRedirect("phe-duyet-bai-hat");
			return;
		}

		RequestDispatcher dispatcher = req.getRequestDispatcher("phe-duyet-bai-hat.jsp");
		req.setAttribute("list", list);
		req.setAttribute("amountOfPages", amountOfPages);
		req.setAttribute("currentPage", page);

		dispatcher.forward(req, resp);

	}

}
