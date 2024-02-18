package com.sist.service;

import java.util.List;

import com.sist.vo.DonationVO;

public interface DonationService {
	public List<DonationVO> homeDonationListData();
	public List<DonationVO> donationListData(int start, int end);
	public int donationListTotalPage();
	public DonationVO donationDetailData(int dno);
}
