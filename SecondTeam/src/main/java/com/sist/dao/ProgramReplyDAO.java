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
	
	public void updateDepth(ProgramReplyVO vo) {
		 mapper.updateDepth(vo);
	}
	
	public void insertReply(ProgramReplyVO vo) {
		mapper.insertReply(vo);
	}

	
	public List<ProgramReplyVO> replyList(Map map){
		return mapper.replyList(map);
	}
	
	public int replyTotalPage(ProgramReplyVO vo) {
		return mapper.replyTotalPage(vo);
	}
	
	public int replyTotalAmount(ProgramReplyVO vo) {
		return mapper.replyTotalAmount(vo);
	}
	public ProgramReplyVO updateInfoData(int rno) {
		return mapper.updateInfoData(rno);
	}
	
	public void updateReply(ProgramReplyVO vo) {
		mapper.updateReply(vo);
	}
	
	public int getDepth(ProgramReplyVO vo) {
		return mapper.getDepth(vo);
	}
	
	public void deleteReply(ProgramReplyVO vo) {
		mapper.deleteReply(vo);
	}
	public void updateMinusDepth(ProgramReplyVO vo) {
		mapper.updateMinusDepth(vo);
	}
	public void updateContent(ProgramReplyVO vo) {
		mapper.updateContent(vo);
	}
	

	public void replyHateInsert(Map map) {
		mapper.replyHateInsert(map);
	}
	public void updateReplyLikeCountPlus(Map map) {
		mapper.updateReplyLikeCountPlus(map);
	}
	public void updateReplyMinusCountPlus(Map map) {
		mapper.updateReplyMinusCountPlus(map);
	}
	public int getLikeCount(Map map) {
		return mapper.getLikeCount(map);
	}
	public int getHateCount(Map map) {
		return mapper.getHateCount(map);
	}
	public void updateReplyPercent(Map map) {
		mapper.updateReplyPercent(map);
	}

	 public void replyLikeInsert(Map map) {
		 mapper.replyLikeInsert(map);
	 }
	 public void updateReplyLikeState(Map map) {
		  mapper.updateReplyLikeState(map);
	 }

	 
	 public int myReplyTotalPage(Map map) {
		 return mapper.myReplyTotalPage(map);
	 }
}
