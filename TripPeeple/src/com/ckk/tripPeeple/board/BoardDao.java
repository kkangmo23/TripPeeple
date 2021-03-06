package com.ckk.tripPeeple.board;

import java.util.List;


public interface BoardDao {
	public int insertBoard(BoardDto boardDto) throws Exception;

	public List<BoardDto> getBoardList() throws Exception;
	
	public BoardDto updateRead(int boardNumber) throws Exception;

	public int deleteBoardList(int board_num)throws Exception;

	public int updateBoard(BoardDto boardDto) throws Exception;

	public List<BoardDto> getSearchList(String search) throws Exception;

	public int updateLike(int board_num) throws Exception;
}
