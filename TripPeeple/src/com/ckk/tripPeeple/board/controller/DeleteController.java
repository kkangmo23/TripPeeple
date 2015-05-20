package com.ckk.tripPeeple.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ckk.tripPeeple.board.BoardService;

@Controller
public class DeleteController {
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/delete.do", method=RequestMethod.GET)
	public String deleteForm(HttpServletRequest request) throws Exception {
		
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		
		int check=boardService.deleteBoardList(board_num);
		// System.out.println(check);
		
		request.setAttribute("check", check);
		
		return "board/deleteOk";
	}
	
	@RequestMapping(value="/myDelete.do", method=RequestMethod.GET)
	public String myDeleteForm(HttpServletRequest request) throws Exception {
		
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		
		int check=boardService.deleteBoardList(board_num);
		// System.out.println(check);
		
		request.setAttribute("check", check);
		
		return "board/myDeleteOk";
	}
	
}
