package com.ckk.tripPeeple.follow;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FollowServiceImpl implements FollowService {

	@Autowired
	private FollowDao followDao;
	
	@Override
	public List<FollowDto> getFollowing(int member_num) throws Exception {
		List<FollowDto> lists = followDao.getFollowing(member_num);
		return lists;
	}

}
