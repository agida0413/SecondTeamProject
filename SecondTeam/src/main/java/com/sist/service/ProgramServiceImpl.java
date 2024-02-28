package com.sist.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sist.dao.OptionDAO;
import com.sist.dao.ProgramDataboardDAO;
import com.sist.dao.ProgramListDAO;
import com.sist.dao.ProgramRcAverageDAO;
import com.sist.dao.ProgramReplyDAO;
import com.sist.dao.ProgramWishDAO;
import com.sist.manager.WordManager;
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
	
	@Autowired
	private ProgramRcAverageDAO rcDao;
	
	@Autowired 
	private WordManager mgr;

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

	
	 @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
	@Override
	public String updateAccess(int vano) {
		String up="봉사활동 대기중";
		String result="";
		int vno=pDao.getVno(vano);
		ProgramVO vo=pDao.getCollectnumApplynum(vno);
		
		
		
		if (vo.getCollect_num()==vo.getApply_num()) {
			
			result="NO";
		}
		else {
				//신청인원===정원-1
			
			
			Map map=new HashMap();
			map.put("up", up);
			map.put("vano", vano);
			pDao.updateAcess(map);
			
				if(vo.getCollect_num()-1==vo.getApply_num()) {
					map.put("st", "모집완료");
					map.put("vno", vno);
					pDao.updateCollectState(map);
				}
			
			pDao.updateApplyNum(vno);
			result="YES";
		}
		
		return result;
		
		
	}

	@Override
	public void updateRefuse(int vano) {
		// TODO Auto-generated method stub
		String up="거절";
		Map map=new HashMap();
		map.put("up", up);
		map.put("vano", vano);
		pDao.updateRefuse(map);
	}
	
	
	@Override
	public VprogramApplyVO centerCertifyAccess(int vano) {
		// TODO Auto-generated method stub
		return pDao.centerCertifyAccess(vano);
	}
	
	
	@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
	@Override
	public void updateInformAfCertify(int vano) {
		VprogramApplyVO vo=pDao.getCertifyIdVno(vano);
		
		String id=vo.getId();
		int vno=vo.getVno();
		
		int wing=pDao.getCertifyWing(vno);
		
		Map map=new HashMap();
		map.put("wing", wing);
		map.put("id", id);
		map.put("state", "보상지급완료");
		map.put("vano", vano);
		
		pDao.updateProgramAfterState(map);
		
		pDao.updateProgramAfterWing(map);
		
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
	
	@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
	@Override
	public String updateWishList(Map map) {
		// TODO Auto-generated method stub
		zDao.updateWishList(map);
		
		return zDao.getWishState(map);
	}

	
	//센터 프로그램 인서트
	@Override
	public void insertCenterProgram(ProgramVO vo) {
		// TODO Auto-generated method stub
		pDao.insertCenterProgram(vo);
	}

	

	
	


	
	
//댓글
	 @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
	@Override
	public void insertReply(ProgramReplyVO vo) {
		// TODO Auto-generated method stub
		if(vo.getRtype()==2) {
		rDao.updateDepth(vo);
		}
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

	 @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
	@Override
	public void deleteReply(ProgramReplyVO vo) {
		// TODO Auto-generated method stub
		int depth = rDao.getDepth(vo);
		
		if(depth==0) {
			rDao.deleteReply(vo);
			rDao.updateMinusDepth(vo);
		}
		else {
			rDao.updateContent(vo);
			
			
		}
	}
	 
	 @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
	@Override
	public void replyHateInsert(Map map) {
			rDao.replyHateInsert(map);
		 
		 rDao.updateReplyLikeCountPlus(map);
		 int likeCount=rDao.getLikeCount(map);
		 int hateCount=rDao.getHateCount(map);
		 
		 int percent =0;
		 if (likeCount + hateCount != 0) {
			  percent=  likeCount / (likeCount + hateCount) * 100;
			    System.out.println("백분율: " + percent);
			} 
		 percent=(int) Math.round(percent);
		 map.put("likepercent", percent);
		rDao.updateReplyPercent(map);
	}
	 @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
	@Override
	public void replyLikeInsert(Map map) {
		rDao.replyLikeInsert(map);
		
		 rDao.updateReplyLikeCountPlus(map);
		 int likeCount=rDao.getLikeCount(map);
		 int hateCount=rDao.getHateCount(map);
		 
		 int percent =0;
		 if (likeCount + hateCount != 0) {
			  percent=  likeCount / (likeCount + hateCount) * 100;
			   
			} 
		 
		System.out.println(percent);
		 map.put("likepercent", percent);
		 rDao.updateReplyPercent(map);
	}
	 
	 @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
	@Override
	public void updateReplyLikeState(Map map) {
		// TODO Auto-generated method stub
			rDao.updateReplyLikeState(map);
			 
			 if(map.get("state").equals("YES")) {
				 rDao.updateReplyLikeCountPlus(map);
			 }else {
				 rDao.updateReplyMinusCountPlus(map);
			 }
			int likeCount=rDao.getLikeCount(map);
			 int hateCount=rDao.getHateCount(map);
			
			 double percent =0;
			 if (likeCount + hateCount != 0) {
				
				  percent=  likeCount / ((double)likeCount + (double)hateCount) * 100;
				  System.out.println(percent);
				 
				} 
			 percent=(int) Math.round(percent);
			
			 map.put("likepercent", percent);
			 rDao.updateReplyPercent(map);
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

	
//추천 프로그램
	@Cacheable("recommandListCache")
	@Override
	public List<ProgramVO> recommandList(Map map) {
		// TODO Auto-generated method stub
		List<String>recList=rcDao.recTitleData(map);
		  Set<String> titleSet = new HashSet<>(); // 중복을 제거할 Set
		  for (String str : recList) {
			titleSet.add(str);
			
			
		}
		List<ProgramVO> list = rcDao.recCateData(map);
		List<ProgramVO> returnlist =new ArrayList<ProgramVO>();
		int i=0;
		
		for (ProgramVO vo : list) {
			
			if(i==8) {
				break;
			}
			
			map.put("mjf", vo.getMajor_field());
			
			
			List<ProgramVO> vo2=rcDao.recommandList(map);
			int index=0;
				for (ProgramVO programVO : vo2) {
						
				
					
					
					if(!titleSet.contains(vo2.get(index).getTitle())) {
						returnlist.add(vo2.get(index));
						
						i++;
						
						break;
					}
					
					index++;
				}
			
				
				
			
			
			
		}
		return  returnlist;
	}
//추천 검색키워드
	@Override
	public List<String> recommandWordList(Map map) {
		List<String> titleList=rcDao.recTitleData(map);
		List<String> returnList=new ArrayList<String>();
		
		if(titleList.size()>0) {
			String titles="";
			for (String title : titleList) {
				titles+=title;
			}
			
			returnList = mgr.wordListData(titles);

		}
		return returnList;
		
	}
	



	
	
	
	
}
