package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.OptionDAO;
import com.sist.dao.ProgramDataboardDAO;
import com.sist.dao.ProgramListDAO;
import com.sist.vo.OptionVO;
import com.sist.vo.ProgramVO;
import com.sist.vo.VdataboardVO;
import com.sist.vo.VprogramApplyVO;

@Service
public class ProgramServiceImpl implements ProgramService {

	@Autowired
	private ProgramListDAO pDao;
	@Autowired
	private OptionDAO oDao;
	@Autowired
	private ProgramDataboardDAO dbDAO;

	@Override
	public List<OptionVO> stateOption() {
	
		return oDao.stateOption();
	}

	@Override
	public List<OptionVO> cityOption(String state) {
		
		return oDao.cityOption(state);
	}

	@Override
	public List<OptionVO> majorOption() {
		// TODO Auto-generated method stub
		return oDao.majorOption();
	}

	@Override
	public List<OptionVO> minorOption(String major_option) {
		// TODO Auto-generated method stub
		return oDao.minorOption(major_option);
	}

	
	//프로그램
	@Override
	public List<ProgramVO> programListData(Map map) {
		// TODO Auto-generated method stub
		return pDao.programListData(map);
	}

	@Override
	public int programTotalPage(Map map) {
		// TODO Auto-generated method stub
		return pDao.programTotalPage(map);
	}

	@Override
	public ProgramVO programDetailData(int vno) {
		// TODO Auto-generated method stub
		return pDao.programDetailData(vno);
	}
	
	
	
	
	
	
	//프로그램 신청
	@Override
	public void programApplyInsert(VprogramApplyVO vo) {
		pDao.programApplyInsert(vo);
		
	}
	
	@Override
	public int getApplyCount(VprogramApplyVO vo) {
		// TODO Auto-generated method stub
		return pDao.getApplyCount(vo);
	}
	
	@Override
	public List<VprogramApplyVO> applyList(Map map) {
		// TODO Auto-generated method stub
		return pDao.applyList(map);
	}
	
	@Override
	public VprogramApplyVO getApplyFiles(int vano) {
		// TODO Auto-generated method stub
		return pDao.getApplyFiles(vano);
	}
	
	@Override
	public int applyListTotalPage(Map map) {
		// TODO Auto-generated method stub
		return pDao.applyListTotalPage(map);
	}


	@Override
	public List<Integer> updateRunStVnoList() {
		// TODO Auto-generated method stub
		return pDao.updateRunStVnoList();
	}

	@Override
	public List<Integer> updateEndStVnoList() {
		// TODO Auto-generated method stub
		return pDao.updateEndStVnoList();
	}
	
	
	@Override
	public void updateRunSt(Map map) {
		// TODO Auto-generated method stub
		pDao.updateRunSt(map);
	}

	@Override
	public void updateEndSt(Map map) {
		// TODO Auto-generated method stub
		pDao.updateEndSt(map);
	}

	@Override
	public String updateAccess(int vano) {
		return  pDao.updateAccess(vano);
		
	}

	@Override
	public void updateRefuse(int vano) {
		// TODO Auto-generated method stub
		pDao.updateRefuse(vano);
	}
	
	
	@Override
	public VprogramApplyVO centerCertifyAccess(int vano) {
		// TODO Auto-generated method stub
		return pDao.centerCertifyAccess(vano);
	}
	
	
	@Override
	public void updateInformAfCertify(int vano) {
		pDao.updateInformAfCertify(vano);
		
	}

	
	
	//프로그램 자료실
	@Override
	public List<VdataboardVO> databoardListData(int start, int end) {
		// TODO Auto-generated method stub
		return dbDAO.databoardListData(start, end);
	}

	@Override
	public int databoardTotalPage() {
		// TODO Auto-generated method stub
		return dbDAO.databoardTotalPage();
	}

	@Override
	public void databoardInsert(VdataboardVO vo) {
		// TODO Auto-generated method stub
		dbDAO.databoardInsert(vo);
	}

	@Override
	public VdataboardVO databoardDetailData(int dno) {
		// TODO Auto-generated method stub
		return dbDAO.databoardDetailData(dno);
	}

	@Override
	public void databoardDelete(int dno) {
		dbDAO.databoardDelete(dno);
		
	}

	@Override
	public VdataboardVO databoardFileInfoData(int dno) {
		// TODO Auto-generated method stub
		return dbDAO.databoardFileInfoData(dno);
	}

	
	

	

	
	

	
	

	



	
	
	
	
}
