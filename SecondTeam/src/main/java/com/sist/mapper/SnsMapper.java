package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

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
	
	//sns페이지 본인+팔로우 게시글 출력
	@Select("SELECT sno, id, pic, name, regdate, content "
			+ "FROM SNS_PAGE "
			+ "WHERE id = #{id} "
			+ "OR id IN ( "
			+ "SELECT sns_follow.f_id "
			+ "FROM SNS_FOLLOW "
			+ "WHERE sns_follow.id = #{id}) "
			+ "ORDER BY sno DESC ")
	public List<SnsMyContentVO> snsMyContentList(String id);
	
	//sns id 목록중 4명 랜덤출력
	@Select("SELECT mno, id, name, num "
			+ "FROM (SELECT mno, id, name, rownum AS num "
			+ "FROM (SELECT mno, id, name "
			+ "FROM MEMBER WHERE TYPENO =2 ORDER BY dbms_random.value )) "
			+ "WHERE num BETWEEN 1 AND 4 ")
	public List<SnsIdVO> snsIdList();
	
	//////////////////////////////게시글crud////////////////////////////////////
	//insert
	@Insert("INSERT INTO SNS_PAGE (sno, id, name, regdate, content, filename, filesize, filecount) "
	        + "VALUES (sp_sno_seq.nextval, #{id}, #{name}, sysdate, #{content}, #{filename}, #{filesize}, #{filecount})")
	public void snsPageInsert(SnsMyContentVO vo);

}
