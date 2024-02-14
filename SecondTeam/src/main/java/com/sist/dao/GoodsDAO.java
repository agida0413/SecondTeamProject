package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.GoodsMapper;
import com.sist.vo.GoodsVO;

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
}
