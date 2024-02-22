package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.OptionVO;
import com.sist.vo.ProgramReplyVO;
import com.sist.vo.ProgramStatisticsVO;
import com.sist.vo.ProgramVO;
import com.sist.vo.VdataboardVO;
import com.sist.vo.VprogramApplyVO;
import com.sist.vo.WishListVO;

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
	
	public VprogramApplyVO centerCertifyAccess(int vano);
	
	public void updateInformAfCertify(int vano);
	//프로그램 자료실
	public List<VdataboardVO> databoardListData(int start,int end);
	
	public int databoardTotalPage();
	
	public void databoardInsert(VdataboardVO vo);
	
	public VdataboardVO databoardDetailData(int dno);
	
	public void databoardDelete(int dno);
	public VdataboardVO databoardFileInfoData(int dno);
	
	public VprogramApplyVO getApplyFiles(int vano);
	
	public int applyListTotalPage(Map map);
	
	
	
	
	//위시리스트
	
	public int getWishCount(Map map);
	public String getWishState(Map map);
	public void insertWishList(Map map);
	
	public String updateWishList(Map map);
	
	
	//센터프로그램 인서트
	public void insertCenterProgram(ProgramVO vo);
	
	
	
	
	//댓글
	public void insertReply(ProgramReplyVO vo);
	public List<ProgramReplyVO> replyList(Map map);
	public int replyTotalPage(ProgramReplyVO vo);
	public ProgramReplyVO updateInfoData(int rno);
	public void updateReply(ProgramReplyVO vo);
	public void deleteReply(ProgramReplyVO vo);
	 public void replyHateInsert(Map map);
		public void replyLikeInsert(Map map); 
		public void updateReplyLikeState(Map map);
		public int replyTotalAmount(ProgramReplyVO vo);
		public int myReplyTotalPage(Map map);
}
