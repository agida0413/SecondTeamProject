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
	
	//��ȣȭ������ ������
	@Autowired
	private BCryptPasswordEncoder encoder;
		
	@Autowired
	private MemberMapper mapper;
	
	//1-1.���̵� �ߺ�üũ
	public int memberIdCount(String userid)
	{
		return mapper.memberIdCount(userid);
	}
	//1-2-1.�Ϲ�ȸ������ �߰�
	public void memberInsert(MemberVO vo)
	{
		mapper.memberInsert(vo);
	}
	//1-2-2.����ȸ������ �߰�
	public void memberInsertCenter(MemberVO vo)
	{
		mapper.memberInsertCenter(vo);
	}
	
	//2-2-2. �α���-��й�ȣȮ��
	public MemberVO memberLogin(String userId, String userPwd)
	{
		MemberVO dbVO=new MemberVO();
		int count=mapper.memberIdCount(userId);
		if(count==0)
		{
			//���̵� ������
			dbVO.setMsg("NOID");
		}
		else
		{
			dbVO=mapper.memberLogin(userId);
			//��ȣȭ�Ǿ��ִºκ� ��ȣȭ�ؼ� �ٿ������
			if(encoder.matches(userPwd, dbVO.getUserPwd()))
			{
				//�α��μ���
				//System.out.println(dbVO.getUserId());
				dbVO.setMsg("OK");
			}
			else
			{
				//��й�ȣ����ġ
				dbVO.setMsg("NOPWD");
			}
		}
		return dbVO;
	}
	
	//3. ��й�ȣ ã��
	//3-1. ���̵� ���� Ȯ��
	public int FindID(String userId)
	{
		return mapper.FindID(userId);
	}
	//3-2. �̸��� ���� Ȯ��
	public int FindEmail(String userId, String email)
	{
		return mapper.FindEmail(userId, email);
	}
	//3-3. �ӽú�й�ȣ �߱�
	public void updateMemberPwdById(String temp,String userId)
	{
		mapper.updateMemberPwdById(temp, userId);
	}
	
	//4. ���̵� ã��
	//4-1-1. �̸��Ϸ� ���̵� ã��
	public int selectMemberCountByEmail(String email)
	{
		return mapper.selectMemberCountByEmail(email);
	}
	//4-1-2. �̸��Ϸ� ã�� ���̵� �Ϻ� ����ϱ�
	public String selectMaskedIdByEmail(String email)
	{
		return mapper.selectMaskedIdByEmail(email);
	}
	
	//5. ȸ������ ����
		//5-1. ȸ������ �ҷ�����
		public MemberVO memberUpdateDetail(String userId)
		{
			return mapper.memberUpdateDetail(userId);
		}
		public String memberUpdate(MemberVO vo)
		{
			  String result="yes";
		      mapper.memberUpdate(vo);
		      System.out.println("yes/no result��(DAO)"+result);
		      
		       return result;

		}
		
		public void memberDelete(String userId) {
			mapper.memberDelete(userId);
		}
}
