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
	
	public int replyTotalAmount(ProgramReplyVO vo) {
		return mapper.replyTotalAmount(vo);
	}
	public ProgramReplyVO updateInfoData(int rno) {
		return mapper.updateInfoData(rno);
	}
	
	public void updateReply(ProgramReplyVO vo) {
		mapper.updateReply(vo);
	}
	
	 @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
	public void deleteReply(ProgramReplyVO vo) {
		int depth = mapper.getDepth(vo);
		
		if(depth==0) {
			mapper.deleteReply(vo);
			mapper.updateMinusDepth(vo);
		}
		else {
			mapper.updateContent(vo);
			
			
		}
	}
	 
	 @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
	 public void replyHateInsert(Map map) {
		 mapper.replyHateInsert(map);
		 
		 mapper.updateReplyLikeCountPlus(map);
		 int likeCount=mapper.getLikeCount(map);
		 int hateCount=mapper.getHateCount(map);
		 
		 int percent =0;
		 if (likeCount + hateCount != 0) {
			  percent=  likeCount / (likeCount + hateCount) * 100;
			    System.out.println("백분율: " + percent);
			} 
		 percent=(int) Math.round(percent);
		 map.put("likepercent", percent);
		 mapper.updateReplyPercent(map);
	 }
	 
	 @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
		public void replyLikeInsert(Map map) {
			mapper.replyLikeInsert(map);
			
			 mapper.updateReplyLikeCountPlus(map);
			 int likeCount=mapper.getLikeCount(map);
			 int hateCount=mapper.getHateCount(map);
			 
			 int percent =0;
			 if (likeCount + hateCount != 0) {
				  percent=  likeCount / (likeCount + hateCount) * 100;
				    System.out.println("백분율: " + percent);
				} 
			 
			 System.out.println(percent);
			 map.put("likepercent", percent);
			 mapper.updateReplyPercent(map);
		}
	 
	 @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
	 public void updateReplyLikeState(Map map) {
		 mapper.updateReplyLikeState(map);
		 
		 if(map.get("state").equals("YES")) {
			 mapper.updateReplyLikeCountPlus(map);
		 }else {
			 mapper.updateReplyMinusCountPlus(map);
		 }
		 int likeCount=mapper.getLikeCount(map);
		 int hateCount=mapper.getHateCount(map);
		 
		 int percent =0;
		 if (likeCount + hateCount != 0) {
			  percent=  likeCount / (likeCount + hateCount) * 100;
			    System.out.println("백분율: " + percent);
			} 
		 percent=(int) Math.round(percent);
		 map.put("likepercent", percent);
		 mapper.updateReplyPercent(map);
	 }
	 
	 
	 public int myReplyTotalPage(Map map) {
		 return mapper.myReplyTotalPage(map);
	 }
}
