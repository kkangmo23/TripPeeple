package com.ckk.tripPeeple.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private SqlMapClient sqlMapClient;
	
	public String selectPwd(String userId) throws Exception {
		return (String)sqlMapClient.queryForObject("user.selectPwd", userId);
	}
	
}
