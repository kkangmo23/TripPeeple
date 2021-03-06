package com.ckk.tripPeeple.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ckk.tripPeeple.member.MemberService;

@Controller
public class CheckController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/checkEmailForm.do", method = RequestMethod.GET)
	public String checkEmailForm(){
		return "member/checkEmailForm";
	}

	@RequestMapping(value = "/checkEmail.do", method = RequestMethod.POST)
	public String checkEmail(HttpServletRequest request) throws Exception{
		
		String email = request.getParameter("email");
		if(memberService.checkEmail(email)){
			request.setAttribute("email", email);
			request.setAttribute("check", memberService.checkEmail(email));
			return "member/checkEmail";
		}else{
			request.setAttribute("check", memberService.checkEmail(email));
			return "member/checkEmail";
		}
	}
	
	@RequestMapping(value = "/checkIdForm.do", method = RequestMethod.GET)
	public String checkIdForm(){
		return "member/checkIdForm";
	}
	
	@RequestMapping(value = "/checkId.do", method = RequestMethod.POST)
	public String checkId(HttpServletRequest request) throws Exception{
		
		String member_id = request.getParameter("member_id");
		if(memberService.checkId(member_id)){
			request.setAttribute("member_id", member_id);
			request.setAttribute("check", memberService.checkId(member_id));
			return "member/checkId";
		}else{
			request.setAttribute("check", memberService.checkId(member_id));
			return "member/checkId";
		}
	}
	
}
