package com.psw.chating.dao;

import java.util.List;

import com.psw.chating.vo.Boarder;
import com.psw.chating.vo.Commute;
import com.psw.chating.vo.Reply;
import com.psw.chating.vo.UploadFile;

public interface BbsDAO {

	public Boarder write(Boarder boarder) throws Exception;
	public void fileUpload(UploadFile uploadFile) throws Exception;
	public Boarder getBoarder(Integer boarder_id) throws Exception;
	public UploadFile getUploadFile(Integer boarder_id) throws Exception;
	public UploadFile getUploadFile(String file_realName) throws Exception;
	public void updateBoarder(Boarder boarder) throws Exception;
	public void updateFile(UploadFile uploadFile) throws Exception;
	public int getMaxBoarder_id() throws Exception;
	public List<Boarder> getBbsList(int boarder_id) throws Exception;
	public void deleteBoarder(int boarder_id) throws Exception;
	public void addDownloadCnt(int file_id) throws Exception;
	public void addBoarderCnt(int boarder_id) throws Exception;
	public List<Reply> getReplyList(int boarder_id) throws Exception;
	public void insertReply(Reply reply) throws Exception;
	public void deleteReply(int reply_id) throws Exception;
	public void go_comm(String user_id) throws Exception;
	public void off_comm(Commute commute) throws Exception;
	public Commute get_todayComm(Commute commute) throws Exception;
	
}
