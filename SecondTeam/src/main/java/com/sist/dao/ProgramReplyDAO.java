package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sist.mapper.ProgramReplyMapper;
import com.sist.vo.ProgramReplyVO;

@Repository
public class ProgramReplyDAO {
	
	@Autowired
	private ProgramReplyMapper mapper;
	
	 @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
	public void insertReply(ProgramReplyVO vo) {
		if(vo.getRtype()==2) {
			mapper.updateDepth(vo);
		}
		
		mapper.insertReply(vo);
	}
	
	public List<ProgramReplyVO> replyList(Map map){
		return mapper.replyList(map);
	}
	
	public int replyTotalPage(ProgramReplyVO vo) {
		return mapper.replyTotalPage(vo);
	}
}
