package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.DonStoreDAO;
import com.sist.vo.DonStoreVO;
@Service
public class DonStoreServiceImpl implements DonStoreService{
@Autowired
private DonStoreDAO dao;

@Override
public List<DonStoreVO> dnoStoreSearch(Map map) {
	// TODO Auto-generated method stub
	return dao.dnoStoreSearch(map);
}

@Override
public int donTotalpage(Map map) {
	// TODO Auto-generated method stub
	return dao.donTotalpage(map);
}

@Override
public DonStoreVO donDetailData(int dno) {
	// TODO Auto-generated method stub
	return dao.donDetailData(dno);
}


}
