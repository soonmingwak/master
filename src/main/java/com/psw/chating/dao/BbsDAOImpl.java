package com.psw.chating.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.psw.chating.vo.Boarder;
import com.psw.chating.vo.Commute;
import com.psw.chating.vo.Reply;
import com.psw.chating.vo.UploadFile;

@Repository
public class BbsDAOImpl implements BbsDAO {

	@Inject
	SqlSession sqlSession;
	
	final String SESSION = "com.psw.chating.mappers.bbs";

	@Override
	public Boarder write(Boarder boarder) throws Exception {
		System.out.println(boarder.toString());
		sqlSession.insert(SESSION + ".write", boarder);
		return boarder;
	}

	@Override
	public void fileUpload(UploadFile uploadFile) throws Exception {
		sqlSession.insert(SESSION + ".fileUpload", uploadFile);
	}

	@Override
	public Boarder getBoarder(Integer boarder_id) throws Exception {
		return sqlSession.selectOne(SESSION + ".getBoarder", boarder_id);
	}

	@Override
	public UploadFile getUploadFile(Integer boarder_id) throws Exception {
		return sqlSession.selectOne(SESSION + ".getUploadFile", boarder_id);
	}

	@Override
	public UploadFile getUploadFile(String file_realName) throws Exception {
		return sqlSession.selectOne(SESSION + ".getUploadFileReal", file_realName);
	}

	@Override
	public void updateBoarder(Boarder boarder) throws Exception {
		sqlSession.update(SESSION + ".updateBoarder", boarder);
	}

	@Override
	public void updateFile(UploadFile uploadFile) throws Exception {
		sqlSession.update(SESSION + ".updateFile", uploadFile);
	}

	@Override
	public int getMaxBoarder_id() throws Exception {
		return sqlSession.selectOne(SESSION + ".getMaxBoarder_id");
	}

	@Override
	public List<Boarder> getBbsList(int boarder_id) throws Exception {
		return sqlSession.selectList(SESSION + ".getBbsList", boarder_id);
	}

	@Override
	public void deleteBoarder(int boarder_id) throws Exception {
		sqlSession.update(SESSION + ".deleteBoarder", boarder_id);
	}

	@Override
	public void addDownloadCnt(int file_id) throws Exception {
		sqlSession.update(SESSION + ".addDownloadCnt", file_id);
	}

	@Override
	public void addBoarderCnt(int boarder_id) throws Exception {
		sqlSession.update(SESSION + ".addBoarderCnt", boarder_id);
	}

	@Override
	public void insertReply(Reply reply) throws Exception {
		sqlSession.insert(SESSION + ".insertReply", reply);
	}

	@Override
	public List<Reply> getReplyList(int boarder_id) throws Exception {
		return sqlSession.selectList(SESSION + ".getReplyList", boarder_id);
	}

	@Override
	public void deleteReply(int reply_id) throws Exception {
		sqlSession.delete(SESSION + ".deleteReply", reply_id);
	}

	@Override
	public void go_comm(String user_id) throws Exception {
		sqlSession.insert(SESSION + ".go_comm", user_id);
	}
	
	@Override
	public void off_comm(Commute commute) throws Exception {
		sqlSession.update(SESSION + ".off_comm", commute);
	}

	@Override
	public Commute get_todayComm(Commute commute) throws Exception {
		return sqlSession.selectOne(SESSION + ".get_todayComm", commute);
	}
	
}