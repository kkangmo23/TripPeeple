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
public class DeleteController {
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/deleteForm.do", method=RequestMethod.GET)
	public String deleteForm(HttpServletRequest request) throws Exception {
		
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		request.setAttribute("board_num", board_num);
		
		return "board/delete";
	}
	
	@RequestMapping(value="/delete.do", method=RequestMethod.POST)	
	public String insertBoard(BoardDto boardDto, HttpSession session, HttpServletRequest request) throws Exception{
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		
		int check=boardService.deleteBoardList(board_num);
		System.out.println(check);
		
		request.setAttribute("check", check);
		
		return "board/deleteOk";
	}
}
