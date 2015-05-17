package com.ckk.tripPeeple.board.controller;


import java.util.Date;

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
	public String insertBoard(BoardDto boardDto){
		
		
		
		Date date=new Date();
		boardDto.setCreate_time(date);
		boardDto.setModify_time(date);
		boardDto.getBoard_num();
		boardDto.getMember_num();
		boardDto.getCreate_time();
		boardDto.getModify_time();
		boardDto.getCity_num();
		boardDto.getContent();
		
		try {
			if(boardService.insertBoard(boardDto)){
				return "board/writeOk";
			}
		} catch (Exception e) {
			System.out.println("WriteController insertBoard Error");
			e.printStackTrace();
		}
		return "board/write";
	}
}