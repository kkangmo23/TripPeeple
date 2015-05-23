package com.ckk.tripPeeple.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ReplyDaoImp implements ReplyDao {
	@Autowired
	private SqlMapClient sqlMapClient;
	
	@Override
	public int insertBoard(ReplyDto replyDto) throws Exception {
		int seq=(int) sqlMapClient.insert("reply.replyInsert", replyDto);
		// System.out.println(seq);
		return seq;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ReplyDto> getReplyList(int Board_num) throws Exception {
		List<ReplyDto> replyDto=(List<ReplyDto>) sqlMapClient.queryForList("board.getReplyList");
		// System.out.println("a");
		
		return replyDto;
	}

}
