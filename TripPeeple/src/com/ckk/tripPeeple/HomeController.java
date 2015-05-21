package com.ckk.tripPeeple;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String home(HttpSession session, Locale locale, Model model) {
		
		if(session.getAttribute("member_id")==null){
			return "member/loginForm";
		}else{
			return "member/tripHome";
		}
		
	}
}
