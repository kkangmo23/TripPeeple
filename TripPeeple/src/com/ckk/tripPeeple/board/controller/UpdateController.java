package com.ckk.tripPeeple.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ckk.tripPeeple.board.BoardDto;
import com.ckk.tripPeeple.board.BoardService;
import com.ckk.tripPeeple.reply.ReplyDto;

@Controller
public class UpdateController {
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/updateForm.do", method=RequestMethod.POST)
	public String updateForm(HttpServletRequest request) throws Exception {
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		
		BoardDto board=boardService.updateRead(board_num);
		//System.out.println(board);
		
		request.setAttribute("board",board);
		
		return "board/update";
	}
	
	@RequestMapping(value="/update.do", method=RequestMethod.POST)	
	public String updateBoard(BoardDto boardDto, HttpSession session, HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("utf-8");
		
		boardDto.setMember_num((int)session.getAttribute("member_num"));
		int check=boardService.updateBoard(boardDto);
		// System.out.println(check);
		try {
			if(check>0){
				request.setAttribute("check", check);
				session.setAttribute("session", boardDto.getMember_num());
				return "board/updateOk";
			}else{
				request.setAttribute("check", check);
				return "board/updateOk";
			}
		} catch (Exception e) {
			System.out.println("WriteController updateBoard Error");
			e.printStackTrace();
		}
		
		return "board/updateOk";
	}
	
	@RequestMapping(value="/myUpdateForm.do", method=RequestMethod.POST)
	public String myUpdateForm(HttpServletRequest request) throws Exception {
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		// System.out.println(board_num);
		
		BoardDto board=boardService.updateRead(board_num);
		//System.out.println(board);
		
		request.setAttribute("board",board);
		
		return "board/myUpdate";
	}
	
	@RequestMapping(value="/myUpdate.do", method=RequestMethod.POST)	
	public String myUpdateBoard(BoardDto boardDto, HttpSession session, HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("utf-8");
		
		boardDto.setMember_num((int)session.getAttribute("member_num"));
		int check=boardService.updateBoard(boardDto);
		// System.out.println(check);
		try {
			if(check>0){
				request.setAttribute("check", check);
				session.setAttribute("session", boardDto.getMember_num());
				return "board/myUpdateOk";
			}else{
				request.setAttribute("check", check);
				return "board/myUpdateOk";
			}
		} catch (Exception e) {
			System.out.println("WriteController updateBoard Error");
			e.printStackTrace();
		}
		
		return "board/myUpdateOk";
	}
	
//	@RequestMapping(value="/like.do", method=RequestMethod.POST)
//	public @ResponseBody String likeBoard(BoardDto boardDto,
//			HttpSession session, HttpServletRequest request,
//			HttpServletResponse response) {
//
//		int board_num = Integer.parseInt(request.getParameter("boardNumber"));
//		int likes = Integer.parseInt(request.getParameter("likes"));
//	    boardDto.setMember_num((int)session.getAttribute("member_num"));
//		boardDto.setBoard_num(board_num);
//		try {
//			boolean check = boardService.updateLike(board_num);
//			if (check) {
//				return getLikeList(board_num);
//			}
//		} catch (Exception e) {
//			System.out.println("Update Like Controller Error");
//			e.printStackTrace();
//		}
//		return null;
//	}
}
