package com.ckk.tripPeeple.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlMapClient sqlMapClient;
	
	public MemberDto memberLogin(String email) throws Exception {		
		return (MemberDto) sqlMapClient.queryForObject("member.selectAll",email);
	}

	public int insertMember(MemberDto dto) throws Exception {
		int seq=(int) sqlMapClient.insert("member.insertMember", dto);
//		System.out.println(seq);
		return seq;
	}
	
	public String checkEmail(String email) throws Exception{
		return (String) sqlMapClient.queryForObject("member.checkEmail",email);
	}

	@Override
	public MemberDto getMemberData(String email) throws Exception {
		return (MemberDto) sqlMapClient.queryForObject("member.selectAll",email);
	}

	@Override
	public int updateMember(MemberDto dto) throws Exception {
		return sqlMapClient.update("member.updateMember",dto);
	}

	@Override
	public String checkId(String member_id) throws Exception {
		return (String) sqlMapClient.queryForObject("member.checkId",member_id);
	}

}
