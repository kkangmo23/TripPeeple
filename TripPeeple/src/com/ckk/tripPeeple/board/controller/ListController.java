package com.ckk.tripPeeple.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ckk.tripPeeple.board.BoardDto;
import com.ckk.tripPeeple.board.BoardService;

@Controller
public class ListController {
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/listForm.do", method=RequestMethod.GET)
	public String listForm(HttpServletRequest request, HttpSession session) throws Exception {
		
		List<BoardDto> boardList=null;
		boardList=boardService.getBoardList();
		
		
		/*BoardDto boardDto=boardList.get(0);
		int board_num=boardDto.getBoard_num();
		System.out.println(board_num);
		request.setAttribute("board_num", board_num);  댓글 부분*/
		
		request.setAttribute("boardList", boardList);
		
		
//		int board_num=Integer.parseInt(request.getParameter("board_num"));
//		System.out.println("board_num");
		
		// return "redirect:/replyWrite.do";
		return "board/tripHome";
	}
	
	@RequestMapping(value="/myListForm.do", method=RequestMethod.GET)
	public String myListForm(HttpServletRequest request, HttpSession session) throws Exception {
		int member=Integer.parseInt(request.getParameter("member_num"));
		System.out.println(member);
		
		List<BoardDto> boardList=null;
		boardList=boardService.getBoardList();
//		session.getAttribute("member_num");
//		System.out.println(session.getAttribute("member_num"));

		request.setAttribute("boardList", boardList);
		request.setAttribute("member", member);
//		session.setAttribute("session", session.getAttribute("member_num"));
		return "board/myList";
	}
}
