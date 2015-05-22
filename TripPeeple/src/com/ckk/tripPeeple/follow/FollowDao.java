package com.ckk.tripPeeple.follow;

import java.util.List;

public interface FollowDao {

	public List<FollowDto> getFollowing(int member_num) throws Exception;
	
}
