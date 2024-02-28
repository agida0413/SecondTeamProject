package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.DonationMapper;
import com.sist.vo.DonationHistoryVO;
import com.sist.vo.DonationPayVO;
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
	
	public void donationPayInsert(DonationPayVO vo) {
		mapper.donationPayInsert(vo);
	}
	
	public void donationPayNowUpdate(DonationPayVO vo) {
		mapper.donationPayNowUpdate(vo);
	}
	
	public void donationPayPercentUpdate(int dno) {
		mapper.donationPayPercentUpdate(dno);
	}
	
	public List<DonationPayVO> donationPayListData(Map map){
		return mapper.donationPayListData(map);
	}
	
	public int donationPayTotalPage(int dno) {
		return mapper.donationPayTotalPage(dno);
	}
	
	public List<DonationVO> donationCateRelatedListData(String d_cate){
		return mapper.donationCateRelatedListData(d_cate);
	}
	
	public List<DonationHistoryVO> donatedHistoryListData(String userid){
		return mapper.donatedHistoryListData(userid);
	}
	
	public List<String> donatedMaxCategory(String userid){
		return mapper.donatedMaxCategory(userid);
	}
	
	public List<DonationVO> donatedCateRelatedListData(String d_cate){
		return mapper.donatedCateRelatedListData(d_cate);
	}
	
	public DonationVO donationFooterAOPData() {
		return mapper.donationFooterAOPData();
	}
	
}
