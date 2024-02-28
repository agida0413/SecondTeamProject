package com.sist.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class DonationReplyDAO {
	@Autowired
	private DonationReplyMapper mapper;
	
	public List<DonationReplyVO> donationMainReplyListData(Map map){
		return mapper.donationMainReplyListData(map);
	}
	public List<DonationReplyVO> donationSubReplyListData(int root){
		return mapper.donationSubReplyListData(root);
	}
	public void donationReplyInsert(DonationReplyVO vo) {
		mapper.donationReplyInsert(vo);
	}
	public int donationReplyTotalPage(int dno) {
		return mapper.donationReplyTotalPage(dno);
	}
	
	public void donationReplyDelete(int rno) {
		mapper.donationReplyDelete(rno);
	}
	
	public void donationReplyUpdate(DonationReplyVO vo) {
		mapper.donationReplyUpdate(vo);
	}
}
