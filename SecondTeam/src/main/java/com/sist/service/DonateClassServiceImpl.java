package com.sist.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.ClassInformDAO;
import com.sist.dao.DonClassReserveDAO;
import com.sist.dao.DonClassReviewDAO;
import com.sist.dao.MemberDAO;
import com.sist.manager.DonClassMailManager;
import com.sist.vo.DonClassResHistoryVO;
import com.sist.vo.DonClassReserveVO;
import com.sist.vo.DonClassReviewVO;
import com.sist.vo.DonClassVO;
import com.sist.vo.MemberVO;

@Service
public class DonateClassServiceImpl implements DonateClassService{
@Autowired
private ClassInformDAO cIdao;

@Autowired
private DonClassReviewDAO rDao;

@Autowired 
private DonClassReserveDAO resDao;

@Autowired
private DonClassMailManager mgr;

//재능기부 클래스 리스트 관련

@Override
public List<DonClassVO> donateClassList(Map map) {
	// TODO Auto-generated method stub
	return cIdao.donateClassList(map);
}

@Override
public int donateClassTotalPage(Map map) {
	// TODO Auto-generated method stub
	return cIdao.donateClassTotalPage(map);
}

@Override
public int donateClassCategoryCount(String category) {
	// TODO Auto-generated method stub
	return cIdao.donateClassCategoryCount(category);
}

@Override
public DonClassVO cookieList(int dcno) {
	// TODO Auto-generated method stub
	return cIdao.cookieList(dcno);
}


//상세정보
@Override
public List<String> classSubimageList(int dcno) {
	// TODO Auto-generated method stub
	return cIdao.classSubimageList(dcno);
}

@Override
public DonClassVO classDetailData(int dcno) {
	// TODO Auto-generated method stub
	return cIdao.classDetailData(dcno);
}


//찜하기
@Override
public int getWishCount(Map map) {
	// TODO Auto-generated method stub
	return cIdao.getWishCount(map);
}

@Override
public String getWishState(Map map) {
	// TODO Auto-generated method stub
	return cIdao.getWishState(map);
}

@Override
public void insertWishList(Map map) {
	// TODO Auto-generated method stub
	cIdao.insertWishList(map);
}

@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
@Override
public String updateWishList(Map map) {
	// TODO Auto-generated method stub
	 cIdao.updateWishList(map);
	 
	 return cIdao.getWishState(map);
}

//리뷰
@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
@Override
public void insertReview(DonClassReviewVO vo) {
	// TODO Auto-generated method stub
	rDao.insertReview(vo);
	int reviewNum=rDao.reviewNum(vo);
	
	double sum=rDao.reviewTotal(vo);
	//리뷰 인서트
		
	double newGrade = (sum) / (reviewNum);
	newGrade = Math.round(newGrade * 10.0) / 10.0;
	
	//클래스 평균 - > 업데이트
	DonClassVO dvo = new DonClassVO();
	dvo.setScore(newGrade);
	dvo.setDcno(vo.getObjno());
	
	
	rDao.updateClassScore(dvo);
}

@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
@Override
public void deleteReview(DonClassReviewVO vo) {
	// TODO Auto-generated method stub
	rDao.deleteReview(vo);
	int reviewNum=rDao.reviewNum(vo);
	
	double sum=rDao.reviewTotal(vo);
	
	double newGrade = (sum) / (reviewNum);
	newGrade = Math.round(newGrade * 10.0) / 10.0;
	
	if(reviewNum==0) {
		newGrade=2.5;
	}
	DonClassVO dvo = new DonClassVO();
	dvo.setScore(newGrade);
	dvo.setDcno(vo.getObjno());
	
	
	rDao.updateClassScore(dvo);
	rDao.deleteReview(vo);
	
}

@Override
public int reviewTotalpage(Map map) {
	// TODO Auto-generated method stub
	return rDao.reviewTotalpage(map);
}

@Override
public List<DonClassReviewVO> reviewList(Map map) {
	// TODO Auto-generated method stub
	return rDao.reviewList(map);
}

@Override
public int reviewNum(DonClassReviewVO vo) {
	// TODO Auto-generated method stub
	return rDao.reviewNum(vo);
}



@Override
public String getFilename(DonClassReviewVO vo) {
	// TODO Auto-generated method stub
	return rDao.getFilename(vo);
}


//월별 예약인원 정보
@Override
public String monthInwonList(int dcno, int month) throws JsonProcessingException {
	// TODO Auto-generated method stub
	Map map=new HashMap();
	map.put("dcno",dcno);
	map.put("month", month);
	
	List<Integer> list = resDao.monthInwonList(map);
	
	
			ObjectMapper mapper= new ObjectMapper();
	String json=mapper.writeValueAsString(list);
	return json;
}


//일별 예약가능정보
@Override
public String reserveInform(int dcno, int month, int day) throws JsonProcessingException {
	Map map =new HashMap();
	map.put("dcno",dcno);
	map.put("month", month);
	map.put("day", day);
	
	List<DonClassReserveVO>list = resDao.reserveInform(map);
	ObjectMapper mapper= new ObjectMapper();
	String json=mapper.writeValueAsString(list);
	
	return json;
}


//예약하기(인서트)
@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
@Override
public String insertReserveInform(DonClassResHistoryVO vo, int rno,String hostName) {
	// TODO Auto-generated method stub
	String result="";
	int userWing=resDao.userWing(vo.getUserid());
	
	if(vo.getWing()>userWing) {
		result="NO";
	}
	else {
		vo.setRno(rno);
		resDao.insertReserveInform(vo);
		int curval=resDao.curvalSeQ();
		resDao.resCanNumMinus(vo.getRnum(), rno);
		resDao.UpdateUserMinusWing(vo.getWing(), vo.getUserid());
		resDao.UpdateUserPlusWing(vo.getWing(), hostName);
		result="YES";
		String email=resDao.getEmail(vo.getUserid());
		
		DonClassVO mVo = resDao.mailInfo(curval);
		
		mgr.sendMail(email,mVo);
	}
	
	return result;
}


//새클래스 등록
@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
@Override
public void newClassInsert(DonClassVO vo, List<String> list,String[] partTime1,String[] partTime2,String[] partTime3) {
	// TODO Auto-generated method stub
	cIdao.newClassInsert(vo);
	
	int dcno=cIdao.getDcSeq();
		Map map =new HashMap();
		map.put("dcno", dcno);
		
	for (String subimg : list) {
		map.put("subimage", subimg);
		cIdao.newClassSubImgInsert(map);
	}
	
	map.put("can_num", vo.getFull_num());
	
	for(int month=2;month<=3;month++) {
		map.put("month", month);
		for(int day=1;day<=31;day++) {
			map.put("day", day);
			
				map.put("st", partTime1[0]);
				map.put("et", partTime1[1]);
				cIdao.newClassReserveInformInsert(map);
				map.put("st", partTime2[0]);
				map.put("et", partTime2[1]);
				cIdao.newClassReserveInformInsert(map);
				map.put("st", partTime3[0]);
				map.put("et", partTime3[1]);
				cIdao.newClassReserveInformInsert(map);
				
				
			
		}
	}
	
	
	
}

@Override
public DonClassVO footerDonclassAopData() {
	// TODO Auto-generated method stub
	return cIdao.footerDonclassAopData();
}

@Override
public List<DonClassVO> mainDonclassData() {
	// TODO Auto-generated method stub
	return cIdao.mainDonclassData();
}





}
