package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.DonClassReviewVO;
import com.sist.vo.DonClassVO;

public interface DonateClassService {

	//재능기부클래스 리스트 관련
	public List<DonClassVO> donateClassList(Map map);
	public int donateClassTotalPage(Map map);
	public int donateClassCategoryCount(String category);
	//쿠키
	public DonClassVO cookieList(int dcno);
	
	//상새정보
	public List<String> classSubimageList(int dcno);
	public DonClassVO classDetailData(int dcno) ;
	
	//찜하기
	public int getWishCount(Map map) ;
	public String getWishState(Map map);
	public void insertWishList(Map map);
	public String updateWishList(Map map);

	//리뷰
	
	public void insertReview(DonClassReviewVO vo);
	public int reviewTotalpage(Map map);
	public List<DonClassReviewVO> reviewList(Map map);
	public int reviewNum(DonClassReviewVO vo);
	public void deleteReview(DonClassReviewVO vo);
	public String getFilename(DonClassReviewVO vo);
	
	//댓글
	
}
