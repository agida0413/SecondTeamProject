package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.VdataboardVO;

public interface ProgramDataboardMapper {
	   @Select("SELECT dno,subject,name,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit,v_check,num "
	    	   +"FROM (SELECT dno,subject,name,regdate,hit,v_check,rownum as num "
	    	   +"FROM (SELECT /*+ INDEX_DESC(v_DataBoard dno_pk)*/dno,subject,name,regdate,hit,v_check "
	    	   +"FROM v_DataBoard)) "
	    	   +"WHERE num BETWEEN #{start} AND #{end}")
	    public List<VdataboardVO> databoardListData(@Param("start") int start,@Param("end") int end);
	    
	    @Select("SELECT CEIL(COUNT(*)/10.0) FROM v_databoard")
	    public int databoardTotalPage();
	    
	    
	    @Insert("INSERT INTO v_Databoard VALUES("
	    	   +"v_databoard_seq.nextval,#{subject},#{content},#{pwd},sysdate"
	    	   +",0,#{filename},#{filesize},#{v_filecount},#{name},#{v_check})")
	    public void databoardInsert(VdataboardVO vo);
	    
	    /*
	     *   SELECT 
	     *      = selectList => 목록  List
	     *      = selectOne  => 상세  VO , 일반 데이터형 
	     *   INSERT,UPDATE,DELETE => void로 설정 
	     */
	    @Update("UPDATE v_DataBoard SET "
	    	   +"hit=hit+1 "
	    	   +"WHERE dno=#{dno}")
	    public void hitIncrement(int dno);
	    
	    @Select("SELECT dno,name,subject,content,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,"
	    	   +"hit,filename,filesize,v_filecount,v_check "
	    	   +"FROM v_DataBoard "
	    	   +"WHERE dno=#{dno}")
	    
	    public VdataboardVO databoardDetailData(int dno);
}
