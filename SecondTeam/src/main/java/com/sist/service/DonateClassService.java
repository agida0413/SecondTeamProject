package com.sist.service;

import java.util.List;
import java.util.Map;

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
}
