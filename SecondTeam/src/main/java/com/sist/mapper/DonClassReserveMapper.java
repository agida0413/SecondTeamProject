package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.DonClassResHistoryVO;
import com.sist.vo.DonClassReserveVO;

public interface DonClassReserveMapper {

	@Select("SELECT SUM(CAN_NUM) FROM DC_RESERVE2 WHERE DCNO=#{dcno} AND MONTH=#{month} "
			+"GROUP BY MONTH,DAY")
	public List<Integer> monthInwonList(Map map);
	
	@Select("SELECT rno,s_time,e_time,can_num FROM DC_RESERVE2 "
			+"WHERE month=#{month} AND day=#{day} AND DCNO=#{dcno}")
	public List<DonClassReserveVO> reserveInform(Map map);
	
	@Insert("INSERT INTO DC_RESERVE_HISTORY VALUES("
			+"DC_RESERVE_HISTORY_SEQ.nextval,#{dcno},#{userid},sysdate,#{cdate},#{state},#{rnum},#{wing})")
	public void insertReserveInform(DonClassResHistoryVO vo);
	
	@Update("UPDATE DC_RESERVE2 SET "
			+"can_num=can_num-#{rnum} "
			+"WHERE rno=#{rno}")
	public void resCanNumMinus(@Param("rnum") int rnum,@Param("rno")int rno);
	
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
	
}
