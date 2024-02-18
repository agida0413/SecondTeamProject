package com.sist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.DonationDAO;
import com.sist.vo.DonationVO;

@Service
public class DonationServiceImpl implements DonationService{
	@Autowired
	private DonationDAO dao;

	@Override
	public List<DonationVO> homeDonationListData() {
		// TODO Auto-generated method stub
		return dao.homeDonationListData();
	}

	@Override
	public List<DonationVO> donationListData(int start, int end) {
		// TODO Auto-generated method stub
		return dao.donationListData(start, end);
	}

	@Override
	public int donationListTotalPage() {
		// TODO Auto-generated method stub
		return dao.donationListTotalPage();
	}

	@Override
	public DonationVO donationDetailData(int dno) {
		// TODO Auto-generated method stub
		return dao.donationDetailData(dno);
	}
	
	
}
