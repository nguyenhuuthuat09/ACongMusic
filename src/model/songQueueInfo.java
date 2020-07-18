package model;

import java.util.List;

public class songQueueInfo {
	private int song_id;
	private String song_name;
	private String singer_id;
	private List<String> singer_nick_name;
	private String music_id;
	private List<String> music_type_name;
	private int country_id;
	private String country_name;
	private String song_path;
	private String song_about;
	private String song_lyrics;
	private String song_img_path;
	private String listen_count_sum;
	private String listen_count_week;
	private int user_id_upload;
	private String upload_date;
	
	
	public songQueueInfo(int song_id, String song_name, String singer_id, List<String> singer_nick_name, String music_id,
			List<String> music_type_name, int country_id, String country_name, String song_path, String song_about,
			String song_lyrics, String song_img_path, String listen_count_sum, String listen_count_week,
			int user_id_upload, String upload_date) {
		super();
		this.song_id = song_id;
		this.song_name = song_name;
		this.singer_id = singer_id;
		this.singer_nick_name = singer_nick_name;
		this.music_id = music_id;
		this.music_type_name = music_type_name;
		this.country_id = country_id;
		this.country_name = country_name;
		this.song_path = song_path;
		this.song_about = song_about;
		this.song_lyrics = song_lyrics;
		this.song_img_path = song_img_path;
		this.listen_count_sum = listen_count_sum;
		this.listen_count_week = listen_count_week;
		this.user_id_upload = user_id_upload;
		this.upload_date = upload_date;
	}
	
	
	
	public int getSong_id() {
		return song_id;
	}
	public void setSong_id(int song_id) {
		this.song_id = song_id;
	}
	public String getSong_name() {
		return song_name;
	}
	public void setSong_name(String song_name) {
		this.song_name = song_name;
	}
	public String getSinger_id() {
		return singer_id;
	}
	public void setSinger_id(String singer_id) {
		this.singer_id = singer_id;
	}
	public List<String> getSinger_nick_name() {
		return singer_nick_name;
	}
	public void setSinger_nick_name(List<String> singer_nick_name) {
		this.singer_nick_name = singer_nick_name;
	}
	public String getMusic_id() {
		return music_id;
	}
	public void setMusic_id(String music_id) {
		this.music_id = music_id;
	}
	public List<String> getMusic_type_name() {
		return music_type_name;
	}
	public void setMusic_type_name(List<String> music_type_name) {
		this.music_type_name = music_type_name;
	}
	public int getCountry_id() {
		return country_id;
	}
	public void setCountry_id(int country_id) {
		this.country_id = country_id;
	}
	public String getCountry_name() {
		return country_name;
	}
	public void setCountry_name(String country_name) {
		this.country_name = country_name;
	}
	public String getSong_path() {
		return song_path;
	}
	public void setSong_path(String song_path) {
		this.song_path = song_path;
	}
	public String getSong_about() {
		return song_about;
	}
	public void setSong_about(String song_about) {
		this.song_about = song_about;
	}
	public String getSong_lyrics() {
		return song_lyrics;
	}
	public void setSong_lyrics(String song_lyrics) {
		this.song_lyrics = song_lyrics;
	}
	public String getSong_img_path() {
		return song_img_path;
	}
	public void setSong_img_path(String song_img_path) {
		this.song_img_path = song_img_path;
	}
	public String getListen_count_sum() {
		return listen_count_sum;
	}
	public void setListen_count_sum(String listen_count_sum) {
		this.listen_count_sum = listen_count_sum;
	}
	public String getListen_count_week() {
		return listen_count_week;
	}
	public void setListen_count_week(String listen_count_week) {
		this.listen_count_week = listen_count_week;
	}
	public int getUser_id_upload() {
		return user_id_upload;
	}
	public void setUser_id_upload(int user_id_upload) {
		this.user_id_upload = user_id_upload;
	}
	public String getUpload_date() {
		return upload_date;
	}
	public void setUpload_date(String upload_date) {
		this.upload_date = upload_date;
	}
	
	
	
	
	
	
	

}
