package com.psw.chating.vo;

public class Commute {
	private String user_id;
	private String comm_date;
	private String go_date;
	private String off_date;
	private String com_type;
	
	public Commute(){}
	
	public Commute(String user_id, String comm_date, String go_date, String off_date, String com_type) {
		super();
		this.user_id = user_id;
		this.comm_date = comm_date;
		this.go_date = go_date;
		this.off_date = off_date;
		this.com_type = com_type;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getGo_date() {
		return go_date;
	}

	public void setGo_date(String go_date) {
		this.go_date = go_date;
	}

	public String getOff_date() {
		return off_date;
	}

	public void setOff_date(String off_date) {
		this.off_date = off_date;
	}

	public String getCom_type() {
		return com_type;
	}

	public void setCom_type(String com_type) {
		this.com_type = com_type;
	}

	public String getComm_date() {
		return comm_date;
	}

	public void setComm_date(String comm_date) {
		this.comm_date = comm_date;
	}
	
}
