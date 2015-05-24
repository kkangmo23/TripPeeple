package com.ckk.tripPeeple.board.controller;

import java.util.ArrayList;
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

	@RequestMapping(value = "/listForm.do", method = RequestMethod.GET)
	public String listForm(HttpServletRequest request, HttpSession session)
			throws Exception {
		String search = request.getParameter("search");
		System.out.println(search);
		List<BoardDto> boardList = new ArrayList<BoardDto>();
		if (search != null) {
			boardList = boardService.getSearchList(search);
		} else {
			boardList = boardService.getBoardList();
		}
		request.setAttribute("boardList", boardList);
		return "board/tripHome";
	}

	@RequestMapping(value = "/myListForm.do", method = RequestMethod.GET)
	public String myListForm(HttpServletRequest request, HttpSession session)
			throws Exception {
		int member = Integer.parseInt(request.getParameter("member_num"));
		System.out.println(member);

		List<BoardDto> boardList = null;
		boardList = boardService.getBoardList();
		// session.getAttribute("member_num");
		// System.out.println(session.getAttribute("member_num"));

		request.setAttribute("boardList", boardList);
		request.setAttribute("member", member);
		// session.setAttribute("session", session.getAttribute("member_num"));
		return "board/myList";
	}

}
