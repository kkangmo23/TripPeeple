package com.ckk.tripPeeple.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	public String insertMember(MemberDto dto, HttpServletRequest request){
		dto.getEmail();
		dto.getPassword();
		dto.getMember_id();
		dto.getLike_country();
		
		try {
			if(memberService.insertMember(dto)){
				request.setAttribute("successMsg", "가입되셨습니다.");
				request.setAttribute("url", "./index.do");
				return "member/successPage";
			}else{
				request.setAttribute("errorMsg", "회원가입에 실패하였습니다.");
				return "member/errorPage";
			}
		} catch (Exception e) {
			request.setAttribute("errorMsg", "회원가입에 실패하였습니다.");
			return "member/errorPage";
		}		
	}
	
}
