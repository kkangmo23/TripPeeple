package com.ckk.tripPeeple.board;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ckk.tripPeeple.reply.ReplyDao;

@Service
public class BoardServiceimp implements BoardService{
	@Autowired
	private BoardDao boardDao;
	@Autowired
	private ReplyDao replyDao;
	
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
		List<BoardDto> boardList = new ArrayList<BoardDto>();
		boardList = boardDao.getBoardList();
		for (int i = 0; i < boardList.size(); i++) {
			boardList.get(i).setReplyList(
					replyDao.getReplyList(boardList.get(i).getBoard_num()));
		}
		return boardList;
	}

	@Override
	public int deleteBoardList(int board_num) throws Exception{
		// System.out.println("delete serviceimp");
		return boardDao.deleteBoardList(board_num);
	}

	@Override
	public BoardDto updateRead(int board_num) throws Exception{
		// System.out.println("updateRead serviceimp");
		return boardDao.updateRead(board_num);
	}

	@Override
	public int updateBoard(BoardDto boardDto) throws Exception {
		// System.out.println("updateBoard serviceimp");
		return boardDao.updateBoard(boardDto);
	}

	@Override
	public List<BoardDto> getSearchList(String search) throws Exception {
		// System.out.println("searchBoard serviceimp");
		return boardDao.getSearchList(search);
	}

	@Override
	public boolean updateLike(int board_num) throws Exception {
		boolean isc=false;
		if(boardDao.updateLike(board_num)!=0){
			isc=true;
		}
		return isc;
	}
}
