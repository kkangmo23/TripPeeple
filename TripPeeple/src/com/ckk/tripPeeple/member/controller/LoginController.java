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
public class LoginController {
	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/memberLogin.do", method = RequestMethod.POST)
	public String memberLogin(HttpServletRequest request, HttpSession session){

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		try {
			MemberDto memberData=memberService.memberLogin(email, password);
			if (password.equals(memberData.getPassword().trim())) {
				session.setAttribute("member_num", memberData.getMember_num());
				session.setAttribute("member_id", memberData.getMember_id());
				session.setAttribute("email", memberData.getEmail());
				return "redirect:/index.do";
			} else{
				request.setAttribute("errorMsg", "비밀번호가 일치하지않습니다.");
				return "member/errorPage";
			}
		} catch (Exception e) {
			request.setAttribute("errorMsg", "존재하지 않는 E-mail입니다.");
			return "member/errorPage";
		}

	}

}


