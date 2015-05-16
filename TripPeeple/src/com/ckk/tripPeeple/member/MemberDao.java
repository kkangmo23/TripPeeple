package com.ckk.tripPeeple.member;

public interface MemberDao {
	public MemberDto memberLogin(String email) throws Exception;
	public int insertMember(MemberDto dto) throws Exception;
	public String checkEmail(String email) throws Exception;
}
