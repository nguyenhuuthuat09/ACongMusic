package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import JBcrypt.BCrypt;
import model.userProfile;
import model.singerInfo;
import model.songInfo;
import model.songQueueInfo;

public class userDAO {
	
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
	
	// kiem tra xem username co ton tai trong csdl chua
	public static boolean isUsernameExist (String username) {
		try (Connection c = openConnection()) {
			String select = "select user_id from users where username = ?";
			PreparedStatement ps = c.prepareStatement(select);
			ps.setString(1, username);
			
			return ps.executeQuery().next();		
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
	// kiem tra xem email co ton tai trong csdl chua
	public static boolean isEmailExist (String email) {
		try (Connection c = openConnection()) {
			String select = "select user_id from users where email = ?";
			PreparedStatement ps = c.prepareStatement(select);
			ps.setString(1, email);
			
			return ps.executeQuery().next();		
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
	// them nguoi dung moi
	public static boolean addNewUser(userProfile profile) {
		try (Connection c = openConnection()) {	
			java.util.Date date =new java.util.Date();
			java.sql.Date currentDate = new java.sql.Date(date.getTime());
			
			String user_ava_default_path = "avatar-user-default.png";
			
			String insert = "insert into users values (null, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement ps = c.prepareStatement(insert);
			ps.setString(1, profile.getUsername());
			ps.setString(2, profile.getEmail());
			ps.setString(3, profile.getPassword());
			ps.setString(4, profile.getDateOfBirth());
			ps.setString(5, profile.getMonthOfBirth());
			ps.setString(6, profile.getYearOfBirth());
			ps.setString(7, profile.getSex());
			ps.setDate(8, currentDate);
			ps.setString(9, user_ava_default_path);
			
			ps.executeUpdate();
			ps.close();
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;	
	}
	
	// kiem tra thong tin dang nhap bang username, password
	public static userProfile getProfileUsername(String username, String password) {
		userProfile profile = null;
		
		String select = "select * from users where username = ?";
		
		try (Connection c = openConnection()) {

			PreparedStatement ps = c.prepareStatement(select);
			ps.setString(1, username);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				
				// kiểm tra xem password nhập vào có trùng password đã mã hóa trong csdl hay không
				BCrypt bcrypt = new BCrypt();

				boolean checkPassword = bcrypt.checkpw(password, rs.getString("password"));
				
				if(checkPassword) {
					profile = new userProfile(rs.getInt("user_id") ,rs.getString("username"), rs.getString("email"), rs.getString("password"),
							rs.getString("dateOfBirth"), rs.getString("monthOfBirth"), rs.getString("yearOfBirth"),
							rs.getString("sex"), rs.getString("user_img_path"));
				}
				
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return profile;
	}
	
	public static userProfile checkLoginUsername(String username, String password) {
        return getProfileUsername(username, password);
    }
	
	// kiem tra thong tin dang nhap bang email, password
	public static userProfile getProfileEmail(String email, String password) {
		userProfile profile = null;
		
		String select = "select * from users where email = ?";
		
		try (Connection c = openConnection()) {

			PreparedStatement ps = c.prepareStatement(select);
			ps.setString(1, email);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				
				// kiểm tra xem password nhập vào có trùng password đã mã hóa trong csdl hay không
				BCrypt bcrypt = new BCrypt();

				boolean checkPassword = bcrypt.checkpw(password, rs.getString("password"));
				
				if(checkPassword) {
					profile = new userProfile(rs.getInt("user_id"), rs.getString("username"), rs.getString("email"), rs.getString("password"),
							rs.getString("dateOfBirth"), rs.getString("monthOfBirth"), rs.getString("yearOfBirth"),
							rs.getString("sex"), rs.getString("user_img_path"));
				}
				
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return profile;
	}
	
	public static userProfile checkLoginEmail (String email, String password) {
        return getProfileEmail(email, password);
    }
	
	// update thong tin nguoi dung
	public static boolean updateUserProfile(userProfile profile, String username) {
		
		try (Connection c = openConnection()) {
			
			String update = "update users "
					+ "set email = ?, dateOfBirth = ?, monthOfBirth = ?, yearOfBirth = ?, sex = ? "
					+ "where username = ?";
			
			PreparedStatement ps = c.prepareStatement(update);
			ps.setString(1, profile.getEmail());
			ps.setString(2, profile.getDateOfBirth());
			ps.setString(3, profile.getMonthOfBirth());
			ps.setString(4, profile.getYearOfBirth());
			ps.setString(5, profile.getSex());
			ps.setString(6, username);
			
			ps.executeUpdate();
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	// update user avatar
	public static boolean updateUserAvatar(int user_id, String imageName) {

		try (Connection c = openConnection()) {

			String update = "update users "
					+ "set user_img_path = ? where user_id = ?";

			PreparedStatement ps = c.prepareStatement(update);
			ps.setString(1, imageName);
			ps.setInt(2, user_id);

			ps.executeUpdate();
			
			return true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	// update user password
	public static boolean updatePassword(String username, String newPassword) {

		try (Connection c = openConnection()) {

			String update = "update users "
					+ "set password = ? where username = ?";

			PreparedStatement ps = c.prepareStatement(update);
			ps.setString(1, newPassword);
			ps.setString(2, username);

			ps.executeUpdate();
			
			return true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	// xóa tài khoản người dùng
	// nếu xóa tài khoản người dùng thì cần xóa toàn bộ bài hát mà người dùng này đăng lên.
	// bao gồm cả các bài hát đã được chấp thuận và các bài hát đang cần phê duyệt
	public static boolean deleteUserAccount(int user_id) {
		
		// xóa toàn bộ bài hát đã được phê duyệt của người dùng
		List<songInfo> list = songDAO.getListSongByUserIDUpload(user_id);
		
		for(int i = 0; i < list.size(); i++) {
			
			songInfo song = list.get(i);
			
			boolean resultDeleteSong = songDAO.deleteSong(song.getSong_id());
			
			if(!resultDeleteSong) {
				return false;
			}
		}
		
		// xóa toàn bộ bài hát đang chờ phê duyệt của người dùng
		List<songQueueInfo> listQueue = songQueueDAO.getListSongQueueByUserIDUpload(user_id);

		for (int i = 0; i < listQueue.size(); i++) {

			songQueueInfo songQueue = listQueue.get(i);

			boolean resultDeleteSongQueue = songQueueDAO.deleteSongQueue(songQueue.getSong_id());

			if (!resultDeleteSongQueue) {
				return false;
			}
		}

		
		// xóa user người dùng
		try (Connection c = openConnection()) {

			String update = "delete from users where user_id = ?";

			PreparedStatement ps = c.prepareStatement(update);
			ps.setInt(1, user_id);

			ps.executeUpdate();
			
			return true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	// lấy profile người dùng theo user_id
	
	public static userProfile getUserProfileByID (int user_id) {
		
		userProfile profile = null;
		
		try (Connection c = openConnection()) {

			String select = "select * from users where user_id = ?";
			
			PreparedStatement ps = c.prepareStatement(select);		
			ps.setInt(1, user_id);
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				
				profile = new userProfile(rs.getInt("user_id"), rs.getString("username"), rs.getString("email"), rs.getString("password"),
						rs.getString("dateOfBirth"), rs.getString("monthOfBirth"), rs.getString("yearOfBirth"),
						rs.getString("sex"), rs.getString("user_img_path"));
			}
			
			return profile;

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return profile;
		
	}
	
	// lấy userProfile theo username
	public static userProfile getUserProfileByUsername(String username) {

		userProfile profile = null;

		try (Connection c = openConnection()) {

			String select = "select * from users where username = ?";

			PreparedStatement ps = c.prepareStatement(select);
			ps.setString(1, username);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				profile = new userProfile(rs.getInt("user_id"), rs.getString("username"), rs.getString("email"),
						rs.getString("password"), rs.getString("dateOfBirth"), rs.getString("monthOfBirth"),
						rs.getString("yearOfBirth"), rs.getString("sex"), rs.getString("user_img_path"));
			}

			return profile;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return profile;

	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
