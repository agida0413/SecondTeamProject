package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.OptionVO;
import com.sist.vo.ProgramVO;
import com.sist.vo.VdataboardVO;
import com.sist.vo.VprogramApplyVO;

public interface ProgramService {
	//옵션
	public List<OptionVO> stateOption();
	public List<OptionVO> cityOption(String state);
	public List<OptionVO> majorOption();
	public List<OptionVO> minorOption(String major_option);

	
	
	//프로그램 조회
	public List<ProgramVO> programListData(Map map);
	
	public int programTotalPage(Map map);
	
	public ProgramVO programDetailData(int vno);
	
	//프로그램 신청
	public void programApplyInsert(VprogramApplyVO vo);
	public int getApplyCount(VprogramApplyVO vo);
	public List<VprogramApplyVO> applyList(Map map);
	
	public List<Integer> updateRunStVnoList();
	
	public List<Integer> updateEndStVnoList();
	public void updateRunSt(Map map);
	public void updateEndSt(Map map);
	
	public String updateAccess(int vano);
	public void updateRefuse(int vano);
	//프로그램 자료실
	public List<VdataboardVO> databoardListData(int start,int end);
	
	public int databoardTotalPage();
	
	public void databoardInsert(VdataboardVO vo);
	
	public VdataboardVO databoardDetailData(int dno);
	
	public void databoardDelete(int dno);
	public VdataboardVO databoardFileInfoData(int dno);
	
	public VprogramApplyVO getApplyFiles(int vano);
	
	public int applyListTotalPage(Map map);
}
