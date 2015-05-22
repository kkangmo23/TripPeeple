package com.ckk.tripPeeple.follow.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class FollowController {

	@RequestMapping(value = "/followForm.do", method = RequestMethod.GET)
	public String followForm(){
		return "follow/followForm";
	}
	
}
