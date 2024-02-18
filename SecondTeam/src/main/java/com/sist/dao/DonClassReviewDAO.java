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
	
	
	@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
	public void insertReview(DonClassReviewVO vo) {
		
		mapper.insertReview(vo);
		int reviewNum=mapper.reviewNum(vo);
		
		double sum=mapper.reviewTotal(vo);
		//리뷰 인서트
			
		double newGrade = (sum) / (reviewNum);
		newGrade = Math.round(newGrade * 10.0) / 10.0;
		
		//클래스 평균 - > 업데이트
		DonClassVO dvo = new DonClassVO();
		dvo.setScore(newGrade);
		dvo.setDcno(vo.getObjno());
		
		
		mapper.updateClassScore(dvo);
		
		
		
		
	}
	
	//리뷰삭제
	@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
	public void deleteReview(DonClassReviewVO vo) {
		mapper.deleteReview(vo);
		int reviewNum=mapper.reviewNum(vo);
		
		double sum=mapper.reviewTotal(vo);
		
		double newGrade = (sum) / (reviewNum);
		newGrade = Math.round(newGrade * 10.0) / 10.0;
		
		if(reviewNum==0) {
			newGrade=2.5;
		}
		DonClassVO dvo = new DonClassVO();
		dvo.setScore(newGrade);
		dvo.setDcno(vo.getObjno());
		
		
		mapper.updateClassScore(dvo);
	}
	
	
	public String getFilename(DonClassReviewVO vo) {
		return mapper.getFilename(vo);
	}
	
	
	//리뷰리스트
	public List<DonClassReviewVO> reviewList(Map map){
		return mapper.reviewList(map);
	}
	
	//리뷰 토탈페이지
	
	public int reviewTotalpage(Map map) {
		return mapper.reviewTotalpage(map);
	}
	
	public int reviewNum(DonClassReviewVO vo) {
		return mapper.reviewNum(vo);
	}
}
