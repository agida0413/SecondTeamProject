package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.CartVO;
import com.sist.vo.DonClassResHistoryVO;
import com.sist.vo.DonClassVO;
import com.sist.vo.ProgramVO;
import com.sist.vo.VprogramApplyVO;

public interface MypageService {
	//봉사프로그램 신청내역
	public List<VprogramApplyVO> applyHistoryList(Map map);
	public int applyHistotyTotalPage(Map map) ;
	public VprogramApplyVO certifyDetail(Map map);
	public void updateCertifyUpload(VprogramApplyVO vo);
	//프로그램 위시리스트
	public List<ProgramVO> wishList(Map map);
	public int wishListTotalPage(Map map);

	//센터 프로그램 정보
	public List<ProgramVO> centerProgramList(Map map);
	public int centerProgramTotalPage(String centername);
	
	//클래스 위시리스트
	public List<DonClassVO> donClassWishList(Map map);
	public int donClassWishTotalpage(Map map);
	
	//클래스 예약내역
	public Map donClassReserveHistoryList(String page,String userid);
	
	
	//마이페이지 클래스 예약취소
		public void reserveCancel(DonClassResHistoryVO vo,String hostname);

		
		//나의 클래스
		public Map  myDonClassList(String id,String page);
			
		//나의 클래스 예약관리
		public Map myDonclassResHistoryList(String userid,String page);
}
