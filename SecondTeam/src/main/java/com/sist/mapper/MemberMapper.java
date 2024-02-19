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
	@Select("SELECT userId,userName,userPwd,enabled "
			+ "FROM member "
			+ "WHERE userId=#{userId} ")
	public MemberVO memberLogin(String userId);
}







