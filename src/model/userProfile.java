package model;

public class userProfile {
	private int user_id;
	private String username;
	private String email;
	private String password;
	private String dateOfBirth;
	private String monthOfBirth;
	private String yearOfBirth;
	private String sex;
	private String user_img_path;
	
	
	public userProfile(int user_id, String username, String email, String password, String dateOfBirth,
			String monthOfBirth, String yearOfBirth, String sex, String user_img_path) {
		super();
		this.user_id = user_id;
		this.username = username;
		this.email = email;
		this.password = password;
		this.dateOfBirth = dateOfBirth;
		this.monthOfBirth = monthOfBirth;
		this.yearOfBirth = yearOfBirth;
		this.sex = sex;
		this.user_img_path = user_img_path;
	}


	public int getUser_id() {
		return user_id;
	}


	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getDateOfBirth() {
		return dateOfBirth;
	}


	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}


	public String getMonthOfBirth() {
		return monthOfBirth;
	}


	public void setMonthOfBirth(String monthOfBirth) {
		this.monthOfBirth = monthOfBirth;
	}


	public String getYearOfBirth() {
		return yearOfBirth;
	}


	public void setYearOfBirth(String yearOfBirth) {
		this.yearOfBirth = yearOfBirth;
	}


	public String getSex() {
		return sex;
	}


	public void setSex(String sex) {
		this.sex = sex;
	}


	public String getUser_img_path() {
		return user_img_path;
	}


	public void setUser_img_path(String user_img_path) {
		this.user_img_path = user_img_path;
	}
	
	
	
	
	
	

}
