package com.ckk.tripPeeple.follow;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class FollowDaoImpl implements FollowDao {
	
	@Autowired
	private SqlMapClient sqlMapClient;

	@Override
	public List<FollowDto> getFollowing(int member_num) throws Exception {
			List<FollowDto> lists = sqlMapClient.queryForList("follow.getFollowing",member_num);
		return lists;
	}

}
