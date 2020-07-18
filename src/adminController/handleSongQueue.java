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
import dao.songQueueDAO;
import dao.userDAO;
import model.reportInfo;
import model.songInfo;
import model.songQueueInfo;
import model.userProfile;

@WebServlet(urlPatterns = "/admin/handle_song_queue")
public class handleSongQueue extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.sendRedirect("phe-duyet-bai-hat");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String handle_song_queue_type = req.getParameter("handle_song_queue_type");

		int song_id = Integer.valueOf(req.getParameter("song_id"));

		// nếu là chấp thuận bài hát
		if (handle_song_queue_type.equals("accept")) {

			String verifyAccept = req.getParameter("verifyAccept");

			if (verifyAccept.equals("accept")) {

				songQueueInfo song = songQueueDAO.getSongQueueInfoByID(song_id);

				boolean resultAccept = songQueueDAO.acceptSong(song);

				if (resultAccept) {

					resp.sendRedirect("phe-duyet-bai-hat");
					return;
				} else {

					RequestDispatcher dispatcher = req.getRequestDispatcher("phe-duyet-bai-hat.jsp");
					req.setAttribute("errorHandle", "Có lỗi xảy ra. Vui lòng thử lại");
					req.setAttribute("song", song);

					dispatcher.forward(req, resp);
					return;
				}

			} else {

				songQueueInfo song = songQueueDAO.getSongQueueInfoByID(song_id);

				RequestDispatcher dispatcher = req.getRequestDispatcher("thong-tin-bai-hat-dang-cho.jsp");
				req.setAttribute("errorVerifyAccept", "Vui lòng điền 'accept' vào ô dưới để xác nhận.");
				req.setAttribute("song", song);

				dispatcher.forward(req, resp);
				return;

			}

		}

		// nếu là xóa bài hát
		else if (handle_song_queue_type.equals("delete-song")) {

			String verifyDeleteSong = req.getParameter("verifyDeleteSong");

			if (verifyDeleteSong.equals("delete song")) {

				boolean resultDeleteSong = songQueueDAO.deleteSongQueue(song_id);

				if (resultDeleteSong) {

					resp.sendRedirect("phe-duyet-bai-hat");
					return;
				} else {

					songQueueInfo song = songQueueDAO.getSongQueueInfoByID(song_id);

					RequestDispatcher dispatcher = req.getRequestDispatcher("phe-duyet-bai-hat.jsp");
					req.setAttribute("errorHandle", "Có lỗi xảy ra. Vui lòng thử lại");
					req.setAttribute("song", song);

					dispatcher.forward(req, resp);
					return;
				}

			} else {

				songQueueInfo song = songQueueDAO.getSongQueueInfoByID(song_id);

				RequestDispatcher dispatcher = req.getRequestDispatcher("thong-tin-bai-hat-dang-cho.jsp");
				req.setAttribute("errorVerifyDeleteSong", "Vui lòng điền 'delete song' vào ô dưới để xác nhận.");
				req.setAttribute("song", song);

				dispatcher.forward(req, resp);
				return;

			}

		}

		// nếu là xóa user
		else if (handle_song_queue_type.equals("delete-user")) {

			String verifyDeleteUser = req.getParameter("verifyDeleteUser");

			if (verifyDeleteUser.equals("delete user")) {
				
				songQueueInfo song = songQueueDAO.getSongQueueInfoByID(song_id);

				boolean resultDeleteUser = userDAO.deleteUserAccount(song.getUser_id_upload());

				if (resultDeleteUser) {

					resp.sendRedirect("phe-duyet-bai-hat");
					return;
				} else {

					RequestDispatcher dispatcher = req.getRequestDispatcher("phe-duyet-bai-hat.jsp");
					req.setAttribute("errorHandle", "Có lỗi xảy ra. Vui lòng thử lại");
					req.setAttribute("song", song);

					dispatcher.forward(req, resp);
					return;
				}

			} else {

				songQueueInfo song = songQueueDAO.getSongQueueInfoByID(song_id);

				RequestDispatcher dispatcher = req.getRequestDispatcher("thong-tin-bai-hat-dang-cho.jsp");
				req.setAttribute("errorVerifyDeleteUser", "Vui lòng điền 'delete user' vào ô dưới để xác nhận.");
				req.setAttribute("song", song);

				dispatcher.forward(req, resp);
				return;

			}

		}
		
		

	}

}
