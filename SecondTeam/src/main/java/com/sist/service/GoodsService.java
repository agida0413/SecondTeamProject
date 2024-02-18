package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.GoodsReviewVO;
import com.sist.vo.GoodsVO;

public interface GoodsService {
	public List<GoodsVO> goodsListData(Map map);
	public int goodsTotalpage(Map map);
	public List<GoodsVO> goodsCategoryList(Map map);
	public int goodsCategoryTotalpage(Map map);
	public List<GoodsVO> goodsCateMinorList(String category);
	public GoodsVO goodsDetailData(int gno);
	public List<GoodsVO> goodsDetailImg(int gno);
	//리뷰
	public void gReviewInsert(GoodsReviewVO vo);
	public List<GoodsReviewVO> gReviewListData(int gno);
	public void gReviewDelete(int rno);
	public void gReviewUpdate(GoodsReviewVO vo);
}
