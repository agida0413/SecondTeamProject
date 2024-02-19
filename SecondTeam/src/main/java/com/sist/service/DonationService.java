package com.sist.service;

import java.util.List;
import java.util.Map;

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
}
