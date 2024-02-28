package com.sist.service;

import org.apache.ibatis.annotations.Param;

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
	
	//4. ���̵� ã��
	//4-1-1. �̸��Ϸ� ���̵� ã��
	public int selectMemberCountByEmail(String email);
	//4-1-2. �̸��Ϸ� ã�� ���̵� �Ϻ� ����ϱ�
	public String selectMaskedIdByEmail(String email);
	//4-1-3. �̸��� ��ġ��
	 public String idemailFind(String email);
	 
	//5. ȸ������ ����
		//5-1. ȸ������ �ҷ�����
		public MemberVO memberUpdateDetail(String userId);
		//5-2. ȸ������ �����ϱ�
		public String memberUpdate(MemberVO vo);
		public String memberDelete(String userId,String pwd);
}
