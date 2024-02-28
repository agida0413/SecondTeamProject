package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;
public interface DonationReplyMapper {
	// 메인 댓글
	@Select("SELECT rno,dno,writer,msg,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,group_id,group_tab,group_step,root,depth,num "
			+ "FROM (SELECT rno,dno,writer,msg,regdate,group_id,group_tab,group_step,root,depth,rownum as num "
			+ "FROM (SELECT rno,dno,writer,msg,regdate,group_id,group_tab,group_step,root,depth "
			+ "FROM donation_reply WHERE dno=#{dno} ORDER BY rno DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<DonationReplyVO> donationMainReplyListData(Map map);
	
	// 메인댓글 토탈
	@Select("SELECT CEIL(COUNT(*)/5.0) FROM donation_reply "
			+ "WHERE dno=#{dno}")
	public int donationReplyTotalPage(int dno);
	
	// root댓글의 대댓글 리스트
	@Select("SELECT rno,dno,writer,msg,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,group_id,group_tab,group_step,root,depth "
			+ "FROM donation_reply "
			+ "WHERE root=#{root} "
			+ "ORDER BY DESC")
	public List<DonationReplyVO> donationSubReplyListData(int root);
	
	// insert
	@Insert("INSERT INTO donation_reply(rno,dno,writer,msg,regdate,root,depth) "
			+ "VALUES(dr_rno_seq.nextval,#{dno},#{writer},#{msg},SYSDATE,#{root},#{depth})")
	public void donationReplyInsert(DonationReplyVO vo);
	// update
	@Update("UPDATE donation_reply "
			+ "SET msg=#{msg} "
			+ "WHERE rno=#{rno}")
	public void donationReplyUpdate(DonationReplyVO vo);
	
	// delete
	@Delete("DELETE FROM donation_reply "
			+ "WHERE rno=#{rno}")
	public void donationReplyDelete(int rno);
}
