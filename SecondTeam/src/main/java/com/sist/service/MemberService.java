package com.sist.service;

import com.sist.vo.MemberVO;

public interface MemberService {
	//1-1.아이디 중복체크
	public int memberIdCount(String userid);
	//1-2-1.회원가입 추가
	public void memberInsert(MemberVO vo);
	//1-2-2.센터회원가입 추가
	public void memberInsertCenter(MemberVO vo);
	//2-2. 로그인-비밀번호확인
	public MemberVO memberLogin(String userId, String userPwd);
}
