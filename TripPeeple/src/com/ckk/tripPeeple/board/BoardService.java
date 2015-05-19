package com.ckk.tripPeeple.board;

import java.util.List;

public interface BoardService {
	public boolean insertBoard(BoardDto boardDto) throws Exception;

	public List<BoardDto> getBoardList(int board_num) throws Exception;
}
