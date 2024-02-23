package com.sist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO dao;

	@Override
	public int memberIdCount(String userid) {
		// TODO Auto-generated method stub
		return dao.memberIdCount(userid);
	}

	@Override
	public void memberInsert(MemberVO vo) {
		// TODO Auto-generated method stub
		dao.memberInsert(vo);
	}

	@Override
	public void memberInsertCenter(MemberVO vo) {
		// TODO Auto-generated method stub
		dao.memberInsertCenter(vo);
	}

	@Override
	public MemberVO memberLogin(String userId, String userPwd) {
		// TODO Auto-generated method stub
		return dao.memberLogin(userId, userPwd);
	}

	@Override
	public int FindID(String userId) {
		// TODO Auto-generated method stub
		return dao.FindID(userId);
	}

	@Override
	public int FindEmail(String userId, String email) {
		// TODO Auto-generated method stub
		return dao.FindEmail(userId, email);
	}

	@Override
	public void updateMemberPwdById(String temp, String userId) {
		// TODO Auto-generated method stub
		dao.updateMemberPwdById(temp, userId);
	}

	@Override
	public String pwdFind(String userId, String email, String temp) {
		// TODO Auto-generated method stub
		
		int countById = dao.FindID(userId);
		
		if(countById == 0)
		{
			return "IDNO";
		}
		else
		{
			int countByIdAndEmail = dao.FindEmail(userId, email);
			
			if(countByIdAndEmail == 1)
			{
				dao.updateMemberPwdById(temp, userId);
				return "SEND";
			}
			else
			{
				return "EMAILNO";
			}
		}
	}

	@Override
	public int selectMemberCountByEmail(String email) {
		// TODO Auto-generated method stub
		return dao.selectMemberCountByEmail(email);
	}

	@Override
	public String selectMaskedIdByEmail(String email) {
		// TODO Auto-generated method stub
		return dao.selectMaskedIdByEmail(email);
	}


	@Override
	public String idemailFind(String email) {
		// TODO Auto-generated method stub
		String maskedId="";
		int count =selectMemberCountByEmail(email);
		if(count==0)
			return "NO";
		else
			maskedId=selectMaskedIdByEmail(email);
		    System.out.println("이메일로찾은아이디(service):"+maskedId);
			return maskedId;
	}

	
	
}
