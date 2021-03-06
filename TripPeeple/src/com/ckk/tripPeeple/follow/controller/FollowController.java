package com.ckk.tripPeeple.follow.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
			List<FollowDto> followingLists = followService.getFollowing(member_num);
			request.setAttribute("followingLists", followingLists);
			
			List<FollowDto> followerLists = followService.getFollower(member_num);
			request.setAttribute("followerLists", followerLists);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "follow/followForm";
	}
	
	@RequestMapping(value = "/followDelete.do", method = RequestMethod.POST)
	public String deleteFollowing(HttpServletRequest request){
		int following_num = Integer.parseInt(request.getParameter("num"));
		
		try {
			followService.deleteFollowing(following_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/followForm.do";
	}
	
	@ResponseBody
	@RequestMapping(value = "/followInsert.do", method = RequestMethod.POST)
	public Map<String, Boolean> insertFollowing(HttpSession session, HttpServletRequest request){
		int follower_num = Integer.parseInt(request.getParameter("num"));
		int	member_num = (int) session.getAttribute("member_num");
//		System.out.println("follower_num : "+follower_num+" ///////////////// member_num : "+member_num);
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		boolean isc = false;
		
		try {
			followService.insertFollowing(follower_num,member_num);
			isc = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		map.put("isc", isc);
		return map;
	}
	
}
