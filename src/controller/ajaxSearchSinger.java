package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ajaxSearchSinger extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		String singer_nick_name = req.getParameter("name");

		PrintWriter out = resp.getWriter();

		if (singer_nick_name == null || singer_nick_name.trim().equals("")) {
			out.print("<p>Please enter name!</p>");
		} else {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/acong_music_db", "root",
						"nhtnht123");
				String select ="select * from singers where singer_nick_name like '" + singer_nick_name + "%'";
				
				
				PreparedStatement ps = con.prepareStatement(select);
				ResultSet rs = ps.executeQuery();

				if (!rs.isBeforeFirst()) {
					out.println("<p>No Record Found!</p>");
				} else {
					while (rs.next()) {
						out.print("<span>Nick name: " + rs.getString("singer_nick_name") + "</span>" + "</br>");
						out.print("<span>Tên thật: " + rs.getString("singer_name") + "</span>" + "</br>");
						out.print("<span>ID: " + rs.getInt("singer_id") + "</span>" + "</br>");
						out.println("<p>---------------------------------</p>");
					}
				} // end of else for rs.isBeforeFirst
				con.close();
			} catch (Exception e) {
				out.print(e);
			}
		} // end of else
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
