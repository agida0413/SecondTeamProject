package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.GoodsDAO;
import com.sist.vo.GoodsVO;

@Service
public class GoodsServiceImpl implements GoodsService{
@Autowired
private GoodsDAO gDao;

@Override
public List<GoodsVO> goodsListData(Map map) {
	// TODO Auto-generated method stub
	return gDao.goodsListData(map);
}

@Override
public int goodsTotalpage() {
	// TODO Auto-generated method stub
	return gDao.goodsTotalpage();
}

@Override
public List<GoodsVO> goodsCategoryList(Map map) {
	// TODO Auto-generated method stub
	return gDao.goodsCategoryList(map);
}

@Override
public int goodsCategoryTotalpage(Map map) {
	// TODO Auto-generated method stub
	return gDao.goodsCategoryTotalpage(map);
}
}
