package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.DonClassResHistoryVO;
import com.sist.vo.DonClassReserveVO;
import com.sist.vo.DonClassVO;

public interface DonClassReserveMapper {

	@Select("SELECT SUM(CAN_NUM) FROM DC_RESERVE2 WHERE DCNO=#{dcno} AND MONTH=#{month} "
			+"GROUP BY MONTH,DAY")
	public List<Integer> monthInwonList(Map map);
	
	@Select("SELECT rno,s_time,e_time,can_num FROM DC_RESERVE2 "
			+"WHERE month=#{month} AND day=#{day} AND DCNO=#{dcno}")
	public List<DonClassReserveVO> reserveInform(Map map);
	
	@Insert("INSERT INTO DC_RESERVE_HISTORY VALUES("
			+"DC_RESERVE_HISTORY_SEQ.nextval,#{dcno},#{userid},sysdate,#{cdate},#{state},#{rnum},#{wing},#{rno})")
	public void insertReserveInform(DonClassResHistoryVO vo);
	
	@Update("UPDATE DC_RESERVE2 SET "
			+"can_num=can_num-#{rnum} "
			+"WHERE rno=#{rno}")
	public void resCanNumMinus(@Param("rnum") int rnum,@Param("rno")int rno);
	
	@Update("UPDATE DC_RESERVE2 SET "
			+"can_num=can_num+#{rnum} "
			+"WHERE rno=#{rno}")
	public void resCanNumPlus(@Param("rnum") int rnum,@Param("rno")int rno);
	
	@Update("UPDATE MEMBER SET "
			+"wing=wing-#{wing} "
			+"WHERE USERID=#{userid}")
	public void UpdateUserMinusWing(@Param("wing")int wing,@Param("userid")String userid);
	
	@Update("UPDATE MEMBER SET "
			+"wing=wing+#{wing} "
			+"WHERE USERID=#{userid}")
	public void UpdateUserPlusWing(@Param("wing")int wing,@Param("userid")String userid);
	
	@Select("SELECT wing FROM MEMBER WHERE userid=#{userid}")
	public int userWing(String userid);
	
	@Update("UPDATE dc_reserve_history SET "
			+"state=#{state} "
			+"WHERE rhno=#{rhno}")
	public void updateResState(DonClassResHistoryVO vo);
	
	@Results({
		@Result(property = "hvo.rdate" ,column="rdate"),
		@Result(property = "hvo.dbRdate" ,column="dbRdate"),
		@Result(property = "hvo.cdate" ,column="cdate"),
		@Result(property = "hvo.state" ,column="state"),
		@Result(property = "hvo.rnum" ,column="rnum"),
		@Result(property = "hvo.wing" ,column="getwing"),
		@Result(property = "hvo.rno" ,column="rno"),
		@Result(property = "hvo.rhno" ,column="rhno")
	
		
})
	@Select("SELECT dcno,name,id,cls_level,time,full_num,image,address,category,wing,score,TO_CHAR(rdate,'YYYY- MM-DD HH24:MI:SS') as dbRdate, "
			+"cdate,state,rnum,getwing,rno,rhno,num "
			+ "	FROM (SELECT dcno,name,id,cls_level,time,full_num,image,address,category,wing,score,rdate,cdate,state,rnum,getwing,rno,rhno,ROWNUM as num "
			+ "	FROM (SELECT b.dcno,name,a.id,cls_level,time,full_num,image,address,category,a.wing,score,rdate,cdate,state,rnum,b.wing as getwing,rno,rhno "
			+ "	FROM donate_class a "
			+"JOIN dc_reserve_history b ON "
			+"a.dcno=b.dcno "
			+"WHERE "
			+"b.userid=#{userid} ORDER BY b.rdate DESC)) "
			+"WHERE num between #{start} AND #{end}"
			)
	public List<DonClassVO> donClassReserveHistoryList(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/5.0) FROM dc_reserve_history "
			+"WHERE userid=#{userid}")
	public int donClassReserveHistoryTotalPage(String userid);
	
	
}
