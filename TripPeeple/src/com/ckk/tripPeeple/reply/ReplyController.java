package com.ckk.tripPeeple.reply;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.ObjectWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ReplyController {
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping(value="/replyWrite.do", method=RequestMethod.POST)
	public @ResponseBody String replyWrite(ReplyDto replyDto, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		int board_num=Integer.parseInt(request.getParameter("boardNumber"));
		String r_content=request.getParameter("r_content");
		
		//replyDto.setMember_num((int)session.getAttribute("member_num"));
		replyDto.setMember_num(13);
		replyDto.setBoard_num(board_num);
		replyDto.setR_content(r_content);
		
		System.out.println(board_num+r_content);
		try {
			boolean check=replyService.insertReply(replyDto);
			if(check){
				List<ReplyDto> replyList = new ArrayList<ReplyDto>();
				replyList = replyService.getReplyList(board_num);
				System.out.println(replyList.size());
				ObjectMapper obj = new ObjectMapper();
				System.out.println(obj.writeValueAsString(replyList));
				return obj.writeValueAsString(replyList);
			}
		} catch (Exception e) {
			System.out.println("Reply Controller Error");
			e.printStackTrace();
		}
		return "success";
	}
	
//	@RequestMapping(value="/replyList.do", method=RequestMethod.GET)
//	public String listForm(HttpServletRequest request, HttpSession session) throws Exception {
//		int board_num=Integer.parseInt(request.getParameter("board_num"));
//		System.out.println("board_num");
//		
//		List<ReplyDto> replyList=null;
//		replyList=replyService.getReplyList(board_num);
//		
//		request.setAttribute("replyList", replyList);
//		return "board/tripHome";
//	}
}
