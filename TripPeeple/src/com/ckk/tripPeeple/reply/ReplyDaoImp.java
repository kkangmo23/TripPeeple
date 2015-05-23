package com.ckk.tripPeeple.reply;

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
		System.out.println(seq);
		return seq;
	}

}
