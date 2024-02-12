package com.sist.service;

import java.util.List;
import java.util.Map;

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
}
