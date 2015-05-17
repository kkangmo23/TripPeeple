package com.ckk.tripPeeple.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class BoardDaoImp implements BoardDao{
	@Autowired
	private SqlMapClient sqlMapClient;

	@Override
	public int insertBoard(BoardDto boardDto) throws Exception{
		int seq=(int) sqlMapClient.insert("board.boardInsert", boardDto);
		System.out.println(seq);
		return seq;
	}

//	@Override
//	public List<BoardDto> getBoardList(int startRow, int endRow) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public BoardDto read(int boardNumber) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public int delete(int boardNumber, String password) {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//	@Override
//	public BoardDto updateRead(int boardNumber) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public int update(BoardDto boardDto) {
//		// TODO Auto-generated method stub
//		return 0;
//	}
	
}






