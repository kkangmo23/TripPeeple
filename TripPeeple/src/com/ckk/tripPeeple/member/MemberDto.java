package com.ckk.tripPeeple.member;

import java.io.Serializable;

public class MemberDto implements Serializable {

	private static final long serialVersionUID = 5044205555033290470L;

	private int member_num;
	private String email;
	private String password;
	private String member_id;
	private String like_country;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getLike_country() {
		return like_country;
	}
	public void setLike_country(String like_country) {
		this.like_country = like_country;
	}
	
	
}
