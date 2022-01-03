package com.psw.chating.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.psw.chating.vo.Authmail;
import com.psw.chating.vo.Member;




@Repository
public class MemberDAOImplmpl implements MemberDAO {

	@Inject
	SqlSession sqlSession;
	
	final String SESSION = "com.bbs.mappers.bbs";
	@Override
	public Member login(Member members) throws Exception {
		
		return sqlSession.selectOne(SESSION+".login",members);
	}
	@Override
	public void join(Member members) throws Exception {
		
		sqlSession.insert(SESSION+".join",members);
		
	}
	@Override
	public Member viewMember(String m_id) throws Exception {
		
		return sqlSession.selectOne(SESSION+"viewMember",m_id);
	}
	
	@Override
	public Member readMember(String m_id) throws Exception {
		
				Member vo = sqlSession.selectOne(SESSION+".readMember", m_id);
				return vo;
	}
	
	
	@Override
	public Member readMemberWithIDPW(String userid, String userpw) throws Exception {
	
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("m_id", userid);
		paramMap.put("m_pw", userpw);
		
		return sqlSession.selectOne(SESSION+".readMemberWithIDPW", paramMap);
		
		

	}
	
	@Override
	public void changeInfo(Member member) throws Exception {
		
		System.out.println("member1 : "+member.getM_adr());
		sqlSession.update(SESSION+".changeInfo",member);
		
		System.out.println("member2 : "+member.getM_adr());
	}
	@Override
	public String find_id(Member member) throws Exception {
	
		return sqlSession.selectOne(SESSION+".find_id",member);
	}
	
	@Override
	public String find_id2(Member member) throws Exception {
		
		return sqlSession.selectOne(SESSION+".find_id2",member);
	}
	@Override
	public int updatepw(Member member) throws Exception {
		
		return sqlSession.update(SESSION+".updatepw",member);
	}
	@Override
	public Integer getAuthnum(String m_email) throws Exception {
		
		return sqlSession.selectOne(SESSION +".getAuthnum",m_email);
	}
	@Override
	public void setAuthnum(Authmail authmail) throws Exception {
		sqlSession.insert(SESSION+".setAuthnum",authmail);
		
	}
	@Override
	public void resetAuthnum(Authmail authmail) throws Exception {
		sqlSession.update(SESSION+".resetAuthnum",authmail);
		
	}
	@Override
	public void deleteAuthmail(String m_email) throws Exception {
		sqlSession.delete(SESSION+".deleteAuthmail",m_email);
		
	}
	@Override
	public String idCheck(String m_email) throws Exception {
		return sqlSession.selectOne(SESSION +".idCheck",m_email);
	}
	
}
