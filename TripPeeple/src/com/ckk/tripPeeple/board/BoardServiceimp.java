package com.ckk.tripPeeple.board;

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
}
