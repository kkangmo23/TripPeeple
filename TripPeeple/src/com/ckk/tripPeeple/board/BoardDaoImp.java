package com.ckk.tripPeeple.board;

import java.util.List;

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
		// System.out.println(seq);
		return seq;
	}

	@Override
	public List<BoardDto> getBoardList(int board_num) throws Exception {
		System.out.println("asdfasdf");
		List<BoardDto> boardList=(List<BoardDto>) sqlMapClient.queryForObject("board.getBoardList",board_num);
		// System.out.println("asdfaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
		
		return boardList;
	}


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






