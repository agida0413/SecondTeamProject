package com.sist.mapper;
import org.apache.ibatis.annotations.*;

import com.sist.vo.MemberVO;
public interface MemberMapper {
	
	//1.ȸ������
	//1-1.���̵� �ߺ�üũ
	@Select("SELECT COUNT(*) FROM Member "
			+ "WHERE userid=#{userid} ")
	public int memberIdCount(String userid);
	//1-2.ȸ������ �߰�
	//1-2-1.�Ϲ�ȸ�������߰� (typeno=2, admin=2)
	@Insert("INSERT INTO member(mno,typeno,admin,userid,userpwd,username,sex,addr1,addr2,phone,email,content,birth) "
			+ "VALUES(MEMBER_seq.nextval,2,2,#{userId},#{userPwd},#{userName},#{sex},#{addr1},#{addr2}, "
			+ "#{phone},#{email},#{content},#{birth})")
	public void memberInsert(MemberVO vo);
	//1-2-2.����ȸ�������߰� (typeno=3, admin=2)
	@Insert("INSERT INTO member(mno,typeno,admin,userid,userpwd,username,centername,addr1,addr2,phone,email,content,birth) "
				+ "VALUES(MEMBER_seq.nextval,3,2,#{userId},#{userPwd},#{centerName},#{centerName},#{addr1},#{addr2}, "
				+ "#{phone},#{email},#{content},#{birth})")
	public void memberInsertCenter(MemberVO vo);
	//1-3.projectAuthority�� �ȸ���
	
	//2.�α���
    //2-1.ID���翩�� Ȯ��
	//�������� 1-1 ������ ���� ��
	//2-2.��й�ȣ Ȯ��
	@Select("SELECT userId,userName,userPwd,enabled,centerName,admin,email,phone,mno "
			+ "FROM member "
			+ "WHERE userId=#{userId} ")
	public MemberVO memberLogin(String userId);
}






