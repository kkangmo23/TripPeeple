package com.ckk.tripPeeple.follow;

import java.io.Serializable;

public class FollowDto implements Serializable{

	private static final long serialVersionUID = 2849268774157327847L;

	private int member_num;
	private String email;
	private String member_id;
	
	
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
}
