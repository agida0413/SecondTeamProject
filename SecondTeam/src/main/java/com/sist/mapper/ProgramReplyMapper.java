package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.ProgramReplyVO;

public interface ProgramReplyMapper {

	@Insert("INSERT INTO REPLY (rno,content,rtype,root,userid,objno,typeno,username) VALUES("
			+"reply_seq.nextval,#{content},#{rtype},#{root},#{userid},#{objno},#{typeno},#{username})")
	public void insertReply(ProgramReplyVO vo);
	
	@Results({//변경완료
		@Result(property = "rvo.rlno" ,column="rlno"),
		@Result(property = "rvo.like_state" , column = "like_state"),
		@Result(property = "rvo.hate_state" , column = "hate_state")
		
})//변경완료
	
	@Select("SELECT rno,content,like_count,hate_count,rtype,root,depth,userid,objno,report_state,report_type,typeno,username,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbDay,rlno,like_state,hate_state,num "
			+"FROM (SELECT rno,content,like_count,hate_count,rtype,root,depth,userid,objno,report_state,report_type,typeno,username,regdate,rlno,like_state,hate_state,rownum as num "
			+"FROM (SELECT a.rno,content,like_count,hate_count,rtype,root,depth,a.userid,objno,report_state,report_type,typeno,username,regdate,rlno,like_state,hate_state FROM REPLY a "
			+"LEFT JOIN REPLY_LIKE_STATE b ON b.userid=#{id} and a.rno=b.rno "
			+"WHERE rtype=#{rtype} AND typeno=1 AND "
			+"root=#{root} AND objno=#{objno} ${index} )) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	
	public List<ProgramReplyVO> replyList(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/5.0) FROM REPLY "
			+"WHERE rtype=1 AND typeno=1 AND objno=#{objno} ")
	public int replyTotalPage(ProgramReplyVO vo);
	
	@Update("UPDATE REPLY SET "
			+"depth=depth+1 "
			+"WHERE rno=#{root}")
	public void updateDepth(ProgramReplyVO vo);
	
	
	@Select("SELECT username,content,rno,objno,root FROM REPLY WHERE rno=#{rno}")
	public ProgramReplyVO updateInfoData(int rno);
	
	
	@Update("UPDATE REPLY SET "
			+"CONTENT=#{content}, "
			+"regdate=sysdate "
			+"WHERE rno=#{rno}")
	public void updateReply(ProgramReplyVO vo);
	
	
	@Select("SELECT depth FROM REPLY WHERE rno=#{rno}")
	public int getDepth(ProgramReplyVO vo);
	
	@Update("UPDATE REPLY SET "
			+"depth=depth-1 "
			+"Where rno=#{root}"
			)
	public void updateMinusDepth(ProgramReplyVO vo);
	
	@Update("UPDATE REPLY SET "
			+"content='삭제된 댓글입니다.' "
			+"WHERE rno=#{rno}")
	public void updateContent(ProgramReplyVO vo);
	@Delete("DELETE FROM REPLY "
			+"WHERE rno=#{rno}")
	public void deleteReply(ProgramReplyVO vo);
	
	
	
	@Insert("INSERT INTO REPLY_LIKE_STATE VALUES("
			+"REPLY_LIKE_STATE_SEQ.nextval,#{id},#{state},null,#{rno})")
	public void replyLikeInsert(Map map);
	
	
	@Insert("INSERT INTO REPLY_LIKE_STATE VALUES("
			+"REPLY_LIKE_STATE_SEQ.nextval,#{id},null,#{state},#{rno})")
	public void replyHateInsert(Map map);
	
	
	
	@Update("UPDATE REPLY_LIKE_STATE SET "
			+"${stateColum}=#{state} "
			+"WHERE userid=#{id} and rno=#{rno}")
	public void updateReplyLikeState(Map map);
	
	@Update("UPDATE REPLY SET "
			+"${replyColum}=${replyColum}+1 "
			+"WHERE rno=#{rno}")
	public void updateReplyLikeCountPlus(Map map);
	
	@Update("UPDATE REPLY SET "
			+"${replyColum}=${replyColum}-1 "
			+"WHERE rno=#{rno}")
	public void updateReplyMinusCountPlus(Map map);
	
	@Select("SELECT like_count FROM REPLY WHERE rno=#{rno}")
	public int getLikeCount(Map map);
	
	@Select("SELECT hate_count FROM REPLY WHERE rno=#{rno}")
	public int getHateCount(Map map);
	
	@Update("UPDATE reply set "
			+"likepercent=#{likepercent} "
			+"WHERE rno=#{rno}")
	public void updateReplyPercent(Map map);
	
	
}
