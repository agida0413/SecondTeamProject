package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.fasterxml.jackson.annotation.JsonTypeInfo.Id;
import com.sist.vo.OptionVO;
import com.sist.vo.ProgramVO;
import com.sist.vo.VprogramApplyVO;

public interface ProgramListMapper {
	//리스트
	public List<ProgramVO> programListData(Map map);
	//페이징
	public int programTotalPage(Map map);
	
	//상세보기
	@Select("SELECT vno,title,major_field,minor_field,TO_CHAR(collect_start,'YYYY.MM.DD') as dbCollect_start,TO_CHAR(collect_end,'YYYY.MM.DD') as dbCollect_end,"
			+"TO_CHAR(v_start,'YYYY.MM.DD') as dbV_start,TO_CHAR(v_end,'YYYY.MM.DD') as dbV_end,"
			+"runtime,rundate,int_runtime,collect_num,apply_num,volunteer_type,centername,si,gu,"
			+"address,target,active_type,hit,stack_apply,collect_state "
			+"FROM v_program "
			+"WHERE vno=#{vno}")
	public ProgramVO programDetailData(int vno);
	
	//신청
	@Insert("INSERT INTO V_PROGRAM_APPLY VALUES("
			+"V_PROGRAM_APPLY_seq.nextval,#{id},#{vno},#{v_state},#{v_filename},#{v_filesize},#{v_filecount},null,null,null,sysdate)")
	public void programApplyInsert(VprogramApplyVO vo); 
	
	
	//신청중복체크
	@Select("SELECT COUNT(*) FROM v_program_apply "
			+"WHERE id=#{id} AND "
			+"vno=#{vno} AND "
			+"v_state !='CANCEL'")
	public int getApplyCount(VprogramApplyVO vo);
	
	//센터 프로그램 신청내역 리스트
	
		@Results({
				@Result(property = "pvo.vno" ,column="vno"),
				@Result(property = "pvo.title" , column = "title"),
				@Result(property = "pvo.centername",column = "centername")
		})
		@Select("select vano,id,a.vno,v_state,v_filename,v_filesize,v_filecount,TO_CHAR(V_STATE_TIME,'YYYY-MM-DD HH24:MI:SS') as vDbStateTime,title,centername "
				+"FROM V_PROGRAM_APPLY a "
				+"JOIN V_PROGRAM b ON "
				+"a.vno=b.vno "
				+"WHERE centername=#{centername}")
		public List<VprogramApplyVO> applyList(String centername);
		
			
	
	
}
