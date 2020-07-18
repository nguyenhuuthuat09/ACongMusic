package dao;

import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.singerInfo;
import model.songInfo;

public class singerDAO {

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

	// lấy singer info theo singer_id
	public static singerInfo getSingerInfoBySingerID(int singer_id) {

		singerInfo singer = null;

		String select = "select * from singers where singer_id = ?";

		try (Connection c = openConnection()) {

			PreparedStatement ps = c.prepareStatement(select);
			ps.setInt(1, singer_id);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				singer = new singerInfo(singer_id, rs.getString("singer_nick_name"), rs.getString("singer_name"),
						rs.getString("dateOfBirth"), rs.getString("monthOfBirth"), rs.getString("yearOfBirth"),
						rs.getString("sex"), rs.getString("singer_hometown"), rs.getString("singer_story"),
						rs.getString("singer_img_path"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return singer;

	}
	
	// kiểm tra xem singer_id có tồn tại không
	public static boolean isSingerIDExist (int singer_id) {
		try (Connection c = openConnection()) {
			String select = "select * from singers where singer_id = ?";
			PreparedStatement ps = c.prepareStatement(select);
			ps.setInt(1, singer_id);
			
			return ps.executeQuery().next();		
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
		
	}
	
	
	// lấy danh sách singer để hiện thi ra ở trang nghệ sĩ
	public static List<singerInfo> getListSingerOffsetCount (int start, int count) {
		
		List<singerInfo> list = new ArrayList<>();
		singerInfo singer = null;

		String select = "select * from singers limit ?, ?";
		

		try (Connection c = openConnection()) {
			PreparedStatement ps = c.prepareStatement(select);
			ps.setInt(1, start);
			ps.setInt(2, count);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				singer = getSingerInfoBySingerID(rs.getInt("singer_id"));

				list.add(singer);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	// đếm số lượng nghệ sĩ có trong csdl
	public static int getAmountOfSingers() {

		int count = 0;

		String select = "select * from singers";

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
	
	// Tìm kiếm danh sách ca sĩ theo tên
	public static List<singerInfo> searchSingerName(String s, int start, int count) {

		List<singerInfo> list = new ArrayList<>();
		

		String select = "select * from singers where singer_nick_name like '%" + s + "%' "
				+ " or singer_name like '%" + s.trim() + "%' "
				+ " limit ?, ?";
		singerInfo singer = null;

		try (Connection c = openConnection()) {
			PreparedStatement ps = c.prepareStatement(select);
			ps.setInt(1, start);
			ps.setInt(2, count);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				singer = getSingerInfoBySingerID(rs.getInt("singer_id"));

				list.add(singer);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}
	
	// số lượng danh sách ca sĩ theo tên
	public static int getAmountSearchSingerName(String s) {

		int count = 0;
		


		String select = "select * from singers where singer_nick_name like '%" + s + "%' "
				+ " or singer_name like '%" + s.trim() + "%' ";
		
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
	
	
	
	
	
	
	

}
