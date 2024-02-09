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
	public List<VprogramApplyVO> applyList(String centername) {
		// TODO Auto-generated method stub
		return pDao.applyList(centername);
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
