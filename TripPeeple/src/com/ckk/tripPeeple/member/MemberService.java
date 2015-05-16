package com.ckk.tripPeeple.member;

public interface MemberService {
	public MemberDto memberLogin(String email, String password) throws Exception;
	public boolean insertMember(MemberDto dto) throws Exception;
	public boolean checkEmail(String email) throws Exception;
}
