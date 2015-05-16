package com.ckk.tripPeeple.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ckk.tripPeeple.member.MemberDto;
import com.ckk.tripPeeple.member.MemberService;

@Controller
public class RegistController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/registerForm.do", method = RequestMethod.GET)
	public String registerForm(){
		return "member/registerForm";
	}
	
	@RequestMapping(value = "/memberRegister.do", method = RequestMethod.POST)
	public String insertMember(MemberDto dto) throws Exception{
		dto.getEmail();
		dto.getPassword();
		dto.getMember_id();
		dto.getLike_country();
		
		if(memberService.insertMember(dto)){
			return "member/registerOk";
		}else{
			return "member/registerFail";
		}		
	}
	
}
