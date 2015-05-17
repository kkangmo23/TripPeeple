package com.ckk.tripPeeple.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ckk.tripPeeple.member.MemberDto;
import com.ckk.tripPeeple.member.MemberService;

@Controller
public class ModifyController {
	
	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/modifyForm.do", method = RequestMethod.GET)
	public String modifyForm(HttpSession session, HttpServletRequest request){
		String email = (String) session.getAttribute("email");
		
		try {
			MemberDto memberData = memberService.getMemberData(email);
			request.setAttribute("dto", memberData);
			return "member/modifyForm";
		} catch (Exception e) {
			
		}
		
		return "member/modifyForm";
	}
}
