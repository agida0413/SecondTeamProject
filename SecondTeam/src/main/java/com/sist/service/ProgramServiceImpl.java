package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.OptionDAO;
import com.sist.dao.ProgramDataboardDAO;
import com.sist.dao.ProgramListDAO;
import com.sist.dao.ProgramRcAverageDAO;
import com.sist.dao.ProgramReplyDAO;
import com.sist.dao.ProgramWishDAO;
import com.sist.vo.OptionVO;
import com.sist.vo.ProgramReplyVO;
import com.sist.vo.ProgramStatisticsVO;
import com.sist.vo.ProgramVO;
import com.sist.vo.VdataboardVO;
import com.sist.vo.VprogramApplyVO;
import com.sist.vo.WishListVO;

@Service
public class ProgramServiceImpl implements ProgramService {

	@Autowired
	private ProgramListDAO pDao;
	@Autowired
	private OptionDAO oDao;
	@Autowired
	private ProgramDataboardDAO dbDAO;
	@Autowired
	private ProgramWishDAO zDao;

	@Autowired
	private ProgramReplyDAO rDao;

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

	
	
	

	
	//위시리스트
	
	@Override
	public int getWishCount(Map map) {
		// TODO Auto-generated method stub
		return zDao.getWishCount(map);
	}

	@Override
	public String getWishState(Map map) {
		// TODO Auto-generated method stub
		return zDao.getWishState(map);
	}

	@Override
	public void insertWishList(Map map) {
		// TODO Auto-generated method stub
		zDao.insertWishList(map);
	}

	@Override
	public String updateWishList(Map map) {
		// TODO Auto-generated method stub
		return zDao.updateWishList(map);
	}

	
	//센터 프로그램 인서트
	@Override
	public void insertCenterProgram(ProgramVO vo) {
		// TODO Auto-generated method stub
		pDao.insertCenterProgram(vo);
	}

	

	
	


	
	
//댓글
	@Override
	public void insertReply(ProgramReplyVO vo) {
		// TODO Auto-generated method stub
		rDao.insertReply(vo);
	}

	@Override
	public List<ProgramReplyVO> replyList(Map map) {
		// TODO Auto-generated method stub
		return rDao.replyList(map);
	}

	@Override
	public int replyTotalPage(ProgramReplyVO vo) {
		// TODO Auto-generated method stub
		return rDao.replyTotalPage(vo);
	}

	@Override
	public ProgramReplyVO updateInfoData(int rno) {
		// TODO Auto-generated method stub
		return rDao.updateInfoData(rno);
	}

	@Override
	public void updateReply(ProgramReplyVO vo) {
		// TODO Auto-generated method stub
		rDao.updateReply(vo);
	}

	@Override
	public void deleteReply(ProgramReplyVO vo) {
		// TODO Auto-generated method stub
		rDao.deleteReply(vo);
	}

	@Override
	public void replyHateInsert(Map map) {
		// TODO Auto-generated method stub
		rDao.replyHateInsert(map);
	}

	@Override
	public void replyLikeInsert(Map map) {
		// TODO Auto-generated method stub
		rDao.replyLikeInsert(map);
	}

	@Override
	public void updateReplyLikeState(Map map) {
		// TODO Auto-generated method stub
		rDao.updateReplyLikeState(map);
	}

	@Override
	public int replyTotalAmount(ProgramReplyVO vo) {
		// TODO Auto-generated method stub
		return rDao.replyTotalAmount(vo);
	}

	@Override
	public int myReplyTotalPage(Map map) {
		// TODO Auto-generated method stub
		return rDao.myReplyTotalPage(map);
	}
	



	
	
	
	
}
