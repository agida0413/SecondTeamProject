package com.sist.mapper;
import org.apache.ibatis.annotations.*;

import com.sist.vo.MemberVO;
public interface MemberMapper {
	
	//1.회원가입
	//1-1.아이디 중복체크
	@Select("SELECT COUNT(*) FROM Member "
			+ "WHERE userid=#{userid} ")
	public int memberIdCount(String userid);
	//1-2.회원가입 추가
	//1-2-1.일반회원가입추가 (typeno=2, admin=2)
	@Insert("INSERT INTO member(mno,typeno,admin,userid,userpwd,username,sex,addr1,addr2,phone,email,content,birth) "
			+ "VALUES(MEMBER_seq.nextval,2,2,#{userId},#{userPwd},#{userName},#{sex},#{addr1},#{addr2}, "
			+ "#{phone},#{email},#{content},#{birth})")
	public void memberInsert(MemberVO vo);
	//1-2-2.센터회원가입추가 (typeno=3, admin=2)
	@Insert("INSERT INTO member(mno,typeno,admin,userid,userpwd,username,centername,addr1,addr2,phone,email,content,birth) "
				+ "VALUES(MEMBER_seq.nextval,3,2,#{userId},#{userPwd},#{centerName},#{centerName},#{addr1},#{addr2}, "
				+ "#{phone},#{email},#{content},#{birth})")
	public void memberInsertCenter(MemberVO vo);
	//1-3.projectAuthority은 안만듬
	
	//2.로그인
    //2-1.ID존재여부 확인
	//전에만든 1-1 가져다 쓰면 됨
	//2-2.비밀번호 확인
	@Select("SELECT userId,userName,userPwd,enabled,centerName,admin,email,phone,mno "
			+ "FROM member "
			+ "WHERE userId=#{userId} ")
	public MemberVO memberLogin(String userId);
	
	//3. 비밀번호 찾기
	//3-1. 아이디 여부 확인
	@Select("SELECT COUNT(*) FROM member WHERE userId=#{userId}")
	public int FindID(String userId);
	//3-2. 이메일 여부 확인
	@Select("SELECT COUNT(*) FROM member WHERE userId=#{userId} AND email=#{email}")
	public int FindEmail(@Param("userId") String userId, @Param("email") String email);
	//3-3. 임시비밀번호 발급
	@Update("UPDATE member SET userPwd=#{temp} WHERE userId=#{userId}")
	public void updateMemberPwdById(@Param("temp") String temp, @Param("userId") String userId);
	
	//4. 아이디 찾기
	//4-1-1. 이메일로 아이디 찾기
	@Select("SELECT COUNT(*) FROM member WHERE email=#{email} ")
    public int selectMemberCountByEmail(String email);
	//4-1-2. 이메일로 찾은 아이디 일부 출력하기
	@Select("SELECT userId " +
            "FROM MEMBER " +
            "WHERE email=#{email}")
    public String selectMaskedIdByEmail(String email);
	
	//5. 회원정보 수정
		//5-1. 회원정보 불러오기
		@Select("SELECT userId,userName,userPwd,sex,birth,email,"
				+ "addr1,addr2,content "
				+ "FROM member WHERE userId=#{userId} ")
		public MemberVO memberUpdateDetail(String userId);
		//5-2. 회원정보 수정하기
		@Update("UPDATE member SET "
				+"userName=#{userName},sex=#{sex},birth=#{birth},"
				+ "email=#{email},addr1=#{addr1},"
				+"addr2=#{addr2},content=#{content} "
				+ "WHERE userId=#{userId}")
		public void memberUpdate(MemberVO vo);
	}









