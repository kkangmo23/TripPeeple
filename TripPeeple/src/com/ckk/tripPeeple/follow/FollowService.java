package com.ckk.tripPeeple.follow;

import java.util.List;

public interface FollowService {

	public List<FollowDto> getFollowing(int member_num) throws Exception;
	
}