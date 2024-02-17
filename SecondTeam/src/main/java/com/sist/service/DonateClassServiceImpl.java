package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

@Override
public String updateWishList(Map map) {
	// TODO Auto-generated method stub
	return cIdao.updateWishList(map);
}

//리뷰

@Override
public void insertReview(DonClassReviewVO vo) {
	// TODO Auto-generated method stub
	rDao.insertReview(vo);
}
	



}
