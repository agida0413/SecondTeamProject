package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.GoodsVO;
import java.util.*;

public interface GoodsMapper {
// 상품 전체 리스트
@Select("SELECT gno,g_name,g_price,g_img,num "
		+ "FROM(SELECT gno,g_name,g_price,g_img,ROWNUM AS num "
		+ "FROM(SELECT gno,g_name,g_price,g_img "
		+ "FROM goodslist ORDER BY gno ASC)) "
		+ "WHERE num BETWEEN #{start} AND #{end}")
public List<GoodsVO> goodsListData(Map map);

// 상품 전체 페이징
@Select("SELECT CEIL(COUNT(*)/12.0) FROM goodslist")
public int goodsTotalpage();

//상품 카테고리 분류 리스트
@Select("SELECT gno,g_name,g_price,g_img,num "
		+ "FROM(SELECT gno,g_name,g_price,g_img,ROWNUM AS num "
		+ "FROM(SELECT gno,g_name,g_price,g_img "
		+ "FROM goodslist WHERE category LIKE #{category} "
		+ "ORDER BY gno ASC)) "
		+ "WHERE num BETWEEN #{start} AND #{end}")
public List<GoodsVO> goodsCategoryList(Map map);

// 상품 카테고리 페이징
@Select("SELECT CEIL(COUNT(*)/12.0) FROM goodslist WHERE category LIKE #{category}")
public int goodsCategoryTotalpage(Map map);

}
