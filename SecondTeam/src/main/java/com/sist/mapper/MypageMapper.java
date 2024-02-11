package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.VprogramApplyVO;

public interface MypageMapper {

	
	
	
	//봉사프로그램 신청내역
	
	@Results({
		@Result(property = "pvo.vno" ,column="vno"),
		@Result(property = "pvo.title" , column = "title"),
		@Result(property = "pvo.centername",column = "centername"),
		@Result(property = "pvo.v_start",column = "v_start"),
		@Result(property = "pvo.v_end",column = "v_end"),
		@Result(property = "pvo.dbV_start",column = "dbV_start"),
		@Result(property = "pvo.dbV_end",column = "dbV_end"),
		@Result(property = "pvo.collect_state",column = "collect_state")
		
		
		
})
	@Select("SELECT vno,title,centername,TO_CHAR(v_start,'YYYY-MM-DD') as dbV_start,TO_CHAR(v_end,'YYYY-MM-DD') as dbV_end,"
			+"collect_state,vano,v_state,TO_CHAR(v_state_time,'YYYY-MM-DD HH24:MI:SS') as vDbStateTime,num "
			+"FROM(SELECT vno,title,centername,v_start,v_end,collect_state,vano,v_state,v_state_time,rownum as num "
			+"FROM(SELECT a.vno,title,centername,v_start,v_end,collect_state,vano,v_state,v_state_time "
			+"FROM v_program_apply a "
			+"JOIN V_PROGRAM b "
			+"ON a.vno=b.vno "
			+"WHERE id=#{id} AND V_STATE=#{state} ORDER BY vano DESC)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<VprogramApplyVO> applyHistoryList(Map map);
	
	

	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM v_program_apply "
			+"WHERE id=#{id} AND V_STATE=#{state}")
	public int applyHistotyTotalPage(Map map);
	
	@Results({
		@Result(property = "pvo.vno" ,column="vno"),
		@Result(property = "pvo.title" , column = "title"),
		@Result(property = "pvo.centername",column = "centername"),
		@Result(property = "pvo.v_start",column = "v_start"),
		@Result(property = "pvo.v_end",column = "v_end"),
		@Result(property = "pvo.dbV_start",column = "dbV_start"),
		@Result(property = "pvo.dbV_end",column = "dbV_end"),
		@Result(property = "pvo.collect_state",column = "collect_state")
		
		
		
})
	@Select("SELECT a.vno,title,centername,TO_CHAR(v_start,'YYYY-MM-DD') as dbV_start,TO_CHAR(v_end,'YYYY-MM-DD') as dbV_end,"
			+"collect_state,vano,v_state,TO_CHAR(v_state_time,'YYYY-MM-DD HH24:MI:SS') as vDbStateTime "
			+"FROM v_program_apply a "
			+"JOIN V_PROGRAM b "
			+"ON a.vno=b.vno "
			+"WHERE a.vno=#{vno}"
			)
	public VprogramApplyVO certifyDetail(int vno);
}
