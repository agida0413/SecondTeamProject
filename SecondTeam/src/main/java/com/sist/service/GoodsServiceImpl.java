package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.GoodsDAO;
import com.sist.vo.CartVO;
import com.sist.vo.GoodsReviewVO;
import com.sist.vo.GoodsVO;
import com.sist.vo.WishListVO;

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

@Override
public void gReviewInsert(GoodsReviewVO vo) {
	// TODO Auto-generated method stub
	gDao.gReviewInsert(vo);
}

@Override
public void cartInsert(CartVO vo) {
	// TODO Auto-generated method stub
	gDao.cartInsert(vo);
}

@Override
public List<GoodsVO> goodsWishList(String id) {
	// TODO Auto-generated method stub
	return gDao.goodsWishList(id);
}

@Override
public void wishDelete(Map map) {
	// TODO Auto-generated method stub
	gDao.wishDelete(map);
}

@Override
public void wishInsert(WishListVO vo) {
	// TODO Auto-generated method stub
	gDao.wishInsert(vo);
}

@Override
public WishListVO wishCk(WishListVO vo) {
	// TODO Auto-generated method stub
	return gDao.wishCk(vo);
}

@Override
public List<GoodsVO> mainGoodsList() {
	// TODO Auto-generated method stub
	return gDao.mainGoodsList();
}

@Override
public GoodsVO goodsFooterAOPData() {
	// TODO Auto-generated method stub
	return gDao.goodsFooterAOPData();
}


}
