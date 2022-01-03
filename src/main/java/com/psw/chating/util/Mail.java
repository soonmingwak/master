package com.psw.chating.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Mail extends Authenticator {
	protected static String id;
	protected static String pw;
	public Mail() {
		id="tjdrhs464@gamil.com";
		pw="rhsl2486*";
	}
	
	protected PasswordAuthentication getPasswordAuthentication() {
		
		return new PasswordAuthentication(id,pw);
	}
}
