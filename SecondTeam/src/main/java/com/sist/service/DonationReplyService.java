package com.sist.service;
import java.util.*;
import com.sist.vo.*;
public interface DonationReplyService {
	public List<DonationReplyVO> donationMainReplyListData(Map map);
	public List<DonationReplyVO> donationSubReplyListData(int root);
	public void donationReplyInsert(DonationReplyVO vo);
	public int donationReplyTotalPage(int dno);
	public void donationReplyDelete(int rno);
	public void donationReplyUpdate(int rno,String msg);
}
