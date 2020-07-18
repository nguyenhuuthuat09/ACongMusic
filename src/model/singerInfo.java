package model;

public class singerInfo {
	private int singer_id;
	private String singer_nick_name;
	private String singer_name;
	private String dateOfBirth;
	private String monthOfBirth;
	private String yearOfBirth;
	private String sex;
	private String singer_hometown;
	private String singer_story;
	private String singer_img_path;
	
	public singerInfo(int singer_id, String singer_nick_name, String singer_name, String dateOfBirth,
			String monthOfBirth, String yearOfBirth, String sex, String singer_hometown, String singer_story,
			String singer_img_path) {
		super();
		this.singer_id = singer_id;
		this.singer_nick_name = singer_nick_name;
		this.singer_name = singer_name;
		this.dateOfBirth = dateOfBirth;
		this.monthOfBirth = monthOfBirth;
		this.yearOfBirth = yearOfBirth;
		this.sex = sex;
		this.singer_hometown = singer_hometown;
		this.singer_story = singer_story;
		this.singer_img_path = singer_img_path;
	}
	
	
	public int getSinger_id() {
		return singer_id;
	}
	
	public void setSinger_id(int singer_id) {
		this.singer_id = singer_id;
	}
	
	public String getSinger_nick_name() {
		return singer_nick_name;
	}
	
	public void setSinger_nick_name(String singer_nick_name) {
		this.singer_nick_name = singer_nick_name;
	}
	
	public String getSinger_name() {
		return singer_name;
	}
	
	public void setSinger_name(String singer_name) {
		this.singer_name = singer_name;
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
	
	public String getSinger_hometown() {
		return singer_hometown;
	}
	
	public void setSinger_hometown(String singer_hometown) {
		this.singer_hometown = singer_hometown;
	}
	
	public String getSinger_story() {
		return singer_story;
	}
	
	public void setSinger_story(String singer_story) {
		this.singer_story = singer_story;
	}
	
	public String getSinger_img_path() {
		return singer_img_path;
	}
	
	public void setSinger_img_path(String singer_img_path) {
		this.singer_img_path = singer_img_path;
	}
	

}
