package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.VprogramApplyVO;

public interface MypageService {
	//봉사프로그램 신청내역
	public List<VprogramApplyVO> applyHistoryList(Map map);
	public int applyHistotyTotalPage(String id) ;
}