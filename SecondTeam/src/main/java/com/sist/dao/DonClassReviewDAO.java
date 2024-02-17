package com.sist.dao;

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
		
		int reviewNum=mapper.reviewNum(vo);
		int sum=mapper.reviewTotal(vo);
		
		double newGrade = (sum + vo.getScore()) / (reviewNum + 1);
		newGrade = Math.round(newGrade * 10.0) / 10.0;
		System.out.println(newGrade);
		//클래스 평균 - > 업데이트
		DonClassVO dvo = new DonClassVO();
		dvo.setScore(newGrade);
		dvo.setDcno(vo.getObjno());
		
		
		mapper.updateClassScore(dvo);
		
		//리뷰 인서트
		mapper.insertReview(vo);
		
		
	}
}
