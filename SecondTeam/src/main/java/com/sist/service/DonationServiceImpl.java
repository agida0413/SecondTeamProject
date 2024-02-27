package com.sist.service;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.DonationDAO;
import com.sist.vo.DonationHistoryVO;
import com.sist.vo.DonationPayVO;
import com.sist.vo.DonationVO;

@Service  
public class DonationServiceImpl implements DonationService{
	@Autowired
	private DonationDAO dao;

	@Override
	public List<DonationVO> homeDonationListData() {
		// TODO Auto-generated method stub
		return dao.homeDonationListData();
	}

	@Override
	public List<DonationVO> donationListData(int start, int end) {
		// TODO Auto-generated method stub
		return dao.donationListData(start, end);
	}

	@Override
	public int donationListTotalPage() {
		// TODO Auto-generated method stub
		return dao.donationListTotalPage();
	}

	@Override
	public DonationVO donationDetailData(int dno) {
		// TODO Auto-generated method stub
		return dao.donationDetailData(dno);
	}

	@Override
	public List<DonationVO> donationCateListData(Map map) {
		// TODO Auto-generated method stub
		return dao.donationCateListData(map);
	}

	@Override
	public int donationCateListTotalPage(Map map) {
		// TODO Auto-generated method stub
		return dao.donationCateListTotalPage(map);
	}

	@Override
	public List<DonationVO> donationOnlyCateListData(Map map) {
		// TODO Auto-generated method stub
		return dao.donationOnlyCateListData(map);
	}

	@Override
	public int donationOnlyCateListTotalPage(Map map) {
		// TODO Auto-generated method stub
		return dao.donationOnlyCateListTotalPage(map);
	}

	@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
	@Override
	public void donationPayInsert(DonationPayVO vo) {
		// TODO Auto-generated method stub
		dao.donationPayInsert(vo);
		dao.donationPayNowUpdate(vo);
		dao.donationPayPercentUpdate(vo.getDno());
	}

	@Override
	public void donationPayNowUpdate(DonationPayVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void donationPayPercentUpdate(int dno) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String donationPayListData(int dno, int page) throws JsonProcessingException {
		// TODO Auto-generated method stub
		int rowSize=10;
		int start=(rowSize*page)-(rowSize-1);
		int end=(rowSize*page);
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("dno", dno);
		
		List<DonationPayVO> list=dao.donationPayListData(map);
		int totalpage=dao.donationPayTotalPage(dno);
		int size=list.size();
		map=new HashMap();
		map.put("list", list);
		map.put("totalpage", totalpage);
		map.put("size", size);
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(map);
		
		return json;
	}

	@Override
	public String donation_related_vue(int dno) throws Exception {
		// TODO Auto-generated method stub
		DonationVO vo=dao.donationDetailData(dno);
		List<DonationVO> list=dao.donationCateRelatedListData(vo.getD_cate());
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd");
		String todayFm=sdf.format(new Date(System.currentTimeMillis()));
		Date enddate=sdf.parse(vo.getD_enddate());
		Date today=sdf.parse(todayFm);
		
		
		long diffSec=(enddate.getTime() - today.getTime())/1000;
		long diffDays=diffSec / (24*60*60);
		vo.setDday(diffDays);
		
		
		Map map=new HashMap();
		map.put("detail_data", vo);
		map.put("related_data", list);
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(map);
		
		return json;
	}

	// Commons ObjectMapper
	public String CommonsObjectMapper(Object obj) throws Exception{
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(obj);
		
		return json;
	}
	
	
	@Override
	public String donated_history_vue(String userid) throws Exception {
		// TODO Auto-generated method stub
		List<DonationHistoryVO> list=dao.donatedHistoryListData(userid);
		List<String> priceList=new ArrayList<>();
		List<String> nowList=new ArrayList<>();
		DecimalFormat decFormat = new DecimalFormat("###,###");
		String str = decFormat.format(12300000);
		if(list.size()!=0) {
			for(int i=0;i<list.size();i++) {
				String s=decFormat.format(list.get(i).getPrice());
				String n=decFormat.format(list.get(i).getDvo().getD_now());
				priceList.add(s);
				nowList.add(n);
			}
		}
		Map map=new HashMap();
		map.put("list", list);
		map.put("priceList", priceList);
		map.put("nowList", nowList);
		
		
		String json=CommonsObjectMapper(map);
		
		return json;
	}

	
	
	
}
