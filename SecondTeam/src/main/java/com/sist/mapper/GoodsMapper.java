package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.GoodsVO;
import java.util.*;

public interface GoodsMapper {
@Select("SELECT gno,g_name,g_price,g_img,num "
		+ "FROM(SELECT gno,g_name,g_price,g_img,ROWNUM AS num "
		+ "FROM(SELECT gno,g_name,g_price,g_img "
		+ "FROM goodslist ORDER BY gno ASC)) "
		+ "WHERE num BETWEEN #{start} AND #{end}")
public List<GoodsVO> goodsListData(Map map);

@Select("SELECT CEIL(COUNT(*)/12.0) FROM goodslist")
public int goodsTotalpage();
}
