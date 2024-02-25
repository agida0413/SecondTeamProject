package com.sist.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sist.commons.CommonsFunction;
import com.sist.dao.ClassInformDAO;
import com.sist.dao.DonClassReserveDAO;
import com.sist.dao.ProgramListDAO;
import com.sist.dao.ProgramWishDAO;
import com.sist.mapper.ProgramWishMapper;
import com.sist.vo.DonClassResHistoryVO;
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
	
	@Autowired
	private DonClassReserveDAO resDao;
	
	@Autowired
	private CommonsFunction cf;
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
	@Override
	public Map donClassReserveHistoryList(String page,String userid) {
		Map returnMap=new HashMap();
		if(page==null) {
			page="1";
		}
		
		int curpage=Integer.parseInt(page);
		int rowsize=5;
		
		int start=cf.start(rowsize, curpage);
		int end=cf.end(rowsize, curpage);
		
		Map map =new HashMap();
		map.put("start",start);
		map.put("end", end);
		map.put("userid", userid);
		
		List<DonClassVO> list =resDao.donClassReserveHistoryList(map);
		int totalpage=resDao.donClassReserveHistoryTotalPage(userid);
		
		final int BLCOK=10;
		int startpage=cf.startPage(BLCOK, curpage);
		int endpage=cf.endPage(BLCOK, curpage, totalpage);
		
		returnMap.put("list", list);
		returnMap.put("totalpage", totalpage);
		returnMap.put("startpage", startpage);
		returnMap.put("endpage", endpage);
		returnMap.put("page", curpage);
		returnMap.put("size", list.size());
		
		return returnMap;
	}
	
	
	//클래스 예약취소
	@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
	@Override
	public void reserveCancel(DonClassResHistoryVO vo,String hostname) {
		resDao.UpdateUserMinusWing(vo.getWing(), hostname);
		resDao.UpdateUserPlusWing(vo.getWing(), vo.getUserid());
		resDao.resCanNumPlus(vo.getRnum(), vo.getRno());
		
		vo.setState("예약취소");
		resDao.updateResState(vo);
	}
	@Override
	public Map myDonClassList(String id,String page) {
		// TODO Auto-generated method stub
		
		Map returnMap=new HashMap();
		if(page==null) {
			page="1";
		}
		
		int curpage=Integer.parseInt(page);
		int rowsize=5;
		
		int start=cf.start(rowsize, curpage);
		int end=cf.end(rowsize, curpage);
		
		
		Map map =new HashMap();
		map.put("start",start);
		map.put("end", end);
		map.put("id", id);
		
		List<DonClassVO>list= cDao.myDonClassList(map);
		int totalpage=cDao.myDonClassTotalPage(id);
		
		final int BLCOK=10;
		int startpage=cf.startPage(BLCOK, curpage);
		int endpage=cf.endPage(BLCOK, curpage, totalpage);
		
		returnMap.put("list", list);
		returnMap.put("totalpage", totalpage);
		returnMap.put("startpage", startpage);
		returnMap.put("endpage", endpage);
		returnMap.put("page", curpage);
		returnMap.put("size", list.size());
		
		return returnMap;
	}
	@Override
	public Map myDonclassResHistoryList(String userid, String page) {
		// TODO Auto-generated method stub
		Map returnMap=new HashMap();
		if(page==null) {
			page="1";
		}
		
		int curpage=Integer.parseInt(page);
		int rowsize=5;
		
		int start=cf.start(rowsize, curpage);
		int end=cf.end(rowsize, curpage);
		
		Map map =new HashMap();
		map.put("start",start);
		map.put("end", end);
		map.put("userid", userid);
		
		List<DonClassVO>list=resDao.myDonclassResHistoryList(map);
		
		int totalpage=resDao.myDonclassResHistoryTotalPage(userid);
		final int BLCOK=10;
		int startpage=cf.startPage(BLCOK, curpage);
		int endpage=cf.endPage(BLCOK, curpage, totalpage);
		
		returnMap.put("list", list);
		returnMap.put("totalpage", totalpage);
		returnMap.put("startpage", startpage);
		returnMap.put("endpage", endpage);
		returnMap.put("page", curpage);
		returnMap.put("size", list.size());
		
		return returnMap;
	}

}
