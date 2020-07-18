package dao;

import java.math.BigInteger;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;



import model.musicType;
import model.reportInfo;
import model.singerInfo;
import model.songInfo;

public class songDAO {
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
	public static songInfo getSongInfoByID(int song_id) {
		songInfo song = null;

		String select = "select * from songs where song_id = ?";
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

				song = new songInfo(rs.getInt("song_id"), rs.getString("song_name"), rs.getString("singer_id"),
						singer_nick_name_list, rs.getString("music_id"), music_type_name_list, rs.getInt("country_id"), country_name, rs.getString("song_path"),
						rs.getString("song_about"), rs.getString("song_lyrics"), rs.getString("song_img_path"), rs.getString("listen_count_sum"), rs.getString("listen_count_week"),
						rs.getInt("user_id_upload"), rs.getString("upload_date"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return song;
	}
	
	// lấy danh sách bài hát để hiện thị ra trang chủ theo mới nhất
	public static List<songInfo> getListSongByCountryID(int country_id, int start, int count) {

		List<songInfo> list = new ArrayList<>();

		String select = "select * from songs where country_id = ? ORDER BY song_id DESC limit ?, ?";
		songInfo song = null;

		try (Connection c = openConnection()) {
			PreparedStatement ps = c.prepareStatement(select);
			ps.setInt(1, country_id);
			ps.setInt(2, (start - 1));
			ps.setInt(3, count);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				song = getSongInfoByID(rs.getInt("song_id"));

				list.add(song);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	// lấy danh sách bài hát để hiện thị ra trang chủ theo listen_count_week giảm dần
	public static List<songInfo> getListSongByCountryIDOrderByListendCountWeekDESC(int country_id, int start, int count) {

		List<songInfo> list = new ArrayList<>();

		String select = "select * from songs where country_id = ? "
				+ " ORDER BY CAST(listen_count_week AS unsigned) DESC limit ?, ?";
		songInfo song = null;

		try (Connection c = openConnection()) {
			PreparedStatement ps = c.prepareStatement(select);
			ps.setInt(1, country_id);
			ps.setInt(2, (start - 1));
			ps.setInt(3, count);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				song = getSongInfoByID(rs.getInt("song_id"));

				list.add(song);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}
	
	// đếm xem có bao nhiêu bài hát trong csdl
	public static int getAmountOfSongs () {
		
		int count = 0;

		String select = "select * from songs";


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
	
	// lấy danh sách bài hát mới nhất theo music_id
	public static List<songInfo> getListSongByMusicType(int music_id, int start, int count) {

		List<songInfo> list = new ArrayList<>();

		String select = "select * from songs where music_id LIKE '%"
				+ String.valueOf(music_id)
				+ "%' ORDER BY song_id DESC limit ?, ?";
		songInfo song = null;

		try (Connection c = openConnection()) {
			PreparedStatement ps = c.prepareStatement(select);
			ps.setInt(1, start);
			ps.setInt(2, count);

			ResultSet rs = ps.executeQuery();

			// select những bài hát có chuỗi String music_id có chứa music_id
			// sau đó, với từng bài hát nhận được, sẽ kiểm tách music_id từ được gộp thành 
			// danh sách music_id mà bài hát đó có.
			// rồi lúc này kiểm tra xem có thật music_id có tồn tại trong bài hát hay k.
			
			// vì có thể music_id = 1, mà music_id_str = "2,11"
			// thì vẫn sẽ tìm thấy nhưng thực ra là không phải nên ta cần duyệt lại
			// việc select % thay vì select * để thu hệp tập kết quả cần xem xét.
			
			while (rs.next()) {
				
				String music_id_str = rs.getString("music_id");
				
				String[] music_id_str_arr = music_id_str.split(",");
				
				List<Integer> music_id_list = new ArrayList<>();
				
				for (String music_id_str_item : music_id_str_arr) {
					
					music_id_list.add(Integer.valueOf(music_id_str_item));
					
				}
				
				//System.out.println(music_id);
				//System.out.println(music_id_str);
				
				
				if(music_id_list.contains(music_id)) {
					song = getSongInfoByID(rs.getInt("song_id"));

					list.add(song);
				}

				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	// đếm số lượng bài hát có trong csdl theo music_id
	public static int getAmountOfSongsByMusicID(int music_id) {

		int count = 0;

		String select = "select * from songs where music_id LIKE '%" + String.valueOf(music_id) + "%'";

		try (Connection c = openConnection()) {
			PreparedStatement ps = c.prepareStatement(select);
			

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				String music_id_str = rs.getString("music_id");

				String[] music_id_str_arr = music_id_str.split(",");

				List<Integer> music_id_list = new ArrayList<>();

				for (String music_id_str_item : music_id_str_arr) {

					music_id_list.add(Integer.valueOf(music_id_str_item));

				}

				if (music_id_list.contains(music_id)) {
					count++;
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return count;
	}
	
	
	// lấy danh sách bài hát mới nhất theo singer_id
	public static List<songInfo> getListSongBySingerID(int singer_id, int start, int count) {

		List<songInfo> list = new ArrayList<>();

		String select = "select * from songs where singer_id LIKE '%" + String.valueOf(singer_id)
				+ "%' ORDER BY song_id DESC limit ?, ?";
		songInfo song = null;

		try (Connection c = openConnection()) {
			PreparedStatement ps = c.prepareStatement(select);
			ps.setInt(1, start);
			ps.setInt(2, count);

			ResultSet rs = ps.executeQuery();

			// select những bài hát có chuỗi String music_id có chứa singer_id
			// sau đó, với từng bài hát nhận được, sẽ kiểm tách music_id từ được gộp thành
			// danh sách singer_id mà bài hát đó có.
			// rồi lúc này kiểm tra xem có thật music_id có tồn tại trong bài hát hay k.

			// vì có thể singer_id = 1, mà singer_id_str = "2,11"
			// thì vẫn sẽ tìm thấy nhưng thực ra là không phải nên ta cần duyệt lại
			// việc select % thay vì select * để thu hệp tập kết quả cần xem xét.

			while (rs.next()) {

				String singer_id_str = rs.getString("singer_id");

				String[] singer_id_str_arr = singer_id_str.split(",");

				List<Integer> singer_id_list = new ArrayList<>();

				for (String singer_id_str_item : singer_id_str_arr) {

					singer_id_list.add(Integer.valueOf(singer_id_str_item));

				}

				// System.out.println(singer_id);
				// System.out.println(singer_id_str);

				if (singer_id_list.contains(singer_id)) {
					song = getSongInfoByID(rs.getInt("song_id"));

					list.add(song);
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	// đếm số lượng bài hát có trong csdl theo music_id
	public static int getAmountOfSongsBySingerID(int singer_id) {

		int count = 0;

		String select = "select * from songs where singer_id LIKE '%" + String.valueOf(singer_id) + "%'";

		try (Connection c = openConnection()) {
			PreparedStatement ps = c.prepareStatement(select);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				String singer_id_str = rs.getString("singer_id");

				String[] singer_id_str_arr = singer_id_str.split(",");

				List<Integer> singer_id_list = new ArrayList<>();

				for (String singer_id_str_item : singer_id_str_arr) {

					singer_id_list.add(Integer.valueOf(singer_id_str_item));

				}

				if (singer_id_list.contains(singer_id)) {
					count++;
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return count;
	}

	// lấy danh sách bài hát 1 người dùng đăng lên theo user_upload_id
	public static List<songInfo> getListSongByUserIDUpload(int user_upload_id) {

		List<songInfo> list = new ArrayList<>();

		String select = "select * from songs where user_id_upload = ?";

		try (Connection c = openConnection()) {
			PreparedStatement ps = c.prepareStatement(select);
			ps.setInt(1, user_upload_id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				
				int song_id = rs.getInt("song_id");
				
				
				songInfo song = getSongInfoByID(song_id);

				list.add(song);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}
	
	
	// Thêm bài hát vào danh sách chờ phê duyệt
	public static boolean addSongToQueue (songInfo song) {
		
		try (Connection c = openConnection()) {	
			
			String insert = "insert into song_queue values (null, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement ps = c.prepareStatement(insert);
			ps.setString(1, song.getSong_name());
			ps.setString(2, song.getSinger_id());
			ps.setString(3, song.getMusic_id());
			ps.setInt(4, song.getCountry_id());
			ps.setString(5, song.getSong_path());
			ps.setString(6, song.getSong_about());
			ps.setString(7, song.getSong_lyrics());
			ps.setString(8, song.getSong_img_path());
			ps.setString(9, song.getListen_count_sum());
			ps.setString(10, song.getListen_count_week());
			ps.setInt(11, song.getUser_id_upload());
			ps.setString(12, song.getUpload_date());
			
			ps.executeUpdate();
			ps.close();
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
		
	}
	
	
	// update thông tin bài hát
	public static boolean updateSongInfo(songInfo song, int song_id) {

		try (Connection c = openConnection()) {

			String update = "update songs "
					+ "set song_name = ?, singer_id = ?, music_id = ?, country_id = ?, song_about = ?, song_lyrics = ? "
					+ "where song_id = ?";

			PreparedStatement ps = c.prepareStatement(update);
			ps.setString(1, song.getSong_name());
			ps.setString(2, song.getSinger_id());
			ps.setString(3, song.getMusic_id());
			ps.setInt(4, song.getCountry_id());
			ps.setString(5, song.getSong_about());
			ps.setString(6, song.getSong_lyrics());
			ps.setInt(7, song_id);

			ps.executeUpdate();

			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;

	}
	
	// xóa bài hát
	// phải đặt những phiếu report về bài hát này thành đã được xử lý trước
	// sau đó mới xóa bài hát
	public static boolean deleteSong(int song_id) {
		
		// đặt toàn bộ report về 1 bài hát bị xóa thành đã được xem xét
		List<reportInfo> list = reportDAO.getListReportnotReviewedBySongID(song_id);

		for (int i = 0; i < list.size(); i++) {

			reportInfo report = list.get(i);

			boolean resultSetReportReviewed = reportDAO.setReportToReviewed(report.getReport_id());

			if (!resultSetReportReviewed) {
				return false;
			}
		}

		try (Connection c = openConnection()) {

			String update = "delete from songs where song_id = ?";

			PreparedStatement ps = c.prepareStatement(update);
			ps.setInt(1, song_id);

			ps.executeUpdate();

			return true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;

	}
	
	// kiểm tra xem song_id có tồn tại song
	public static boolean isSongIDExist (int song_id) {
		try (Connection c = openConnection()) {
			String select = "select * from songs where song_id = ?";
			PreparedStatement ps = c.prepareStatement(select);
			ps.setInt(1, song_id);
			
			return ps.executeQuery().next();		
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
	// tăng lượt nghe listen_count lên 1 đơn vị
	public static boolean increaseListenCount (int song_id) {
		
		songInfo song = getSongInfoByID(song_id);
		
		String listen_count_sum = song.getListen_count_sum();
		String listen_count_week = song.getListen_count_week();
		
		if(listen_count_sum == null || listen_count_sum.isEmpty()) {
			listen_count_sum = "0";
		}
		
		if(listen_count_week == null || listen_count_week.isEmpty()) {
			listen_count_week = "0";
		}
		
		
		BigInteger listen_count_sum_int = new BigInteger(listen_count_sum);
		BigInteger listen_count_week_int = new BigInteger(listen_count_week);
		
		BigInteger ONE = new BigInteger("1");
		
		listen_count_sum_int = listen_count_sum_int.add(ONE);
		listen_count_week_int = listen_count_week_int.add(ONE);
		
		//System.out.println("sau do : "+ String.valueOf(listen_count_int));
		
		try (Connection c = openConnection()) {

			String update = "update songs "
					+ "set listen_count_sum = ?, listen_count_week = ? "
					+ "where song_id = ?";

			PreparedStatement ps = c.prepareStatement(update);
			ps.setString(1, String.valueOf(listen_count_sum_int));
			ps.setString(2, String.valueOf(listen_count_week_int));
			ps.setInt(3, song_id);
			

			ps.executeUpdate();

			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
		
	}
	
	// Lấy danh sách bài hát theo thể loại, sắp xếp theo thứ tự listen_count_week giảm dần
	public static List<songInfo> getListSongByMusicTypeOrderListenCountWeekDESC(int music_id, int start, int count) {

		List<songInfo> list = new ArrayList<>();

		String select = "select * from songs where music_id LIKE '%"
				+ String.valueOf(music_id)
				+ "%' ORDER BY CAST(listen_count_week AS unsigned)  DESC limit ?, ?";
		songInfo song = null;

		try (Connection c = openConnection()) {
			PreparedStatement ps = c.prepareStatement(select);
			ps.setInt(1, start);
			ps.setInt(2, count);

			ResultSet rs = ps.executeQuery();

			// select những bài hát có chuỗi String music_id có chứa music_id
			// sau đó, với từng bài hát nhận được, sẽ kiểm tách music_id từ được gộp thành 
			// danh sách music_id mà bài hát đó có.
			// rồi lúc này kiểm tra xem có thật music_id có tồn tại trong bài hát hay k.
			
			// vì có thể music_id = 1, mà music_id_str = "2,11"
			// thì vẫn sẽ tìm thấy nhưng thực ra là không phải nên ta cần duyệt lại
			// việc select % thay vì select * để thu hệp tập kết quả cần xem xét.
			
			while (rs.next()) {
				
				String music_id_str = rs.getString("music_id");
				
				String[] music_id_str_arr = music_id_str.split(",");
				
				List<Integer> music_id_list = new ArrayList<>();
				
				for (String music_id_str_item : music_id_str_arr) {
					
					music_id_list.add(Integer.valueOf(music_id_str_item));
					
				}
				
				//System.out.println(music_id);
				//System.out.println(music_id_str);
				
				
				if(music_id_list.contains(music_id)) {
					song = getSongInfoByID(rs.getInt("song_id"));

					list.add(song);
				}

				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	
	// Lấy danh sách bài hát theo ca sĩ, sắp xếp theo thứ tự listen_count_week giảm dần
	public static List<songInfo> getListSongBySingerIDOrderListenCountWeekDESC(int singer_id, int start, int count) {

		List<songInfo> list = new ArrayList<>();

		String select = "select * from songs where singer_id LIKE '%" + String.valueOf(singer_id)
				+ "%' ORDER BY CAST(listen_count_week AS unsigned)  DESC limit ?, ?";
		songInfo song = null;

		try (Connection c = openConnection()) {
			PreparedStatement ps = c.prepareStatement(select);
			ps.setInt(1, start);
			ps.setInt(2, count);

			ResultSet rs = ps.executeQuery();

			// select những bài hát có chuỗi String singer_id có chứa music_id
			// sau đó, với từng bài hát nhận được, sẽ kiểm tách singer_id từ được gộp thành
			// danh sách singer_id mà bài hát đó có.
			// rồi lúc này kiểm tra xem có thật singer_id có tồn tại trong bài hát hay k.

			// vì có thể singer_id = 1, mà singer_id_str = "2,11"
			// thì vẫn sẽ tìm thấy nhưng thực ra là không phải nên ta cần duyệt lại
			// việc select % thay vì select * để thu hệp tập kết quả cần xem xét.

			while (rs.next()) {

				String singer_id_str = rs.getString("singer_id");

				String[] singer_id_str_arr = singer_id_str.split(",");

				List<Integer> singer_id_list = new ArrayList<>();

				for (String singer_id_str_item : singer_id_str_arr) {

					singer_id_list.add(Integer.valueOf(singer_id_str_item));

				}

				 //System.out.println(singer_id);
				 //System.out.println(singer_id_str);

				if (singer_id_list.contains(singer_id)) {
					
					//System.out.println("true");
					song = getSongInfoByID(rs.getInt("song_id"));

					list.add(song);
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}
	
	// Tìm kiếm danh sách bài hát theo tên
	public static List<songInfo> searchSongName (String s, int start, int count) {
		
		List<songInfo> list = new ArrayList<>();
		


		String select = "select * from songs where song_name like '%" + s.trim() + "%' limit ?, ?";
		songInfo song = null;

		try (Connection c = openConnection()) {
			PreparedStatement ps = c.prepareStatement(select);
			ps.setInt(1, start);
			ps.setInt(2, count);

			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				
				song = getSongInfoByID(rs.getInt("song_id"));
				
				list.add(song);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;

		
	}
	
	//đếm số lượng bài hát có tên theo chuỗi tìm kiếm
	public static int getAmountSearchSongName(String s) {

		int count = 0;
		
		

		String select = "select * from songs where song_name like '%" + s.trim() + "%'";

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
	
	
	// Tìm kiếm danh sách bài hát theo tên bài hát và user_id_upload
	public static List<songInfo> searchSongBySongNameAndUserIDUpload(int user_id_upload, String s) {

		List<songInfo> list = new ArrayList<>();

		String select = "select * from songs where user_id_upload = ? and song_name like '%" + s.trim() + "%'";
		songInfo song = null;

		try (Connection c = openConnection()) {
			PreparedStatement ps = c.prepareStatement(select);
			ps.setInt(1, user_id_upload);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				song = getSongInfoByID(rs.getInt("song_id"));

				list.add(song);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}
	
	
	
	
	
	
	
	
	
}
