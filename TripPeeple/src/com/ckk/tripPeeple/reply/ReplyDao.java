package com.ckk.tripPeeple.reply;

import java.util.List;

public interface ReplyDao {

	int insertBoard(ReplyDto replyDto) throws Exception;

	List<ReplyDto> getReplyList(int Board_num) throws Exception;

	int updateReply(ReplyDto replyDto) throws Exception;

	int deleteReply(ReplyDto replyDto) throws Exception;
	
}
