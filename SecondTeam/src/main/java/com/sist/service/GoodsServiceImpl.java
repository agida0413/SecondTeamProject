package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.GoodsDAO;
import com.sist.vo.GoodsReviewVO;
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
public int goodsTotalpage(Map map) {
	// TODO Auto-generated method stub
	return gDao.goodsTotalpage(map);
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

@Override
public List<GoodsVO> goodsCateMinorList(String category) {
	// TODO Auto-generated method stub
	return gDao.goodsCateMinorList(category);
}

@Override
public GoodsVO goodsDetailData(int gno) {
	// TODO Auto-generated method stub
	return gDao.goodsDetailData(gno);
}

@Override
public List<GoodsVO> goodsDetailImg(int gno) {
	// TODO Auto-generated method stub
	return gDao.goodsDetailImg(gno);
}

@Override
public void gReviewInsert(GoodsReviewVO vo) {
	// TODO Auto-generated method stub
	gDao.gReviewInsert(vo);
}

@Override
public List<GoodsReviewVO> gReviewListData(int gno) {
	// TODO Auto-generated method stub
	return gDao.gReviewListData(gno);
}

@Override
public void gReviewDelete(int rno) {
	// TODO Auto-generated method stub
	gDao.gReviewDelete(rno);
}

@Override
public void gReviewUpdate(GoodsReviewVO vo) {
	// TODO Auto-generated method stub
	gDao.gReviewUpdate(vo);
}

}
