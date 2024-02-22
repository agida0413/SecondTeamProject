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
	//3. 비밀번호 찾기
	//3-1. 아이디 여부 확인
	public int FindID(String userId);
	//3-2. 이메일 여부 확인
	public int FindEmail(String userId, String email);
	//3-3. 임시비밀번호 발급
	public void updateMemberPwdById(String temp,String userId);
	//3-4. 3-1~3-3합치기
	public String pwdFind(String id, String email, String temp);
}
