package model;

public class musicType {
	private int music_id;
	private int country_id;
	private String music_type_name;
	
	
	public musicType(int music_id, int country_id, String music_type_name) {
		super();
		this.music_id = music_id;
		this.country_id = country_id;
		this.music_type_name = music_type_name;
	}


	public int getMusic_id() {
		return music_id;
	}


	public void setMusic_id(int music_id) {
		this.music_id = music_id;
	}


	public int getCountry_id() {
		return country_id;
	}


	public void setCountry_id(int country_id) {
		this.country_id = country_id;
	}


	public String getMusic_type_name() {
		return music_type_name;
	}


	public void setMusic_type_name(String music_type_name) {
		this.music_type_name = music_type_name;
	}
	
	
	
	
	
}
