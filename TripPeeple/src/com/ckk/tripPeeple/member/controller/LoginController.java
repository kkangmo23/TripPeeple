package com.ckk.tripPeeple.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
			if (password.equals(memberService.memberLogin(email, password).getPassword().trim())) {
				session.setAttribute("member_id", memberService.memberLogin(email, password).getMember_id());
				return "member/loginOk";
			} else{
				request.setAttribute("errorMsg", "비밀번호가 일치하지않습니다.");
				return "member/loginFail";
			}
		} catch (Exception e) {
			request.setAttribute("errorMsg", "아이디가 존재하지 않습니다.");
			return "member/loginFail";
		}

	}

}


