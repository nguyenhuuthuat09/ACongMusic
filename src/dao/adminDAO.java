package dao;

import java.sql.*;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.Executor;

import JBcrypt.BCrypt;
import model.adminProfile;
import model.userProfile;

public class adminDAO {
	
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
	
	// kiem tra xem email co ton tai trong csdl chua
	public static boolean isEmailExist(String email) {
		try (Connection c = openConnection()) {
			String select = "select admin_id from admins where email = ?";
			PreparedStatement ps = c.prepareStatement(select);
			ps.setString(1, email);

			return ps.executeQuery().next();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
	// kiem tra thong tin dang nhap admin voi adminName
	public static adminProfile getProfileAdmin(String adminName, String password) {
		adminProfile profile = null;

		String select = "select * from admins where adminName = ?";

		try (Connection c = openConnection()) {

			PreparedStatement ps = c.prepareStatement(select);
			ps.setString(1, adminName);	
			
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				
				// kiểm tra xem password nhập vào có trùng password đã mã hóa trong csdl hay không
				BCrypt bcrypt = new BCrypt();

				boolean checkPassword = bcrypt.checkpw(password, rs.getString("password"));
				
				if(checkPassword) {
					profile = new adminProfile(rs.getString("adminName"), rs.getString("email"), rs.getString("password"),
							rs.getString("dateOfBirth"), rs.getString("monthOfBirth"), rs.getString("yearOfBirth"),
							rs.getString("sex"));
				}
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return profile;
	}

	public static adminProfile checkLoginAdminName(String adminName, String password) {
		return getProfileAdmin(adminName, password);
	}

	// kiem tra thong tin dang nhap admin voi email
	public static adminProfile getProfileEmail(String email, String password) {
		adminProfile profile = null;

		String select = "select * from admins where email = ?";

		try (Connection c = openConnection()) {

			PreparedStatement ps = c.prepareStatement(select);
			ps.setString(1, email);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				
				// kiểm tra xem password nhập vào có trùng password đã mã hóa trong csdl hay không
				BCrypt bcrypt = new BCrypt();

				boolean checkPassword = bcrypt.checkpw(password, rs.getString("password"));
				
				if(checkPassword) {
					
					profile = new adminProfile(rs.getString("adminName"), rs.getString("email"), rs.getString("password"),
							rs.getString("dateOfBirth"), rs.getString("monthOfBirth"), rs.getString("yearOfBirth"),
							rs.getString("sex"));
					
				}
				
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return profile;
	}

	public static adminProfile checkLoginEmail(String email, String password) {
		return getProfileEmail(email, password);
	}
	
	// update thong tin admin
	public static boolean updateAdminProfile(adminProfile profile, String adminName) {

		try (Connection c = openConnection()) {

			String update = "update admins "
					+ "set email = ?, dateOfBirth = ?, monthOfBirth = ?, yearOfBirth = ?, sex = ? "
					+ "where adminName = ?";

			PreparedStatement ps = c.prepareStatement(update);
			ps.setString(1, profile.getEmail());
			ps.setString(2, profile.getDateOfBirth());
			ps.setString(3, profile.getMonthOfBirth());
			ps.setString(4, profile.getYearOfBirth());
			ps.setString(5, profile.getSex());
			ps.setString(6, adminName);

			ps.executeUpdate();

			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	// lay avatar admin
	public static String getAdminAvatarPath(String adminName) {

		try (Connection c = openConnection()) {

			String select = "select admin_img_path from admins where adminName = ?";

			PreparedStatement ps = c.prepareStatement(select);
			ps.setString(1, adminName);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				return rs.getString("admin_img_path");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	// update admin avatar
	public static boolean updateAdminAvatar(String adminName, String imageName) {

		try (Connection c = openConnection()) {

			String update = "update admins " + "set admin_img_path = ? where adminName = ?";

			PreparedStatement ps = c.prepareStatement(update);
			ps.setString(1, imageName);
			ps.setString(2, adminName);

			ps.executeUpdate();

			return true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	// update user password
	public static boolean updatePassword(String adminName, String newPassword) {

		try (Connection c = openConnection()) {

			String update = "update admins " + "set password = ? where adminName = ?";

			PreparedStatement ps = c.prepareStatement(update);
			ps.setString(1, newPassword);
			ps.setString(2, adminName);

			ps.executeUpdate();

			return true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	
	
	
	
}
