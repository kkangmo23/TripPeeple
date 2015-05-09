package com.ckk.tripPeeple.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl {
	
	@Autowired
	private UserDaoImpl userDao;
	
	public boolean userLogin(String userId, String userPwd) throws Exception {
		return (userPwd == userDao.selectPwd(userId));
	}

}
