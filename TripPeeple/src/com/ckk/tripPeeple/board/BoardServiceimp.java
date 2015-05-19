package com.ckk.tripPeeple.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceimp implements BoardService{
	@Autowired
	private BoardDao boardDao;
	
	@Override
	public boolean insertBoard(BoardDto boardDto) throws Exception {
		boolean isc=false;
		if(boardDao.insertBoard(boardDto)!=0){
			isc=true;
		}
		return isc;
	}

	@Override
	public List<BoardDto> getBoardList() throws Exception {
		// System.out.println("passed");
		return boardDao.getBoardList();
	}

	@Override
	public int deleteBoardList(int board_num) throws Exception{
		System.out.println("serviceimp");
		return boardDao.deleteBoardList(board_num);
	}
}
