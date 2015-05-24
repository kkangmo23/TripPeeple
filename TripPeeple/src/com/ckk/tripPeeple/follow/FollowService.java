package com.ckk.tripPeeple.follow;

import java.util.List;

public interface FollowService {

	public List<FollowDto> getFollowing(int member_num) throws Exception;
	public List<FollowDto> getFollower(int member_num) throws Exception;
	public int deleteFollowing(int following_num) throws Exception;
	public void insertFollowing(int follower_num,int member_num) throws Exception;
}
