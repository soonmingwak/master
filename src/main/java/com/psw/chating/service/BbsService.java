package com.psw.chating.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import com.psw.chating.vo.Boarder;
import com.psw.chating.vo.Commute;
import com.psw.chating.vo.Reply;
import com.psw.chating.vo.UploadFile;

public interface BbsService {

	public void writeAction(Boarder boarder, MultipartFile file) throws Exception;
	public HashMap<String, Object> view(Integer boarder_id) throws Exception;
	public void downloadAction(HttpServletRequest request, HttpServletResponse response, UploadFile uploadFile) throws Exception;
	public void updateAction(Boarder boarder, MultipartFile file) throws Exception;
	public HashMap<String, Object> bbs(int pageNumber) throws Exception;
	public void deleteAction(int boarder_id) throws Exception;
	public void addCount(int boarder_id) throws Exception;
	public List<Reply> insertReply(Reply reply) throws Exception;
	public List<Reply> deleteReply(Reply reply) throws Exception;
	public void go_action(String user_id) throws Exception;
	public void off_action(String user_id) throws Exception;
	public Commute get_todayComm(String user_id) throws Exception;
	
}
