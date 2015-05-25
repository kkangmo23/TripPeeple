package com.ckk.tripPeeple.reply;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ReplyController {
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping(value = "/replyWrite.do", method = RequestMethod.POST)
	public @ResponseBody String writeReply(ReplyDto replyDto,
			HttpSession session, HttpServletRequest request,
			HttpServletResponse response) {

		int board_num = Integer.parseInt(request.getParameter("boardNumber"));
		String r_content = request.getParameter("r_content");

		replyDto.setMember_num((int)session.getAttribute("member_num"));
		replyDto.setBoard_num(board_num);
		replyDto.setR_content(r_content);

		try {
			boolean check = replyService.insertReply(replyDto);
			if (check) {
				return getReplyList(board_num);
			}
		} catch (Exception e) {
			System.out.println("Reply Controller Error");
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping(value = "/modifyReply.do", method = RequestMethod.POST)
	public @ResponseBody String modifyReply(ReplyDto replyDto,
			HttpSession session, HttpServletRequest request,
			HttpServletResponse response) {

		int reply_num = Integer.parseInt(request.getParameter("replyNumber"));
		int board_num = Integer.parseInt(request.getParameter("boardNumber"));
		String r_content = request.getParameter("r_content");
	    replyDto.setMember_num((int)session.getAttribute("member_num"));
		replyDto.setBoard_num(board_num);
		replyDto.setReply_num(reply_num);
		replyDto.setR_content(r_content);
		try {
			boolean check = replyService.updateReply(replyDto);
			if (check) {
				return getReplyList(board_num);
			}
		} catch (Exception e) {
			System.out.println("Reply Controller Error");
			e.printStackTrace();
		}
		return null;
	}
	@RequestMapping(value = "/deleteReply.do", method = RequestMethod.POST)
	public @ResponseBody String deleteReply(ReplyDto replyDto,
			HttpSession session, HttpServletRequest request,
			HttpServletResponse response) {

		int reply_num = Integer.parseInt(request.getParameter("replyNumber"));
		int board_num = Integer.parseInt(request.getParameter("boardNumber"));
	    replyDto.setMember_num((int)session.getAttribute("member_num"));
		replyDto.setBoard_num(board_num);
		replyDto.setReply_num(reply_num);
		try {
			boolean check = replyService.deleteReply(replyDto);
			if (check) {
				return getReplyList(board_num);
			}
		} catch (Exception e) {
			System.out.println("Reply Controller Error");
			e.printStackTrace();
		}
		return null;
	}
	
	public String getReplyList(int board_num) throws Exception {
		List<ReplyDto> replyList = new ArrayList<ReplyDto>();
		replyList = replyService.getReplyList(board_num);
		ObjectMapper obj = new ObjectMapper();
		return URLEncoder.encode(obj.writeValueAsString(replyList), "UTF-8");		
	}
}
