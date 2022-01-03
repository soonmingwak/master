package com.psw.chating.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.psw.chating.service.BbsService;
import com.psw.chating.vo.Boarder;
import com.psw.chating.vo.Reply;
import com.psw.chating.vo.UploadFile;

@Controller

public class BbsController {
	@Inject
	BbsService bbsService;

	@RequestMapping(value = "/bbsList")
	public String bbsList(Integer pagenumber, Model model) throws Exception {
		
		if(pagenumber == null) pagenumber = 1;
		HashMap<String, Object> map = bbsService.bbs(pagenumber);
		model.addAttribute("map",map);
		return "notice/bbsList";
	}

	// url 패턴이 'path/bbs/write' 일 경우
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write(RedirectAttributes ra, HttpSession session) throws Exception {
		return "notice/write";
	}

	// url 패턴이 'path/bbs/writeAction' 일 경우
	@RequestMapping(value = "/writeAction", method = RequestMethod.POST)
	public String writeAction(Boarder boarder, MultipartFile file, HttpSession session, RedirectAttributes ra)
			throws Exception {
		System.out.println(boarder.toString());
		String user_id = (String) session.getAttribute("user_id");
		boarder.setWriter(user_id);
		bbsService.writeAction(boarder, file);
		return "redirect:/bbsList";
	}
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(Integer boarder_id, Model model, RedirectAttributes ra) throws Exception {
		
		bbsService.addCount(boarder_id);
		HashMap<String, Object> map = bbsService.view(boarder_id);
		
		if(map.get("boarder") == null) {
			ra.addFlashAttribute("msg", "존재하지 않는 게시물입니다.");
			return "redirect:/bbsList";
		}
		
		model.addAttribute("map", map);
		
		return "notice/view";
		
	}
	// url 패턴이 'path/bbs/update' 일 경우
		@RequestMapping(value = "/update", method = RequestMethod.GET)
		public String update(Integer boarder_id, Model model, HttpSession session, RedirectAttributes ra) throws Exception {
			
			String user_id = (String) session.getAttribute("user_id");
			
			HashMap<String, Object> map = bbsService.view(boarder_id);
			Boarder boarder = (Boarder) map.get("boarder");
			
			
			
			if(boarder == null) {
				ra.addFlashAttribute("msg", "존재하지 않는 게시물입니다.");
				return "redirect:/bbsList";
			}
			
			
			
			model.addAttribute("map", map);
			
			return "notice/update";
			
		}
		// url 패턴이 'path/bbs/downloadAction' 일 경우
		@RequestMapping(value = "/downloadAction", method = RequestMethod.GET)
		public String downloadAction(UploadFile uploadFile, HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			bbsService.downloadAction(request, response, uploadFile);
			
			return "redirect:/view?boarder_id=" + uploadFile.getBoarder_id();
		}

		// url 패턴이 'path/bbs/updateAction' 일 경우
		@RequestMapping(value = "/updateAction", method = RequestMethod.POST)
		public String updateAction(Boarder boarder, MultipartFile file) throws Exception {
			
			bbsService.updateAction(boarder, file);
			
			return "redirect:/view?boarder_id=" + boarder.getBoarder_id();
			
		}
		
		// url 패턴이 'path/bbs/deleteBoarder' 일 경우
		@RequestMapping(value = "deleteBoarder", method = RequestMethod.GET)
		public String deleteBoarder(int boarder_id) throws Exception {
			
			bbsService.deleteAction(boarder_id);
			
			return "redirect:/bbsList";
			
		}
		
		// url 패턴이 'path/bbs/insertReply' 일 경우
		@RequestMapping(value = "insertReply", method = RequestMethod.GET)
		@ResponseBody
		public List<Reply> insertReply(Reply reply, HttpSession session) throws Exception {
			
			String user_id = (String) session.getAttribute("user_id");
			if(user_id == null) return null;
			
			reply.setWriter(user_id);
			List<Reply> list = bbsService.insertReply(reply);
			
			return list;
			
		}
		
		// url 패턴이 'path/bbs/deleteReply' 일 경우
		@RequestMapping(value = "deleteReply", method = RequestMethod.GET)
		@ResponseBody
		public List<Reply> deleteReply(Reply reply, HttpSession session) throws Exception {
			
			String user_id = (String) session.getAttribute("user_id");
			if(user_id == null) return null;
			
			reply.setWriter(user_id);
			List<Reply> list = bbsService.deleteReply(reply);
			
			return list;
			
		}
}
