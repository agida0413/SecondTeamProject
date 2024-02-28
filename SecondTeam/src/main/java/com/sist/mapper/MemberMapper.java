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
	
	//3. ��й�ȣ ã��
	//3-1. ���̵� ���� Ȯ��
	@Select("SELECT COUNT(*) FROM member WHERE userId=#{userId}")
	public int FindID(String userId);
	//3-2. �̸��� ���� Ȯ��
	@Select("SELECT COUNT(*) FROM member WHERE userId=#{userId} AND email=#{email}")
	public int FindEmail(@Param("userId") String userId, @Param("email") String email);
	//3-3. �ӽú�й�ȣ �߱�
	@Update("UPDATE member SET userPwd=#{temp} WHERE userId=#{userId}")
	public void updateMemberPwdById(@Param("temp") String temp, @Param("userId") String userId);
	
	//4. ���̵� ã��
	//4-1-1. �̸��Ϸ� ���̵� ã��
	@Select("SELECT COUNT(*) FROM member WHERE email=#{email} ")
    public int selectMemberCountByEmail(String email);
	//4-1-2. �̸��Ϸ� ã�� ���̵� �Ϻ� ����ϱ�
	@Select("SELECT userId " +
            "FROM MEMBER " +
            "WHERE email=#{email}")
    public String selectMaskedIdByEmail(String email);
	
	//5. ȸ������ ����
		//5-1. ȸ������ �ҷ�����
		@Select("SELECT userId,userName,userPwd,sex,birth,email,"
				+ "addr1,addr2,content "
				+ "FROM member WHERE userId=#{userId} ")
		public MemberVO memberUpdateDetail(String userId);
		//5-2. ȸ������ �����ϱ�
		@Update("UPDATE member SET "
				+"userName=#{userName},sex=#{sex},birth=#{birth},"
				+ "email=#{email},addr1=#{addr1},"
				+"addr2=#{addr2},content=#{content} "
				+ "WHERE userId=#{userId}")
		public void memberUpdate(MemberVO vo);
		
		// 탈퇴
		@Delete("DELETE FROM member "
				+ "WHERE userId=#{userId}")
		public void memberDelete(String userId);
	}









