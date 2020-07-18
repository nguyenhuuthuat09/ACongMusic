package model;

public class reportInfo {
	
	private int report_id;
	private int song_id;
	private int user_id_request;
	private String email_request;
	private int report_reason_id;
	private String report_reason;
	private String report_reason_more;
	private int report_reviewed;
	
	
	public reportInfo(int report_id, int song_id, int user_id_request, String email_request, int report_reason_id,
			String report_reason, String report_reason_more, int report_reviewed) {
		super();
		this.report_id = report_id;
		this.song_id = song_id;
		this.user_id_request = user_id_request;
		this.email_request = email_request;
		this.report_reason_id = report_reason_id;
		this.report_reason = report_reason;
		this.report_reason_more = report_reason_more;
		this.report_reviewed = report_reviewed;
	}


	public int getReport_id() {
		return report_id;
	}


	public void setReport_id(int report_id) {
		this.report_id = report_id;
	}


	public int getSong_id() {
		return song_id;
	}


	public void setSong_id(int song_id) {
		this.song_id = song_id;
	}


	public int getUser_id_request() {
		return user_id_request;
	}


	public void setUser_id_request(int user_id_request) {
		this.user_id_request = user_id_request;
	}


	public String getEmail_request() {
		return email_request;
	}


	public void setEmail_request(String email_request) {
		this.email_request = email_request;
	}


	public int getReport_reason_id() {
		return report_reason_id;
	}


	public void setReport_reason_id(int report_reason_id) {
		this.report_reason_id = report_reason_id;
	}


	public String getReport_reason() {
		return report_reason;
	}


	public void setReport_reason(String report_reason) {
		this.report_reason = report_reason;
	}


	public String getReport_reason_more() {
		return report_reason_more;
	}


	public void setReport_reason_more(String report_reason_more) {
		this.report_reason_more = report_reason_more;
	}


	public int getReport_reviewed() {
		return report_reviewed;
	}


	public void setReport_reviewed(int report_reviewed) {
		this.report_reviewed = report_reviewed;
	}
	
	
	
	

}
