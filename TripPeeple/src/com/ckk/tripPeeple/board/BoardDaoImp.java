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
	public List<BoardDto> getBoardList() throws Exception {
		// System.out.println("passed");
		@SuppressWarnings("unchecked")
		List<BoardDto> boardList=(List<BoardDto>) sqlMapClient.queryForList("board.getBoardList");
		// System.out.println("a");
		
		return boardList;
	}
//
//	@Override
//	public BoardDto read(int boardNumber) {
//		// TODO Auto-generated method stub
//		return null;
//	}
	@Override
	public int deleteBoardList(int board_num) throws Exception {
		// System.out.println("boardimp");
		int check=sqlMapClient.delete("board.deleteBoardList", board_num);
		return check;
	}

	@Override
	public BoardDto updateRead(int board_num) throws Exception{
		// System.out.println("updateRead boardimp");
		BoardDto board=(BoardDto)sqlMapClient.queryForObject("board.boardUpdateRead", board_num);
		return board;
	}

	@Override
	public int updateBoard(BoardDto boardDto) throws Exception {
		// System.out.println("updateBoard boardimp");
		System.out.println(boardDto.getBoard_num());
		System.out.println(boardDto.getCity_num());
		System.out.println(boardDto.getContent());
		System.out.println(boardDto.getCreate_time());
		System.out.println(boardDto.getModify_time());
		int check=sqlMapClient.update("board.boardUpdateBoard", boardDto);
		return check;
	}
}






