package com.sist.service;

import com.sist.vo.MemberVO;

public interface MemberService {
	//1-1.���̵� �ߺ�üũ
	public int memberIdCount(String userid);
	//1-2-1.ȸ������ �߰�
	public void memberInsert(MemberVO vo);
	//1-2-2.����ȸ������ �߰�
	public void memberInsertCenter(MemberVO vo);
	//2-2. �α���-��й�ȣȮ��
	public MemberVO memberLogin(String userId, String userPwd);
	//3. ��й�ȣ ã��
	//3-1. ���̵� ���� Ȯ��
	public int FindID(String userId);
	//3-2. �̸��� ���� Ȯ��
	public int FindEmail(String userId, String email);
	//3-3. �ӽú�й�ȣ �߱�
	public void updateMemberPwdById(String temp,String userId);
	//3-4. 3-1~3-3��ġ��
	public String pwdFind(String id, String email, String temp);
}
