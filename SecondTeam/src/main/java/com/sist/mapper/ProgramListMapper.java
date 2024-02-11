package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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
			+"v_state !='거절'")
	public int getApplyCount(VprogramApplyVO vo);
	
	//센터 프로그램 신청내역 리스트
	
		@Results({
				@Result(property = "pvo.vno" ,column="vno"),
				@Result(property = "pvo.title" , column = "title"),
				@Result(property = "pvo.centername",column = "centername"),
				@Result(property = "pvo.v_start",column = "v_start"),
				@Result(property = "pvo.v_end",column = "v_end"),
				@Result(property = "pvo.dbV_start",column = "dbV_start"),
				@Result(property = "pvo.dbV_end",column = "dbV_end"),
				@Result(property = "pvo.collect_state",column = "collect_state"),
				@Result(property = "mvo.name",column = "name"),
				@Result(property = "mvo.dbBirthday",column = "dbBirthday"),
				@Result(property = "mvo.birth",column = "birth"),
				@Result(property = "mvo.sex",column = "sex"),
				@Result(property = "mvo.addr1",column = "addr1"),
				@Result(property = "mvo.addr2",column = "addr2"),
				@Result(property = "mvo.email",column = "email"),
				@Result(property = "mvo.phone",column = "phone")
				
		})
		@Select("SELECT vano,id,vno,v_state,v_filename,v_filesize,v_filecount,TO_CHAR(V_STATE_TIME,'YYYY-MM-DD HH24:MI:SS') as vDbStateTime,title,centername,name,TO_CHAR(birth,'YYYY-MM-DD') as dbBirthday,sex,"
				+"addr1,addr2,email,phone,TO_CHAR(v_start,'YYYY-MM-DD') as dbV_start,TO_CHAR(v_end,'YYYY-MM-DD') as dbV_end,collect_state,num FROM ("
				+"SELECT vano,id,vno,v_state,v_filename,v_filesize,v_filecount,v_state_time,title,centername,name,birth,sex,"
				+"addr1,addr2,email,phone,v_start,v_end,collect_state,rownum as num FROM ("
				+"select /*+INDEX_DESC(V_PROGRAM_APPLY vano_pk)*/vano,a.id,a.vno,v_state,v_filename,v_filesize,v_filecount,v_state_time,title,b.centername,"
				+"c.name,birth,sex,c.addr1,c.addr2,email,phone,"
				+"v_start,v_end,collect_state "
				+"FROM V_PROGRAM_APPLY a "
				+"JOIN V_PROGRAM b ON "
				+"a.vno=b.vno "
				+"JOIN MEMBER c ON "
				+"a.id=c.id "
				+"WHERE b.centername=#{centername} AND "
				+"V_STATE=#{type})) "
				+"WHERE num between #{start} and #{end}")
		public List<VprogramApplyVO> applyList(Map map);
		
		//신청파일리스트 페이지
	
		
		@Select("SELECT CEIL(COUNT(*)/10.0) FROM V_PROGRAM_APPLY a "
				+"JOIN v_program b ON "
				+"a.vno=b.vno "
				+"WHERE b.centername=#{centername} AND "
				+"v_state=#{type}")
		public int applyListTotalPage(Map map);
		
		//신청리스트 파일갖고오기
		@Select("SELECT v_filename,v_filesize,v_filecount FROM V_PROGRAM_APPLY "
				+"WHERE vano=#{vano}")
		public VprogramApplyVO getApplyFiles(int vano);
			
		//신청내역 스케쥴러를 통한 봉사중으로 상태업데이트를 위해 vno리스트넘기기
		@Select("SELECT vno FROM v_program "
				+"WHERE TRUNC(SYSDATE) = TRUNC(V_START)")
		public List<Integer> updateRunStVnoList();
		
		
		//신청내역 스케쥴러를 통한 봉사완료로 상태업데이트를 위해 vno리스트넘기기
		@Select("SELECT vno FROM v_program "
				+"WHERE TRUNC(SYSDATE-1) = TRUNC(V_end)")
		public List<Integer> updateEndStVnoList();
		
		@Update("UPDATE V_PROGRAM_APPLY SET "
				+"v_state=#{up} "
				+"WHERE vno=#{vno} AND "
				+"v_state=#{wh}")
		public void updateRunSt(Map map);
		
		@Update("UPDATE V_PROGRAM_APPLY SET "
				+"v_state=#{up} "
				+"WHERE vno=#{vno} AND "
				+"v_state=#{wh}")
		public void updateEndSt(Map map);
		
		
		
		
}
