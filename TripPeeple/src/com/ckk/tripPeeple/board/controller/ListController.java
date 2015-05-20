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
		session.getAttribute("member_num");
		
		request.setAttribute("boardList", boardList);
		session.setAttribute("session", session.getAttribute("member_num"));
		return "board/list";
	}
}
