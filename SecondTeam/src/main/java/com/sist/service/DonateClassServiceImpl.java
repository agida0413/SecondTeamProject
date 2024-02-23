package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sist.dao.ClassInformDAO;
import com.sist.dao.DonClassReviewDAO;
import com.sist.vo.DonClassReviewVO;
import com.sist.vo.DonClassVO;

@Service
public class DonateClassServiceImpl implements DonateClassService{
@Autowired
private ClassInformDAO cIdao;

@Autowired
private DonClassReviewDAO rDao;




//재능기부 클래스 리스트 관련

@Override
public List<DonClassVO> donateClassList(Map map) {
	// TODO Auto-generated method stub
	return cIdao.donateClassList(map);
}

@Override
public int donateClassTotalPage(Map map) {
	// TODO Auto-generated method stub
	return cIdao.donateClassTotalPage(map);
}

@Override
public int donateClassCategoryCount(String category) {
	// TODO Auto-generated method stub
	return cIdao.donateClassCategoryCount(category);
}

@Override
public DonClassVO cookieList(int dcno) {
	// TODO Auto-generated method stub
	return cIdao.cookieList(dcno);
}


//상세정보
@Override
public List<String> classSubimageList(int dcno) {
	// TODO Auto-generated method stub
	return cIdao.classSubimageList(dcno);
}

@Override
public DonClassVO classDetailData(int dcno) {
	// TODO Auto-generated method stub
	return cIdao.classDetailData(dcno);
}


//찜하기
@Override
public int getWishCount(Map map) {
	// TODO Auto-generated method stub
	return cIdao.getWishCount(map);
}

@Override
public String getWishState(Map map) {
	// TODO Auto-generated method stub
	return cIdao.getWishState(map);
}

@Override
public void insertWishList(Map map) {
	// TODO Auto-generated method stub
	cIdao.insertWishList(map);
}

@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
@Override
public String updateWishList(Map map) {
	// TODO Auto-generated method stub
	 cIdao.updateWishList(map);
	 
	 return cIdao.getWishState(map);
}

//리뷰
@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
@Override
public void insertReview(DonClassReviewVO vo) {
	// TODO Auto-generated method stub
	rDao.insertReview(vo);
	int reviewNum=rDao.reviewNum(vo);
	
	double sum=rDao.reviewTotal(vo);
	//리뷰 인서트
		
	double newGrade = (sum) / (reviewNum);
	newGrade = Math.round(newGrade * 10.0) / 10.0;
	
	//클래스 평균 - > 업데이트
	DonClassVO dvo = new DonClassVO();
	dvo.setScore(newGrade);
	dvo.setDcno(vo.getObjno());
	
	
	rDao.updateClassScore(dvo);
}

@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
@Override
public void deleteReview(DonClassReviewVO vo) {
	// TODO Auto-generated method stub
	rDao.deleteReview(vo);
	int reviewNum=rDao.reviewNum(vo);
	
	double sum=rDao.reviewTotal(vo);
	
	double newGrade = (sum) / (reviewNum);
	newGrade = Math.round(newGrade * 10.0) / 10.0;
	
	if(reviewNum==0) {
		newGrade=2.5;
	}
	DonClassVO dvo = new DonClassVO();
	dvo.setScore(newGrade);
	dvo.setDcno(vo.getObjno());
	
	
	rDao.updateClassScore(dvo);
	rDao.deleteReview(vo);
	
}

@Override
public int reviewTotalpage(Map map) {
	// TODO Auto-generated method stub
	return rDao.reviewTotalpage(map);
}

@Override
public List<DonClassReviewVO> reviewList(Map map) {
	// TODO Auto-generated method stub
	return rDao.reviewList(map);
}

@Override
public int reviewNum(DonClassReviewVO vo) {
	// TODO Auto-generated method stub
	return rDao.reviewNum(vo);
}



@Override
public String getFilename(DonClassReviewVO vo) {
	// TODO Auto-generated method stub
	return rDao.getFilename(vo);
}
	



}
