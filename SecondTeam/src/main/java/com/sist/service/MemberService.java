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
}
