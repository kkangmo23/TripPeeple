package com.ckk.tripPeeple.reply;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReplyController {
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping(value="/replyWrite.do", method=RequestMethod.POST)
	public String replyWrite(ReplyDto replyDto, HttpServletRequest request, HttpServletResponse response) {
		
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		String r_content=request.getParameter("writeReply");
		
		System.out.println(board_num+","+r_content);
		
		try {
			boolean check=replyService.insertReply(replyDto);
			if(check==true){
				int reply_num=replyDto.getReply_num();
				
				System.out.println("reply_num:"+reply_num);
				
				String str=reply_num+","+r_content;
				
				response.setContentType("application/html;charset=utf-8");	// html, xml, x-json 확인
				PrintWriter out=response.getWriter();
				out.print(str);
			}
		} catch (Exception e) {
			System.out.println("Reply Controller Error");
			e.printStackTrace();
		}
		return null;
	}
}
