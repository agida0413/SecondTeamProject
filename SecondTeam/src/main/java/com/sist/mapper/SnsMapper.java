package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.MoimReplyVO;
import com.sist.vo.SnsIdVO;
import com.sist.vo.SnsKeepVO;
import com.sist.vo.SnsMyContentVO;

public interface SnsMapper {
	
	//임시보호동물게시글 5개 랜덤출력
	@Select("SELECT kano, keeploc, keeptitle, keepregdate, keepimage, keepwriter, num "
			+ "FROM (SELECT kano, keeploc, keeptitle, keepregdate, keepimage, keepwriter, rownum AS num "
			+ "FROM (SELECT kano, keeploc, keeptitle, keepregdate, keepimage, keepwriter "
			+ "FROM SNS_KEEP  ORDER BY dbms_random.value )) "
			+ "WHERE num BETWEEN 5 AND 9")
	public List<SnsKeepVO> snsKeepList();
	
	//임시보호동물게시글 5개 다이얼로그 디테일출력
	@Select("SELECT kano,keeploc,keeptitle,keepwriter,keepregdate,keepregdate,keepaddr,keepimage,keepcontent "
			+ "FROM SNS_KEEP WHERE kano=#{kano} ")
	public SnsKeepVO snsKeepDetailData(int kano);
	
	//sns id 목록중 4명 랜덤출력
	@Select("SELECT mno, userid, username, num "
			+ "FROM (SELECT mno, userid, username, rownum AS num "
			+ "FROM (SELECT mno, userid, username "
			+ "FROM MEMBER WHERE TYPENO =2 ORDER BY dbms_random.value )) "
			+ "WHERE num BETWEEN 1 AND 4 ")
	public List<SnsIdVO> snsIdList();
	
	//sns crud
	//sns페이지 본인+팔로우 게시글 출력
		@Select("SELECT sno, userid, username, regdate, content "
				+ "FROM SNS_PAGE "
				+ "WHERE userid = #{userid} "
				+ "OR userid IN ( "
				+ "SELECT sns_follow.f_id "
				+ "FROM SNS_FOLLOW "
				+ "WHERE sns_follow.userid = #{userid}) "
				+ "ORDER BY sno DESC ")
		public List<SnsMyContentVO> snsMyContentList(String userid);
		
	//sns insert
	@Insert("INSERT INTO sns_page VALUES( "
			+ "sp_sno_seq.nextval, #{userid}, #{username}, SYSDATE, #{content}) ")
	public void SnsInsert(SnsMyContentVO vo);
	
	//sns delete
	@Delete("DELETE FROM sns_page WHERE sno=#{sno}")
	public void SnsDelete(int sno);
	
	//sns update
	@Update("UPDATE sns_page SET content=#{content} WHERE sno=#{sno} ")
	public void SnsUpdate(SnsMyContentVO vo);
	//update sno 하나 더 만듬
		@Select("SELECT sno, userid, username, content,TO_CHAR(regdate,'YYYY-MM-DD')as dbday "
				+ "FROM sns_page WHERE sno=#{sno} "
				+ "ORDER BY sno DESC")
		public List<SnsMyContentVO> snsMyContentList2(int sno);

}
