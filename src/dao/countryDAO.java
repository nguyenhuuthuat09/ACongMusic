package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.singerInfo;

public class countryDAO {
	
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
	
	// lấy tên quốc gia theo id
	public static String getCountryName (int country_id) {
		String country_name = null;

		String select = "select * from countries where country_id = ?";

		try (Connection c = openConnection()) {

			PreparedStatement ps = c.prepareStatement(select);
			ps.setInt(1, country_id);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				country_name = rs.getString("country_name");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return country_name;
		
		
	}

}
