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
	
	public List<DonationReplyVO> donationMainReplyListData(int start, int end){
		return mapper.donationMainReplyListData(start, end);
	}
	public List<DonationReplyVO> donationSubReplyListData(int root){
		return mapper.donationSubReplyListData(root);
	}
	public void donationReplyInsert(DonationReplyVO vo) {
		mapper.donationReplyInsert(vo);
	}
}
