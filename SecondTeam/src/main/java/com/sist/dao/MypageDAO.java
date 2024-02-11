package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.MypageMapper;
import com.sist.vo.VprogramApplyVO;

@Repository
public class MypageDAO {
	
	
	
	@Autowired
	private MypageMapper mapper;
	
	
	//봉사프로그램 신청내역
	public List<VprogramApplyVO> applyHistoryList(Map map){
		return mapper.applyHistoryList(map);
	}
	
	public int applyHistotyTotalPage(Map map) {
		return mapper.applyHistotyTotalPage(map);
	}
	
	public VprogramApplyVO certifyDetail(int vno) {
		return mapper.certifyDetail(vno);
	}
}
