package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.DonationMapper;
import com.sist.vo.DonationVO;

@Repository
public class DonationDAO {
	@Autowired
	private DonationMapper mapper;
	
	public List<DonationVO> homeDonationListData(){
		return mapper.homeDonationListData();
	}
	
	public List<DonationVO> donationListData(int start, int end){
		return mapper.donationListData(start, end);
	}
	
	public int donationListTotalPage() {
		return mapper.donationListTotalPage();
	}
	
	public DonationVO donationDetailData(int dno) {
		mapper.donationHitIncrement(dno);
		return mapper.donationDetailData(dno);
	}
	
	public List<DonationVO> donationCateListData(Map map){
		return mapper.donationCateListData(map);
	}
	
	public int donationCateListTotalPage(Map map) {
		return mapper.donationCateListTotalPage(map);
	}
	
	public List<DonationVO> donationOnlyCateListData(Map map){
		return mapper.donationOnlyCateListData(map);
	}
	
	public int donationOnlyCateListTotalPage(Map map) {
		return mapper.donationOnlyCateListTotalPage(map);
	}
}