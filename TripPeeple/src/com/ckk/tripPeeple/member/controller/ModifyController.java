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
	
	@RequestMapping(value = "/modifyOk.do", method = RequestMethod.GET)
	public String modifyOk(){
		return "member/loginOk";
	}

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
	
	@RequestMapping(value = "/updateMember.do", method = RequestMethod.POST)
	public String updateMember(MemberDto dto, HttpSession session, HttpServletRequest request){
		dto.getMember_num();
		dto.getPassword();
		dto.getMember_id();
		dto.getLike_country();
		
		try {
			if(memberService.updateMember(dto)){
				session.setAttribute("member_id", dto.getMember_id());
				return "member/modifyOk";
			}else{
				request.setAttribute("errorMsg", "회원정보 수정에 실패하였습니다.");
				return "member/loginFail";
			}
		} catch (Exception e) {
			request.setAttribute("errorMsg", "회원정보 수정에 실패하였습니다.");
			return "member/loginFail";
		}		
	}
}
