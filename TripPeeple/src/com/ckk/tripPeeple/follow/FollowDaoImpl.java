package com.ckk.tripPeeple.follow;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class FollowDaoImpl implements FollowDao {
	
	@Autowired
	private SqlMapClient sqlMapClient;

	@Override
	public List<FollowDto> getFollowing(int member_num) throws Exception {
			List<FollowDto> lists = (List<FollowDto>)sqlMapClient.queryForList("follow.getFollowing",member_num);
		return lists;
	}

	@Override
	public List<FollowDto> getFollower(int member_num) throws Exception {
		List<FollowDto> lists = (List<FollowDto>)sqlMapClient.queryForList("follow.getFollower",member_num);
		return lists;
	}

	@Override
	public int deleteFollowing(int following_num) throws Exception {
		return sqlMapClient.delete("follow.deleteFollowing", following_num);
	}

	@Override
	public void insertFollowing(int follower_num,int member_num) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("follower_num", follower_num);
		map.put("member_num", member_num);
		sqlMapClient.insert("follow.insertFollowing", map);
	}

}
