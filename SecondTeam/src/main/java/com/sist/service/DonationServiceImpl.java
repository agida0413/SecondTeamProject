package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sist.dao.DonationDAO;
import com.sist.vo.DonationPayVO;
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

	@Override
	public List<DonationVO> donationCateListData(Map map) {
		// TODO Auto-generated method stub
		return dao.donationCateListData(map);
	}

	@Override
	public int donationCateListTotalPage(Map map) {
		// TODO Auto-generated method stub
		return dao.donationCateListTotalPage(map);
	}

	@Override
	public List<DonationVO> donationOnlyCateListData(Map map) {
		// TODO Auto-generated method stub
		return dao.donationOnlyCateListData(map);
	}

	@Override
	public int donationOnlyCateListTotalPage(Map map) {
		// TODO Auto-generated method stub
		return dao.donationOnlyCateListTotalPage(map);
	}

	@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
	@Override
	public void donationPayInsert(DonationPayVO vo) {
		// TODO Auto-generated method stub
		dao.donationPayInsert(vo);
		dao.donationPayNowUpdate(vo);
		dao.donationPayPercentUpdate(vo.getDno());
	}

	@Override
	public void donationPayNowUpdate(DonationPayVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void donationPayPercentUpdate(int dno) {
		// TODO Auto-generated method stub
		
	}
	
	
}
