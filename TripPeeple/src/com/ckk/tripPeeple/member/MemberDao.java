package com.ckk.tripPeeple.member;

public interface MemberDao {
	public MemberDto memberLogin(String email) throws Exception;
	public int insertMember(MemberDto dto) throws Exception;
	public String checkEmail(String email) throws Exception;
	public String checkId(String member_id) throws Exception;
	public MemberDto getMemberData(String email) throws Exception;
	public int updateMember(MemberDto dto) throws Exception;
}
