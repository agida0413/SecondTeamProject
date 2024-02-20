package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.ProgramReplyVO;

public interface ProgramReplyMapper {

	@Insert("INSERT INTO REPLY (rno,content,rtype,root,userid,objno,typeno,username) VALUES("
			+"reply_seq.nextval,#{content},#{rtype},#{root},#{userid},#{objno},#{typeno},#{username})")
	public void insertReply(ProgramReplyVO vo);
	
	@Select("SELECT rno,content,like_count,hate_count,rtype,root,depth,userid,objno,report_state,report_type,typeno,username,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS'),num "
			+"FROM (SELECT rno,content,like_count,hate_count,rtype,root,depth,userid,objno,report_state,report_type,typeno,username,regdate,rownum as num "
			+"FROM (SELECT /*+INDEX(REPLY ${index})*/rno,content,like_count,hate_count,rtype,root,depth,userid,objno,report_state,report_type,typeno,username,regdate FROM REPLY "
			+"WHERE rtype=#{rtype} AND typeno=1 AND "
			+"root=#{root} AND objno=#{objno})) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	
	public List<ProgramReplyVO> replyList(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/5.0) FROM REPLY "
			+"WHERE rtype=1 AND typeno=1 AND objno=#{objno} ")
	public int replyTotalPage(ProgramReplyVO vo);
}
