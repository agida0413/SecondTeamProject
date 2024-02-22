package com.sist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;
import com.sist.vo.*;
import com.sist.dao.*;

@Service
public class DonationReplyServiceImpl implements DonationReplyService{
	@Autowired
	private DonationReplyDAO dao;

	@Override
	public List<DonationReplyVO> donationMainReplyListData(int start, int end) {
		// TODO Auto-generated method stub
		return dao.donationMainReplyListData(start, end);
	}

	@Override
	public List<DonationReplyVO> donationSubReplyListData(int root) {
		// TODO Auto-generated method stub
		return dao.donationSubReplyListData(root);
	}

	@Override
	public void donationReplyInsert(DonationReplyVO vo) {
		// TODO Auto-generated method stub
		dao.donationReplyInsert(vo);
	}
	
	
}
