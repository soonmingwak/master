package com.psw.chating.service;

import javax.servlet.http.HttpServletResponse;

import com.psw.chating.vo.Authmail;
import com.psw.chating.vo.Member;



public interface MemberService {

	public static int loginAction(Member members) throws Exception {
		return 0;
	}
	public static void joinAction(Member members) throws Exception {
	}
	public Member viewMember(String m_id) throws Exception;
	public static Member readMember(String id) {
		return null;
	}
	public static void changeInfo(Member member) throws Exception {
	}
	public static String find_id2(HttpServletResponse response, Member member) throws Exception {
		return null;
	}
	public static String find_id(HttpServletResponse response, Member member) throws Exception {
		return null;
	}
	public static void findpw(HttpServletResponse rs, Member member) throws Exception {
	}
	public int setAuthnum(String m_email) throws Exception;
	public int checkAuthnum(Authmail authmail) throws Exception;
	public void sendemail(Member member, String div) throws Exception;
	
}
