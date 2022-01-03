package com.psw.chating.vo;

public class Authmail {

	private String m_email;
	private int auth_num;
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public int getAuth_num() {
		return auth_num;
	}
	public void setAuth_num(int auth_num) {
		this.auth_num = auth_num;
	}
	public Authmail(String m_email, int auth_num) {
		
		this.m_email = m_email;
		this.auth_num = auth_num;
	}
	

}
