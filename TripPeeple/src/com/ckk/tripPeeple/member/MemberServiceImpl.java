package com.ckk.tripPeeple.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public MemberDto memberLogin(String email, String password) throws Exception {
		return memberDao.memberLogin(email);
	}
	
	public boolean checkEmail(String email) throws Exception {
			boolean isc= true;
			String check = memberDao.checkEmail(email);
			if(check != null){ isc=false;}
		return isc;
	}

	@Override
	public boolean insertMember(MemberDto dto) throws Exception {
		boolean isc=false;
		if(memberDao.insertMember(dto)!=0){
			isc=true;
		}
		return isc;
	}

	@Override
	public MemberDto getMemberData(String email) throws Exception {
		return memberDao.getMemberData(email);
	}

	@Override
	public boolean updateMember(MemberDto dto) throws Exception {
		return memberDao.updateMember(dto)>0?true:false;
	}

	@Override
	public boolean checkId(String member_id) throws Exception {
		return (memberDao.checkId(member_id)!=null)?false:true;
	}
}
