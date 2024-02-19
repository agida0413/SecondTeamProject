package com.sist.dao;

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

}
