package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.MypageDAO;
import com.sist.dao.ProgramListDAO;
import com.sist.vo.VprogramApplyVO;

@Service
public class MypageServiceImpl implements MypageService {

	//봉사프로그램 
	@Autowired
	private ProgramListDAO pDao;
	@Override
	public List<VprogramApplyVO> applyHistoryList(Map map) {
		// TODO Auto-generated method stub
		return pDao.applyHistoryList(map);
	}
	@Override
	public int applyHistotyTotalPage(Map map) {
		// TODO Auto-generated method stub
		return pDao.applyHistotyTotalPage(map);
	}
	@Override
	public VprogramApplyVO certifyDetail(int vno) {
		// TODO Auto-generated method stub
		return pDao.certifyDetail(vno);
	}
	@Override
	public void updateCertifyUpload(VprogramApplyVO vo) {
		// TODO Auto-generated method stub
		
		pDao.updateCertifyUpload(vo);
	}

}
