package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sist.mapper.DonClassReviewMapper;
import com.sist.vo.DonClassReviewVO;
import com.sist.vo.DonClassVO;

@Repository
public class DonClassReviewDAO {

	@Autowired
	private DonClassReviewMapper mapper;
	
	
	
	//리뷰리스트
	public List<DonClassReviewVO> reviewList(Map map){
		return mapper.reviewList(map);
	}
	
	//리뷰 토탈페이지
	
	
	public int reviewTotalpage(Map map) {
		return mapper.reviewTotalpage(map);
	}
	
	
	//리뷰 업데이트정보
	public int reviewNum(DonClassReviewVO vo) {
		return mapper.reviewNum(vo);
	}
	
	public void insertReview(DonClassReviewVO vo) {
		mapper.insertReview(vo);
	}
	
	public void updateClassScore(DonClassVO vo) {
		mapper.updateClassScore(vo);
	}
	public double reviewTotal(DonClassReviewVO vo) {
		return mapper.reviewTotal(vo);
	}
	public String getFilename(DonClassReviewVO vo) {
		return mapper.getFilename(vo);
	}
	
	//삭제
	public void deleteReview(DonClassReviewVO vo) {
		 mapper.deleteReview(vo);
	}
}
