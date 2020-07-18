package dao;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import model.reportInfo;
import model.songInfo;

public class reportDAO {

	// tao ket noi
	public static Connection openConnection() {
		Connection conn = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/acong_music_db", "username", "password");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	// lấy report_reason theo report_reason_id
	public static String getReportReason (int report_reason_id) {
		
		String report_reason = null;

		String select = "select * from report_reason where report_reason_id = ?";

		try (Connection c = openConnection()) {

			PreparedStatement ps = c.prepareStatement(select);
			ps.setInt(1, report_reason_id);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				report_reason = rs.getString("report_reason");
				return report_reason;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return report_reason;
		
		
	}

	// lấy reportInfo theo report_id
	public static reportInfo getReportInfoByReportID(int report_id) {

		reportInfo report = null;

		String select = "select * from reports where report_id = ?";

		try (Connection c = openConnection()) {

			PreparedStatement ps = c.prepareStatement(select);
			ps.setInt(1, report_id);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				
				String report_reason = getReportReason(rs.getInt("report_reason_id"));
				
				report = new reportInfo(report_id, rs.getInt("song_id"), rs.getInt("user_id_request"), rs.getString("email_request"),
						rs.getInt("report_reason_id"), report_reason, rs.getString("report_reason_more"),
						rs.getInt("report_reviewed"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return report;

	}
	
	// Thêm phiếu report
	public static boolean addReport(int song_id, int user_id_request, String email_request, int report_reason_id, String report_reason_more) {
		
		int report_reviewed = 0;
		
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		
		try (Connection c = openConnection()) {

			String insert = "insert into reports values (null, ?, ?, ?, ?, ?, ?, ?)";

			PreparedStatement ps = c.prepareStatement(insert);
			ps.setInt(1, song_id);
			ps.setInt(2, user_id_request);
			ps.setString(3, email_request);
			ps.setInt(4, report_reason_id);
			ps.setString(5, report_reason_more);
			ps.setTimestamp(6, date);
			ps.setInt(7, report_reviewed);


			ps.executeUpdate();
			ps.close();

			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;

	}
	

	// lấy reportInfo theo report_id mà chưa được review
	public static reportInfo getReportNotReviewedByReportID(int report_id) {

		reportInfo report = null;

		String select = "select * from reports where report_id = ? and report_reviewed = 0";

		try (Connection c = openConnection()) {

			PreparedStatement ps = c.prepareStatement(select);
			ps.setInt(1, report_id);

			
			
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				
				String report_reason = getReportReason(rs.getInt("report_reason_id"));
				
				report = new reportInfo(report_id, rs.getInt("song_id"), rs.getInt("user_id_request"), rs.getString("email_request"),
						rs.getInt("report_reason_id"), report_reason, rs.getString("report_reason_more"),
						rs.getInt("report_reviewed"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return report;

	}
	
	// update reprort từ chưa được review thành đã được review
	public static boolean setReportToReviewed (int report_id) {
		
		try (Connection c = openConnection()) {

			String update = "update reports "
					+ "set report_reviewed = 1 "
					+ "where report_id = ?";

			PreparedStatement ps = c.prepareStatement(update);
			ps.setInt(1, report_id);

			ps.executeUpdate();

			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	// lấy toàn bộ report chưa xử lý
	public static List<reportInfo> getListReportNotReviewed (int start, int count) {
		
		List<reportInfo> list = new ArrayList<>();
		
		String select = "select * from reports where report_reviewed = 0 limit ?, ?";
		reportInfo report = null;
		
		try (Connection c = openConnection()) {
			PreparedStatement ps = c.prepareStatement(select);
			ps.setInt(1, start);
			ps.setInt(2, count);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				report = getReportInfoByReportID(rs.getInt("report_id"));

				list.add(report);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
		
	}
	
	// lấy số lượng report chưa xử lý
	public static int getAmountReportNotReviewed() {

		int count = 0;

		String select = "select * from reports where report_reviewed = 0";


		try (Connection c = openConnection()) {
			PreparedStatement ps = c.prepareStatement(select);


			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				count++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return count;

	}
	
	// lấy danh sách bài hát các phiếu report chưa được xử lý về 1 bài hát theo song_id
	public static List<reportInfo> getListReportnotReviewedBySongID(int song_id) {

		List<reportInfo> list = new ArrayList<>();

		String select = "select * from reports where song_id = ? and report_reviewed = 0";

		try (Connection c = openConnection()) {
			PreparedStatement ps = c.prepareStatement(select);
			ps.setInt(1, song_id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				int report_id = rs.getInt("report_id");

				reportInfo report = getReportInfoByReportID(report_id);
						
				list.add(report);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}
	
	

}
