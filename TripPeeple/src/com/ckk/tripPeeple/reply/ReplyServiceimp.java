package com.ckk.tripPeeple.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceimp implements ReplyService{
	@Autowired
	private ReplyDao replyDao;
	
	@Override
	public boolean insertReply(ReplyDto replyDto) throws Exception {
		boolean isc=false;
		if(replyDao.insertBoard(replyDto)!=0){
			isc=true;
		}
		return isc;
	}

	@Override
	public List<ReplyDto> getReplyList(int board_num) throws Exception {
		System.out.println(board_num);
		return replyDao.getReplyList(board_num);
	}
}
