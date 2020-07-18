package util;

import java.text.Normalizer;
import java.util.regex.Pattern;

public class stringUlti {
	
	// hàm này dùng để chuẩn hóa tên file upload lên
	// chuyển file name từ tiếng việt, có dấu cách thành tên không dấu nối bởi -
	// thêm thời gian hiện tại vào cuối tên file để tránh tên file giống nhau.
	// Vì thời gian hiện tại luôn khác nên không lo trùng tên.
	public static String standardizeFileAudioName (String filename, String username) {	
		try {
			String temp = Normalizer.normalize(filename, Normalizer.Form.NFD);
			Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
			String temp2 = pattern.matcher(temp).replaceAll("").toLowerCase().replaceAll(" ", "-").replaceAll("đ", "d");
			System.out.println(temp2);
			String[] arr =  temp2.split("\\.");
			
			String tenFile = arr[0];
			String duoiFile = arr[1];
			
			String nameFile = "acongmusic-audio-" + username + "-" +System.nanoTime() + "." + duoiFile;
			return nameFile;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static String standardizeFileImageName (String filename, String username) {	
		try {
			String temp = Normalizer.normalize(filename, Normalizer.Form.NFD);
			Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
			String temp2 = pattern.matcher(temp).replaceAll("").toLowerCase().replaceAll(" ", "-").replaceAll("đ", "d");
			System.out.println(temp2);
			String[] arr =  temp2.split("\\.");
			
			String tenFile = arr[0];
			String duoiFile = arr[1];
			
			String nameFile = "acongmusic-image-" + username + "-" +System.nanoTime() + "." + duoiFile;
			return nameFile;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
}
