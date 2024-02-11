package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.MypageDAO;
import com.sist.vo.VprogramApplyVO;

@Service
public class MypageServiceImpl implements MypageService {

	//봉사프로그램 신청내역
	@Autowired
	private MypageDAO mDao;
	@Override
	public List<VprogramApplyVO> applyHistoryList(Map map) {
		// TODO Auto-generated method stub
		return mDao.applyHistoryList(map);
	}
	@Override
	public int applyHistotyTotalPage(String id) {
		// TODO Auto-generated method stub
		return mDao.applyHistotyTotalPage(id);
	}

}
