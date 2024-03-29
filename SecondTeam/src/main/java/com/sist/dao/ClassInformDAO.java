package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sist.mapper.ClassInformMapper;
import com.sist.vo.DonClassVO;

@Repository
public class ClassInformDAO {
	@Autowired
private ClassInformMapper mapper;
	
	//재능기부 리스트 관련 
	public List<DonClassVO> donateClassList(Map map){
		return mapper.donateClassList(map);
	}
	
	public int donateClassTotalPage(Map map) {
		return mapper.donateClassTotalPage(map);
	}
	
	public int donateClassCategoryCount(String category) {
		return mapper.donateClassCategoryCount(category);
	}
	
	//쿠키
	public DonClassVO cookieList(int dcno){
	return mapper.cookieList(dcno);	
	}
	
	
	//상세정보 관련
	
	public List<String> classSubimageList(int dcno){
		return mapper.classSubimageList(dcno);
	}
	
	public DonClassVO classDetailData(int dcno) {
		return mapper.classDetailData(dcno);
	}
	
	//찜하기
	
	public int getWishCount(Map map) {
		return mapper.getWishCount(map);
	}
	
	public String getWishState(Map map) {
		return mapper.getWishState(map);
	}
	
	public void insertWishList(Map map) {
		 mapper.insertWishList(map);
	}
	
	
	
	public void updateWishList(Map map) {
		mapper.updateWishList(map);
		
	}
	

	
	
	//위시리스트
	public List<DonClassVO> donClassWishList(Map map){
		return mapper.donClassWishList(map);
	}
	
	public int donClassWishTotalpage(Map map) {
		return mapper.donClassWishTotalpage(map);
	}
	
	
	//새 클래스 등록
	public void newClassInsert(DonClassVO vo) {
		 mapper.newClassInsert(vo);
	}
	
	public int getDcSeq() {
		return mapper.getDcSeq();
	}
	
	public void newClassSubImgInsert(Map map) {
		mapper.newClassSubImgInsert(map);
	}
	
	public void newClassReserveInformInsert(Map map) {
		 mapper.newClassReserveInformInsert(map);
	}

	//나의 클래스
	public List<DonClassVO> myDonClassList(Map map){
		return mapper.myDonClassList(map);
	}
	
	public int myDonClassTotalPage(String id) {
		return mapper.myDonClassTotalPage(id);
	}



	public DonClassVO footerDonclassAopData() {
		return mapper.footerDonclassAopData();
	}
	
	public List<DonClassVO> mainDonclassData(){
		return mapper.mainDonclassData();
	}
}
