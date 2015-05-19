package com.ckk.tripPeeple.board.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ckk.tripPeeple.board.BoardDto;
import com.ckk.tripPeeple.board.BoardService;

@Controller
public class WriteController {
	@Autowired	
	private BoardService boardService;	
	
	
	@RequestMapping(value="/writeForm.do", method=RequestMethod.GET)
	public String writeForm() {
		return "board/write";
	}

	@RequestMapping(value="/write.do", method=RequestMethod.POST)	
	public String insertBoard(BoardDto boardDto, HttpSession session, HttpServletRequest request){
		
		boardDto.setMember_num((int)session.getAttribute("member_num"));
		try {
			boolean check=boardService.insertBoard(boardDto);
			if(check==true){
				// System.out.println("true");
				request.setAttribute("check", check);
				
				return "board/writeOk";
			}else{
				// System.out.println("false");
				request.setAttribute("check", check);
				return "board/writeOk";
			}
		} catch (Exception e) {
			System.out.println("WriteController insertBoard Error");
			e.printStackTrace();
		}
		
		return "board/writeOk";
	}
}