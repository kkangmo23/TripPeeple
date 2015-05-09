package com.ckk.tripPeeple.user;

import java.io.Serializable;

public class UserDto implements Serializable{

	private static final long serialVersionUID = -7110828878968504191L;
	
	private String userId;
	private String userPwd;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	
	

}
