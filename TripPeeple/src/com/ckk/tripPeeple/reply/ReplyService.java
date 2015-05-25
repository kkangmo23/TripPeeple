package com.ckk.tripPeeple.reply;

import java.util.List;

public interface ReplyService {

	public boolean insertReply(ReplyDto replyDto) throws Exception;
	public boolean updateReply(ReplyDto replyDto) throws Exception;
	public boolean deleteReply(ReplyDto replyDto) throws Exception;
	public List<ReplyDto> getReplyList(int board_num) throws Exception;

}
