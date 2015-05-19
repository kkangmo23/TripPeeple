package com.ckk.tripPeeple.board.controller;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ckk.tripPeeple.board.BoardService;

@Controller
public class ListController {
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/listForm.do", method=RequestMethod.GET)
	public String listForm(HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println(((ServletRequest) session).getParameter("board_num"));
		
		return "board/list";
	}
	
	@RequestMapping(value="/list.do", method=RequestMethod.POST)	
	public String getBoardList(HttpSession session) throws Exception{
		// int board_num=(int)session.getAttribute("board_num");
		System.out.println("234236457587655475468547657");
//		System.out.println(board_num);
//		
//		List<BoardDto> boardList=boardService.getBoardList(board_num);
//		request.setAttribute("boardList", boardList);
//		
		return "board/list";
	}
}
