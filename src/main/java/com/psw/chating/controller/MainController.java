
package com.psw.chating.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.psw.chating.service.BbsService;
import com.psw.chating.service.MemberService;
import com.psw.chating.vo.Commute;
import com.psw.chating.vo.Member;
import com.psw.chating.vo.Room;



@Controller
public class MainController {
	
	@Inject
	BbsService bbsService;

	@RequestMapping(value = "/")
	public String main() {
		return "main";
	}
	@RequestMapping(value = "/oo")
	public String oo() {
		return "oo";
	}

	@RequestMapping(value = "/calender")
	public String calender() {
		return "calender";
	}


	@RequestMapping(value = "/att")
	public String att(Model model) throws Exception {
		
		// url /att 가 실행되면 해당 유저 아이디의 근태현황을 데이터베이스에서 불러옴
		Commute commute = bbsService.get_todayComm("aaa");
		
		// 불러온 근태현황을 모델에 commute라는 이름으로 전달
		model.addAttribute("commute", commute);
		
		return "attendance/att";
	}
	
	@RequestMapping(value = "/attcheck")
	public String attcheck() {
		return "attendance/attcheck";
	}

	
	
	@RequestMapping(value = "/loginAction", method = RequestMethod.POST)
	public String loginAction(Member members,HttpSession session,RedirectAttributes ra) throws Exception{
		
		int result =MemberService.loginAction(members);
		
		String url =null;
		
		if(result ==0) {
			session.setAttribute("m_id", members.getM_id());
			
			url="redirect:/main";
		}
		else {
			ra.addFlashAttribute("msg","로그인정보가 일치하지 않습니다..");
			url="redirect:/chatlogin";
			
		}
		
		return url;
	}

@RequestMapping(value="/logout",method = RequestMethod.GET)
	
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		
		return "redirect:/";
	}
	@RequestMapping(value = "/join")
	public String join(Model model) throws Exception {
		
		return "join";
	}
	
	@RequestMapping(value = "/joinAction", method =RequestMethod.POST)
	public String joinAction(Member members,String m_addr1, String m_addr2, String m_addr3) throws Exception{
		members.setM_adr(m_addr1+" "+m_addr2+" "+m_addr3);
		MemberService.joinAction(members);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/findid")
	public String findid(Member members) {
	//	MemberService.fidId(String m_name, String m_email);
		return "find/findid";
	}
	
	@RequestMapping(value = "/findidAction", method =RequestMethod.POST)
	public String findidAction(HttpServletResponse response, Model md, Member member)throws Exception {
		
		
		
		if((member.getM_name()!=null&&member.getM_tel()!=null)&&member.getM_email()==null) {
			System.out.println("11"+member.getM_email());
			md.addAttribute("id",MemberService.find_id(response, member));
		
		}else if((member.getM_name()!=null&&member.getM_email()!=null)&&member.getM_tel()==null) {
			System.out.println("22"+member.getM_email());
			md.addAttribute("id",MemberService.find_id2(response, member));
		}
		
		return "find/findview";
	}
	
	@RequestMapping(value = "/findpw", method = RequestMethod.GET)
	public void findPwGET() throws Exception{
		
	}
	
	@RequestMapping(value = "/findpw", method = RequestMethod.POST)
	public String findpw(@ModelAttribute Member member, HttpServletResponse response) throws Exception {
		
		MemberService.findpw(response, member);
		return "find/findpw";
	}
	
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String info(Model model, HttpSession session, Member members) throws Exception {
		
		String id = (String)session.getAttribute("m_id");
	
		
		
		members = MemberService.readMember(id);
		model.addAttribute("member", members);
		
	
		return "info/info";
		
	}
	
	@RequestMapping(value = "/infochange")
	public String infochange(HttpSession session ) throws Exception {
		
		String id = (String)session.getAttribute("m_id");
		
		return "info/infochange";
	}
	
	@RequestMapping(value = "/changeAction", method = RequestMethod.POST)
	public String changeAction(HttpSession session, Member members, String m_adr1, String m_adr2, String m_adr3) throws Exception{
		members.setM_adr(m_adr1+" "+m_adr2+" "+m_adr3);
		System.out.println(m_adr1);
		System.out.println(m_adr2);
		System.out.println(m_adr3);
		System.out.println(members.getM_adr());
		System.out.println(members.getM_name());
		MemberService.changeInfo(members);
		session.invalidate();
		return "redirect:/";
//		MemberService.infoChange(member);
//		return "redirect:/main/infochange?m_id="+member.getM_id();
		//session.setAttribute("member", MemberService.infoChange(member));
		//return "redirect:/main/infochange?m_id="+member.getM_id();
	}
	
	List<Room> roomList = new ArrayList<Room>();
	static int roomNumber = 0;

	@RequestMapping("/chat")
	public ModelAndView chat() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chat");
		return mv;
	}
	
	@RequestMapping("/room")
	public ModelAndView room() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("room");
		return mv;
	}


	@RequestMapping("/createRoom")
	public @ResponseBody List<Room> createRoom(@RequestParam HashMap<Object, Object> params) {
		String roomName = (String) params.get("roomName");
		if (roomName != null && !roomName.trim().equals("")) {
			Room room = new Room();
			room.setRoomNumber(++roomNumber);
			room.setRoomName(roomName);
			roomList.add(room);
		}
		return roomList;
	}

	
	@RequestMapping("/getRoom")
	public @ResponseBody List<Room> getRoom(@RequestParam HashMap<Object, Object> params) {
		return roomList;
	}

	
	@RequestMapping("/moveChating")
	public ModelAndView chating(@RequestParam HashMap<Object, Object> params) {
		ModelAndView mv = new ModelAndView();
		int roomNumber = Integer.parseInt((String) params.get("roomNumber"));

		List<Room> new_list = roomList.stream().filter(o -> o.getRoomNumber() == roomNumber)
				.collect(Collectors.toList());
		if (new_list != null && new_list.size() > 0) {
			mv.addObject("roomName", params.get("roomName"));
			mv.addObject("roomNumber", params.get("roomNumber"));
			mv.setViewName("room");
		} else {
			mv.setViewName("room");
		}
		return mv;
	}
	
	@RequestMapping(value = "/go_action", method = RequestMethod.POST)
	@ResponseBody
	public String go_action(HttpSession session) throws Exception {
		
		int result = 0;
		
		// String user_id = (String) session.getAttribute("user_id");
		String user_id = "aaa";
		try {
			// 유저아이디를 service에 전달해서 insert (출근) 작업 진행
			bbsService.go_action(user_id);
		} catch(Exception e) {
			e.printStackTrace();
			result = 1;
		}
		return result + "";
		
	}
	@RequestMapping(value = "/off_action", method = RequestMethod.POST)
	@ResponseBody
	public String off_action(HttpSession session) throws Exception {
		
		int result = 0;
		
		// String user_id = (String) session.getAttribute("user_id");
		String user_id = "aaa";
		
		Commute commute = bbsService.get_todayComm("aaa");
		
		if(commute.getCom_type().equals("퇴근")) result = 1;
		
		try {
			// 유저아이디를 service에 전달해서 insert (출근) 작업 진행
			bbsService.off_action(user_id);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result + "";
		
	}
}

