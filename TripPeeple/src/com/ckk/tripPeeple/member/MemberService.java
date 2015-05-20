package com.ckk.tripPeeple.member;

public interface MemberService {
	public MemberDto memberLogin(String email, String password) throws Exception;
	public boolean insertMember(MemberDto dto) throws Exception;
	public boolean checkEmail(String email) throws Exception;
	public boolean checkId(String member_id) throws Exception;
	public MemberDto getMemberData(String email) throws Exception;
	public boolean updateMember(MemberDto dto) throws Exception;
}
