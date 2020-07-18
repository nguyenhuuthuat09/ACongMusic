package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.musicType;
import model.singerInfo;

public class musicTypeDAO {

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

	// lấy music info theo music_id
	public static musicType getMusicInfoByID(int music_id) {

		musicType music_type = null;

		String select = "select * from music_type where music_id = ?";

		try (Connection c = openConnection()) {

			PreparedStatement ps = c.prepareStatement(select);
			ps.setInt(1, music_id);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				music_type = new musicType(music_id, rs.getInt("country_id"), rs.getString("music_type_name"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return music_type;

	}
	
	// kiểm tra xem singer_id có tồn tại không
	public static boolean isMusicIDExist(int music_id) {
		try (Connection c = openConnection()) {
			String select = "select * from music_type where music_id = ?";
			PreparedStatement ps = c.prepareStatement(select);
			ps.setInt(1, music_id);

			return ps.executeQuery().next();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;

	}

}
