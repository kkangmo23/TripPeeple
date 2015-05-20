package com.ckk.tripPeeple.member.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LogoutController {

	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletResponse response){
		session.invalidate();
		response.setHeader("Expires", "-1");
		response.setDateHeader("Expires", 0);
		response.setHeader("pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		return "redirect:/index.do";
	}

}
