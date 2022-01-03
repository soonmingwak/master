package com.psw.chating.vo;

public class Member {
	
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_aff;
	private String m_gender;
	private String m_email;
	private String m_tel;
	private String m_adr;
	
	public Member() {}
	
	public Member(String m_name, String m_tel) {
		this.m_name = m_name;
		this.m_tel = m_tel;
	}

	

	public Member(String m_id, String m_pw, String m_name, String m_aff, String m_gender, String m_email, String m_tel,
			String m_adr) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_aff = m_aff;
		this.m_gender = m_gender;
		this.m_email = m_email;
		this.m_tel = m_tel;
		this.m_adr = m_adr;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_aff() {
		return m_aff;
	}

	public void setM_aff(String m_aff) {
		this.m_aff = m_aff;
	}

	public String getM_gender() {
		return m_gender;
	}

	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_tel() {
		return m_tel;
	}

	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}

	public String getM_adr() {
		return m_adr;
	}

	public void setM_adr(String m_adr) {
		this.m_adr = m_adr;
	}
	
	
}
