package com.sist.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.*;
import com.sist.vo.MoimListVO;
import com.sist.vo.MoimReplyVO;
import com.sist.vo.MoimReserveVO;

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
	@Select("SELECT mrno,rno,userid,username,msg,TO_CHAR(regdate,'YYYY-MM-DD')as dbday "
			+ "FROM MOIM_REPLY WHERE rno=#{rno} "
			+ "ORDER BY mrno DESC")
	public List<MoimReplyVO> MoimReplyData(int mrno);
	
	//추가
	@Insert("INSERT INTO MOIM_REPLY VALUES( "
			+ "mr_mrno_seq.nextval, #{rno}, #{userid}, #{username}, #{msg}, SYSDATE) ")
	public void MoimReplyInsert(MoimReplyVO vo);
	
	//수정
	@Update("UPDATE MOIM_REPLY SET msg=#{msg} "
			+ "WHERE mrno=#{mrno}")
	public void MoimReplyUpdate(MoimReplyVO vo);
	
	//삭제
	@Delete("DELETE FROM MOIM_REPLY WHERE mrno=#{mrno}")
	public void MoimReplyDelete(int mrno);
	
	//공간예약
	//예약가능 공간 리스트 출력
	@Select("SELECT rno,img,loc "
			+ "FROM moim_list "
			+ "WHERE type LIKE '%'||#{type}||'%'")
	public List<MoimListVO> moimReserveData(String type);
	
	//예약한값 테이블에 추가히기
	@Insert("INSERT INTO moim_reserve (mno, rno, userId, rDate, rTime, rInwon, regdate, reserve_ok) " +
            "VALUES (mr_mno_seq.nextval, #{rno}, #{userId}, #{rDate}, #{rTime}, #{rInwon}, SYSDATE, 0)")
    public void moimReserveInsert(MoimReserveVO vo);
	
	//예약한값 마이페이지에서 출력
	@Results({
	    @Result(column = "loc", property = "mvo.loc"),
	    @Result(column = "img", property = "mvo.img")
	})
	@Select("SELECT mno, r.rno,loc,img,rDate,rTime,rInwon, "
			+ "reserve_ok,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS')as dbday "
			+ "FROM moim_reserve r, moim_list m "
			+ "WHERE r.rno=m.rno AND userId=#{userId} "
			+ "ORDER BY mno DESC ")
	public List<MoimReserveVO> reserveMyPageData(String userId);
	
	//예약취소
	@Delete("DELETE FROM moim_reserve WHERE mno=#{mno} ")
	public void reserveMypageCancel(int mno);
	
}
