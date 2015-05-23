package com.ckk.tripPeeple.follow;

import java.io.Serializable;

public class FollowDto implements Serializable{

	private static final long serialVersionUID = 2849268774157327847L;

	private int member_num;
	private String member_id;
	private String follow_check;
	
	
	public String getFollow_check() {
		return follow_check;
	}
	public void setFollow_check(String follow_check) {
		this.follow_check = follow_check;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
}
