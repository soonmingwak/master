package com.psw.chating.service;

import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Service;

import com.psw.chating.dao.MemberDAO;
import com.psw.chating.util.Mail;
import com.psw.chating.vo.Authmail;
import com.psw.chating.vo.Member;




@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	MemberDAO dao;
	
	public int loginAction(Member members) throws Exception {
		
		if(dao.login(members) == null) {
			return 1;
		}
		return 0;
		
	}

	public void joinAction(Member members) throws Exception {
		dao.join(members);
		
	}

	@Override
	public Member viewMember(String m_id) throws Exception {
		
		return dao.viewMember(m_id);
	}

	public Member readMember(String m_id) {
		
		Member mb = null;
		
		try {
			mb = dao.readMember(m_id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mb;
	}

	

	public void changeInfo(Member member) throws Exception {
		System.out.println("member="+member.getM_adr());
		dao.changeInfo(member);
		
	}



	public String find_id(HttpServletResponse response, Member member) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = dao.find_id(member);
		
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}
	public String find_id2(HttpServletResponse response, Member member) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = dao.find_id2(member);
		
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}

	@Override
	public int setAuthnum(String m_email) throws Exception {
		int result = 0;
		
		Random rd =new Random();
		
		//임시비밀버호생성
		int auth_num = rd.nextInt(999999) +1;
		
		
		String from = "tjdrhs464@gmail.com";
		String to   =  m_email;
		String subject = "인증번호 메일";
		String content = "다음 인증번호를 입력하세요.<br> <h2>"+ auth_num +"</h2>";
		
		Integer exist=dao.getAuthnum(to);
		
		if(exist ==null) dao.setAuthnum(new Authmail(to,auth_num));
		else dao.resetAuthnum(new Authmail(to,auth_num));
			
		
		
		Properties p = new Properties();
		
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", "587");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "587");
		p.put("mail.smtp.socketFactory.fallback", "false");
		p.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		p.put("mail.smtp.ssl.protocols", "TLSv1.2");
		
		try {
			
			Authenticator auth = new Mail();
			Session s = Session.getInstance(p, auth);
			s.setDebug(true);
			
			MimeMessage msg = new MimeMessage(s);
			
			Address fromAddr = new InternetAddress(from);
			Address toAddr = new InternetAddress(to);

			msg.setFrom(fromAddr);
			msg.setRecipient(Message.RecipientType.TO, toAddr);
			msg.setSubject(subject);
			msg.setContent(content, "text/html;charset=UTF-8");
			
			Transport.send(msg);
			
		} catch(Exception e) {
			e.printStackTrace();
			result = -1;
		}
		return result;
	}

	public void findpw(HttpServletResponse rs, Member member) throws Exception {
		rs.setContentType("text/html;charset=utf-8");
		Member ck = dao.readMember(member.getM_id());
		PrintWriter out = rs.getWriter();
		// 가입된 아이디가 없으면
		if(dao.idCheck(member.getM_id()) == null) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}
		// 가입된 이메일이 아니면
		else if(!member.getM_email().equals(ck.getM_email())) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			member.setM_pw(pw);
			// 비밀번호 변경
			dao.updatepw(member);          
			// 비밀번호 변경 메일 발송
			sendemail(member, "findpw");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
		
	}

	@Override
	public int checkAuthnum(Authmail authmail) throws Exception {
		int result =1;
		Integer exist  =dao.getAuthnum(authmail.getM_email());
		
		//맞을때
		if(exist.equals(authmail.getAuth_num())) {
			dao.deleteAuthmail(authmail.getM_email()                            );
			result =0;
		}
		//틀릴때
		else {
			result =1;
		}
		return result;
	}

	@Override
	public void sendemail(Member member, String div) throws Exception {
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; 
		String hostSMTPid = "tjdrhs464@gmail.com";
		String hostSMTPpwd = "rhsl2486*";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "tjdrhs464@gamil.com";
		String fromName = "chat";
		String subject = "";
		String msg = "";

		if(div.equals("findpw")) {
			subject = "chat 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += member.getM_id() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += member.getM_pw() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = member.getM_email();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); //네이버 이용시 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
		
	}
}
