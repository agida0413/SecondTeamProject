package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.ClassInformDAO;
import com.sist.dao.MypageDAO;
import com.sist.dao.ProgramListDAO;
import com.sist.dao.ProgramWishDAO;
import com.sist.mapper.ProgramWishMapper;
import com.sist.vo.DonClassVO;
import com.sist.vo.ProgramVO;
import com.sist.vo.VprogramApplyVO;

@Service
public class MypageServiceImpl implements MypageService {

	//봉사프로그램 
	@Autowired
	private ProgramListDAO pDao;
	@Autowired
	private ProgramWishDAO zDAo;
	
	@Autowired
	private ClassInformDAO cDao;
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
	public VprogramApplyVO certifyDetail(Map map) {
		// TODO Auto-generated method stub
		return pDao.certifyDetail(map);
	}
	@Override
	public void updateCertifyUpload(VprogramApplyVO vo) {
		// TODO Auto-generated method stub
		
		pDao.updateCertifyUpload(vo);
	}
	
	
	//프로그램 찜목록
	@Override
	public List<ProgramVO> wishList(Map map) {
		// TODO Auto-generated method stub
		return zDAo.wishList(map);
	}
	@Override
	public int wishListTotalPage(Map map) {
		// TODO Auto-generated method stub
		return zDAo.wishListTotalPage(map);
	}
	
	//센터 프로그램 정보
	@Override
	public List<ProgramVO> centerProgramList(Map map) {
		// TODO Auto-generated method stub
		return pDao.centerProgramList(map);
	}
	@Override
	public int centerProgramTotalPage(String centername) {
		// TODO Auto-generated method stub
		return pDao.centerProgramTotalPage(centername);
	}
	
	
	//클래스 위시리스트
	@Override
	public List<DonClassVO> donClassWishList(Map map) {
		// TODO Auto-generated method stub
		return cDao.donClassWishList(map);
	}
	@Override
	public int donClassWishTotalpage(Map map) {
		// TODO Auto-generated method stub
		return cDao.donClassWishTotalpage(map);
	}

}
