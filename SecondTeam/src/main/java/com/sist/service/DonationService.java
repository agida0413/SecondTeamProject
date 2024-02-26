package com.sist.service;

import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.sist.vo.DonationPayVO;
import com.sist.vo.DonationVO;

public interface DonationService {
	public List<DonationVO> homeDonationListData();
	public List<DonationVO> donationListData(int start, int end);
	public int donationListTotalPage();
	public DonationVO donationDetailData(int dno);
	public List<DonationVO> donationCateListData(Map map);
	public int donationCateListTotalPage(Map map);
	public List<DonationVO> donationOnlyCateListData(Map map);
	public int donationOnlyCateListTotalPage(Map map);
	public void donationPayInsert(DonationPayVO vo);
	public void donationPayNowUpdate(DonationPayVO vo);
	public void donationPayPercentUpdate(int dno);
	public String donationPayListData(int dno, int page) throws JsonProcessingException;
	public String donation_related_vue(int dno) throws Exception;
}
