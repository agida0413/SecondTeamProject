package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.ProgramReplyMapper;
import com.sist.vo.ProgramReplyVO;

@Repository
public class ProgramReplyDAO {
	
	@Autowired
	private ProgramReplyMapper mapper;
	public void insertReply(ProgramReplyVO vo) {
		
		mapper.insertReply(vo);
	}
	
	public List<ProgramReplyVO> replyList(Map map){
		return mapper.replyList(map);
	}
	
	public int replyTotalPage(ProgramReplyVO vo) {
		return mapper.replyTotalPage(vo);
	}
}
