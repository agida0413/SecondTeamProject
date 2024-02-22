package com.sist.service;
import java.util.*;
import com.sist.vo.*;
public interface DonationReplyService {
	public List<DonationReplyVO> donationMainReplyListData(int start, int end);
	public List<DonationReplyVO> donationSubReplyListData(int root);
	public void donationReplyInsert(DonationReplyVO vo);
}
