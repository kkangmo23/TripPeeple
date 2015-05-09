package com.ckk.tripPeeple.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ckk.tripPeeple.user.UserServiceImpl;

@Controller
public class UserController {
	@Autowired
	private UserServiceImpl userService;
	
	@RequestMapping(value = "/userLogin.do", method = RequestMethod.POST)
	public String userLogin(HttpServletRequest request) throws Exception{
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		if (userService.userLogin(userId, userPwd)) {
			return "user/loginOk";
		} else {
			return "user/loginFail";
		}
		
	}

}
