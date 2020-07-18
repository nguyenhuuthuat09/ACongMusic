package util;

import java.util.Calendar;

public class validateInput {
	public static boolean checkUsername(String username) {
		return username.matches("[a-zA-Z0-9\\\\._\\\\-]{3,20}");
	}

	public static boolean checkDateOfBirth(String dateOfBirth) {

		try {
			int temp = Integer.parseInt(dateOfBirth);
			if (temp < 1 || temp > 31) {
				return false;
			}
			return true;
		} catch (NumberFormatException e) {
			return false;
		}
	}

	public static boolean checkMonthOfBirth(String monthOfBirth) {

		try {
			int temp = Integer.parseInt(monthOfBirth);
			if (temp < 1 || temp > 12) {
				return false;
			}
			return true;
		} catch (NumberFormatException e) {
			return false;
		}
	}

	public static boolean checkYearOfBirth(String yearOfBirth) {

		try {
			int temp = Integer.parseInt(yearOfBirth);
			int year = Calendar.getInstance().get(Calendar.YEAR);
			if (temp < 1950 || temp > year) {
				return false;
			}
			return true;
		} catch (NumberFormatException e) {
			return false;
		}
	}

	// a-z, A-Z, 0-9
	public static boolean checkPassword(String password) {
		return password.matches("\\w{6,20}");
	}

	public static boolean checkReEnterPassword(String password, String reEnterPassword) {
		if (password.equals(reEnterPassword)) {
			return true;
		}
		return false;
	}

	public static boolean isInteger(String s) {
		return s.matches("-?\\d+");
	}

	// kiểm tra music type có phù hợp không
	public static boolean validateMusictype(String[] music_id_list) {

		// việt nam
		if (Integer.valueOf(music_id_list[0]) >= 1 && Integer.valueOf(music_id_list[0]) <= 5) {
			for (String music_id_item : music_id_list) {

				if (Integer.valueOf(music_id_item) > 5) {
					return false;
				}
			}
			return true;
		} 
		else if (Integer.valueOf(music_id_list[0]) >= 6 && Integer.valueOf(music_id_list[0]) <= 9) {
			
			for (String music_id_item : music_id_list) {

				if (Integer.valueOf(music_id_item) < 6 || Integer.valueOf(music_id_item) > 9) {
					return false;
				}
			}
			return true;
		}
		else {

			if(music_id_list.length > 1) {
				return false;
			}
			return true;
		}

	}

}
