package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.GoodsMapper;
import com.sist.vo.CartVO;
import com.sist.vo.GoodsReviewVO;
import com.sist.vo.GoodsVO;
import com.sist.vo.WishListVO;

@Repository
public class GoodsDAO {
@Autowired
private GoodsMapper mapper;
public List<GoodsVO> goodsListData(Map map){
	return mapper.goodsListData(map);
}
public int goodsTotalpage(Map map) {
	return mapper.goodsTotalpage(map);
}
public List<GoodsVO> goodsCategoryList(Map map){
	return mapper.goodsCategoryList(map);
}
public int goodsCategoryTotalpage(Map map){
	return mapper.goodsCategoryTotalpage(map);
}
public List<GoodsVO> goodsCateMinorList(String category){
	return mapper.goodsCateMinorList(category);
}
public GoodsVO goodsDetailData(int gno) {
	return mapper.goodsDetailData(gno);
}
public List<GoodsVO> goodsDetailImg(int gno){
	return mapper.goodsDetailImg(gno);
}
public void gReviewInsert(GoodsReviewVO vo) {
	mapper.gReviewInsert(vo);
}
public List<GoodsReviewVO> gReviewListData(int gno){
	return mapper.gReviewListData(gno);
}
public void gReviewDelete(int rno) {
	mapper.gReviewDelete(rno);
}
public void gReviewUpdate(GoodsReviewVO vo) {
	mapper.gReviewUpdate(vo);
}
public void cartInsert(CartVO vo) {
	mapper.cartInsert(vo);
}
public void wishInsert(WishListVO vo) {
	mapper.gLikeIncrese();
	mapper.wishInsert(vo);
}
public WishListVO wishCk(WishListVO vo) {
	return mapper.wishCk(vo);
}
public void wishDelete(Map map) {
	mapper.wishDelete(map);
}
public List<GoodsVO> goodsWishList(String id){
	return mapper.goodsWishList(id);
}
public List<GoodsVO> mainGoodsList(){
	return mapper.mainGoodsList();
}
public GoodsVO goodsFooterAOPData() {
	return mapper.goodsFooterAOPData();
}

}
