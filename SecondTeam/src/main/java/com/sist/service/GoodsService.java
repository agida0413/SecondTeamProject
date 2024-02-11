package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.GoodsVO;

public interface GoodsService {
	public List<GoodsVO> goodsListData(Map map);
	public int goodsTotalpage();
	public List<GoodsVO> goodsCategoryList(Map map);
	public int goodsCategoryTotalpage(Map map);
}
