package com.ckk.tripPeeple.reply;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ckk.tripPeeple.board.BoardDto;

@Controller
public class ReplyController {
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping(value="/replyWrite.do", method=RequestMethod.GET)
	public String replyWrite(ReplyDto replyDto, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		int board_num=Integer.parseInt(request.getParameter("boardNumber"));
		String r_content=request.getParameter("r_content");
		
		System.out.println(board_num+","+r_content);
		
		replyDto.setMember_num((int)session.getAttribute("member_num"));
		replyDto.setBoard_num(board_num);
		
		try {
			boolean check=replyService.insertReply(replyDto);
			if(check==true){
				int reply_num=replyDto.getReply_num();
				
				// System.out.println("reply_num:"+reply_num);
				
				String str=reply_num+","+r_content;
				
				response.setContentType("application/html;charset=utf-8");	// html, xml, x-json 확인
				PrintWriter out=response.getWriter();
				out.print(str);
				
				return null;
			}
		} catch (Exception e) {
			System.out.println("Reply Controller Error");
			e.printStackTrace();
		}
		return "board/tripHome";
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
