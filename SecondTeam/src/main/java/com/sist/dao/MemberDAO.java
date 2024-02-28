package com.sist.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.sist.mapper.MemberMapper;
import com.sist.vo.MemberVO;

@Repository
public class MemberDAO {
	
	//복호화를위해 가져옴
	@Autowired
	private BCryptPasswordEncoder encoder;
		
	@Autowired
	private MemberMapper mapper;
	
	//1-1.아이디 중복체크
	public int memberIdCount(String userid)
	{
		return mapper.memberIdCount(userid);
	}
	//1-2-1.일반회원가입 추가
	public void memberInsert(MemberVO vo)
	{
		mapper.memberInsert(vo);
	}
	//1-2-2.센터회원가입 추가
	public void memberInsertCenter(MemberVO vo)
	{
		mapper.memberInsertCenter(vo);
	}
	
	//2-2-2. 로그인-비밀번호확인
	public MemberVO memberLogin(String userId, String userPwd)
	{
		MemberVO dbVO=new MemberVO();
		int count=mapper.memberIdCount(userId);
		if(count==0)
		{
			//아이디 없을때
			dbVO.setMsg("NOID");
		}
		else
		{
			dbVO=mapper.memberLogin(userId);
			//암호화되어있는부분 복호화해서 붙여줘야함
			if(encoder.matches(userPwd, dbVO.getUserPwd()))
			{
				//로그인성공
				//System.out.println(dbVO.getUserId());
				dbVO.setMsg("OK");
			}
			else
			{
				//비밀번호불일치
				dbVO.setMsg("NOPWD");
			}
		}
		return dbVO;
	}
	
	//3. 비밀번호 찾기
	//3-1. 아이디 여부 확인
	public int FindID(String userId)
	{
		return mapper.FindID(userId);
	}
	//3-2. 이메일 여부 확인
	public int FindEmail(String userId, String email)
	{
		return mapper.FindEmail(userId, email);
	}
	//3-3. 임시비밀번호 발급
	public void updateMemberPwdById(String temp,String userId)
	{
		mapper.updateMemberPwdById(temp, userId);
	}
	
	//4. 아이디 찾기
	//4-1-1. 이메일로 아이디 찾기
	public int selectMemberCountByEmail(String email)
	{
		return mapper.selectMemberCountByEmail(email);
	}
	//4-1-2. 이메일로 찾은 아이디 일부 출력하기
	public String selectMaskedIdByEmail(String email)
	{
		return mapper.selectMaskedIdByEmail(email);
	}
	
	//5. 회원정보 수정
		//5-1. 회원정보 불러오기
		public MemberVO memberUpdateDetail(String userId)
		{
			return mapper.memberUpdateDetail(userId);
		}
		public String memberUpdate(MemberVO vo)
		{
			  String result="yes";
		      mapper.memberUpdate(vo);
		      System.out.println("yes/no result값(DAO)"+result);
		      
		       return result;

		}
}
