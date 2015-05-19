package com.ckk.tripPeeple.board;

import java.util.List;


public interface BoardDao {
	public int insertBoard(BoardDto boardDto) throws Exception;

	public List<BoardDto> getBoardList(int board_num) throws Exception;
//	public List<BoardDto> getBoardList(int startRow, int endRow);
//	
//	public BoardDto read(int boardNumber);
//	public int delete(int boardNumber, String password);
//	
//	public BoardDto updateRead(int boardNumber);
//	public int update(BoardDto boardDto);
}
