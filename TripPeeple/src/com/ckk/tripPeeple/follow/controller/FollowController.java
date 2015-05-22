package com.ckk.tripPeeple.follow.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ckk.tripPeeple.follow.FollowDto;
import com.ckk.tripPeeple.follow.FollowService;


@Controller
public class FollowController {
	
	@Autowired
	private FollowService followService;

	@RequestMapping(value = "/followForm.do", method = RequestMethod.GET)
	public String followForm(HttpSession session, HttpServletRequest request){
		int member_num=(int) session.getAttribute("member_num");
		
		try {
			List<FollowDto> lists = followService.getFollowing(member_num);
			System.out.println(lists);
			request.setAttribute("followingLists", lists);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "follow/followForm";
	}
	
}
