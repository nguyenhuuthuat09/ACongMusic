package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.musicType;
import model.singerInfo;
import model.songInfo;
import model.songQueueInfo;

public class songQueueDAO {
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

	// lấy thông tin bài hát theo id
	public static songQueueInfo getSongQueueInfoByID(int song_id) {
		songQueueInfo song = null;

		String select = "select * from song_queue where song_id = ?";
		try (Connection c = openConnection()) {
			PreparedStatement ps = c.prepareStatement(select);
			ps.setInt(1, song_id);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				// lấy singer nick name theo id
				String singer_id = rs.getString("singer_id");

				String[] singer_id_list = singer_id.split(",");

				List<String> singer_nick_name_list = new ArrayList<>();

				for (String singer_id_item : singer_id_list) {

					singerInfo singer = singerDAO.getSingerInfoBySingerID(Integer.valueOf(singer_id_item));

					String singer_nick_name = singer.getSinger_nick_name();

					singer_nick_name_list.add(singer_nick_name);
				}

				// lấy music type name theo id
				String music_id = rs.getString("music_id");

				String[] music_id_list = music_id.split(",");

				List<String> music_type_name_list = new ArrayList<>();

				for (String music_id_item : music_id_list) {

					musicType music_type = musicTypeDAO.getMusicInfoByID(Integer.valueOf(music_id_item));

					String music_type_name = music_type.getMusic_type_name();

					music_type_name_list.add(music_type_name);
				}

				String country_name = countryDAO.getCountryName(rs.getInt("country_id"));

				song = new songQueueInfo(rs.getInt("song_id"), rs.getString("song_name"), rs.getString("singer_id"),
						singer_nick_name_list, rs.getString("music_id"), music_type_name_list, rs.getInt("country_id"),
						country_name, rs.getString("song_path"), rs.getString("song_about"),
						rs.getString("song_lyrics"), rs.getString("song_img_path"), rs.getString("listen_count_sum"),
						rs.getString("listen_count_week"), rs.getInt("user_id_upload"), rs.getString("upload_date"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return song;
	}
	
	// lấy danh sách bài hát đang chờ phê duyệt của 1 người dùng theo user_upload_id
	public static List<songQueueInfo> getListSongQueueByUserIDUpload(int user_upload_id) {

		List<songQueueInfo> list = new ArrayList<>();

		String select = "select * from song_queue where user_id_upload = ?";

		try (Connection c = openConnection()) {
			PreparedStatement ps = c.prepareStatement(select);
			ps.setInt(1, user_upload_id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				int song_id = rs.getInt("song_id");

				songQueueInfo song = getSongQueueInfoByID(song_id);

				list.add(song);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	// lấy danh sách bài hát cần phê duyệt
	public static List<songQueueInfo> getListSongQueue(int start, int count) {

		List<songQueueInfo> list = new ArrayList<>();

		String select = "select * from song_queue limit ?, ?";
		songQueueInfo song = null;

		try (Connection c = openConnection()) {
			PreparedStatement ps = c.prepareStatement(select);
			ps.setInt(1, start);
			ps.setInt(2, count);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				song = getSongQueueInfoByID(rs.getInt("song_id"));

				list.add(song);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	// lấy số lượng bài hát cần phê duyệt
	public static int getAmountSongQueue() {

		int count = 0;

		String select = "select * from song_queue";

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

	// xóa bài hát
	public static boolean deleteSongQueue(int song_id) {

		try (Connection c = openConnection()) {

			String update = "delete from song_queue where song_id = ?";

			PreparedStatement ps = c.prepareStatement(update);
			ps.setInt(1, song_id);

			ps.executeUpdate();

			return true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;

	}

	// Phê duyệt bài hát
	// chuyển sang bảng songs và xóa ở bảng song_queue đi vì đã phê duyệt rồi
	public static boolean acceptSong(songQueueInfo song) {

		try (Connection c = openConnection()) {

			String insert = "insert into songs values (null, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

			PreparedStatement ps = c.prepareStatement(insert);
			ps.setString(1, song.getSong_name());
			ps.setString(2, song.getSinger_id());
			ps.setString(3, song.getMusic_id());
			ps.setInt(4, song.getCountry_id());
			ps.setString(5, song.getSong_path());
			ps.setString(6, song.getSong_about());
			ps.setString(7, song.getSong_lyrics());
			ps.setString(8, song.getSong_img_path());
			ps.setString(9, "0");
			ps.setString(10, "0");
			ps.setInt(11, song.getUser_id_upload());
			ps.setString(12, song.getUpload_date());

			ps.executeUpdate();
			ps.close();
			
			boolean resultDeleteAfterAccept = deleteSongQueue(song.getSong_id());
			
			if(resultDeleteAfterAccept) {
				return true;
			}
			else {
				return false;
			}

			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;

	}

}
