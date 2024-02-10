package com.sist.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.*;
import com.sist.vo.MoimListVO;
import com.sist.vo.MoimReplyVO;

public interface MoimListMapper {
	@Select("SELECT rno,img,loc,type,time,content "
			+"FROM moim_list "
			+"WHERE rno=12 OR rno=13 OR rno=17")
	public List<MoimListVO> moimMainData();
	
	//공간대여리스트
	@Select("SELECT rno,beam,pc,printer,mic,img,loc,center,type,time,addr1,num "
			+ "FROM (SELECT rno,beam,pc,printer,mic,img,loc,center,type,time,addr1,rownum as num "
			+ "FROM (SELECT rno,beam,pc,printer,mic,img,loc,center,type,time,addr1 "
			+ "FROM MOIM_LIST WHERE addr1 LIKE '%'||#{tt}||'%')) "
			+ "WHERE num BETWEEN #{start} AND #{end} ")
	public List<MoimListVO> moimListData(Map map);
	@Select("SELECT CEIL(COUNT(*)/6.0) FROM MOIM_LIST WHERE addr1 LIKE '%'||#{tt}||'%' ")
	public int moimTotalPage(Map map);
	
	//공간대여디테일
	@Select("SELECT rno,img,loc,type,num,center,time,addr1,call,cost, "
			+ "food,method,page,test1,test2,content,beam,pc,printer,mic "
			+ "FROM MOIM_LIST WHERE rno=#{rno} ")
	public MoimListVO moimDetailData(int rno);
	
	//공간대여디테일_댓글
	@Select("SELECT mrno,rno,id,name,msg,TO_CHAR(regdate,'YYYY-MM-DD')as dbday "
			+ "FROM MOIM_REPLY WHERE rno=#{rno} "
			+ "ORDER BY mrno DESC")
	public List<MoimReplyVO> MoimReplyData(int mrno);
	
	//추가
	@Insert("INSERT INTO MOIM_REPLY VALUES( "
			+ "mr_mrno_seq.nextval, #{rno}, #{id}, #{name}, #{msg}, SYSDATE) ")
	public void MoimReplyInsert(MoimReplyVO vo);
	
	//수정
	@Update("UPDATE MOIM_REPLY SET msg=#{msg} "
			+ "WHERE mrno=#{mrno}")
	public void MoimReplyUpdate(MoimReplyVO vo);
	
	//삭제
	@Delete("DELETE FROM MOIM_REPLY WHERE mrno=#{mrno}")
	public void MoimReplyDelete(int mrno);
}
