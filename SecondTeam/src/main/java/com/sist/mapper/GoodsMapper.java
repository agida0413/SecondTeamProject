package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.GoodsVO;
import java.util.*;

public interface GoodsMapper {
// 상품 전체 리스트
	@Select({
	    "<script>",
	    "SELECT DISTINCT gl.gno, gl.g_name, gl.g_price, gl.g_img, tn.type_names, tn.type_img, num ",
	    "FROM (",
	    "   SELECT gno, g_name, g_price, g_img, ROWNUM AS num ",
	    "   FROM (",
	    "       SELECT gno, g_name, g_price, g_img ",
	    "       FROM goodslist ",
	    "       <if test='ss != null'>",
	    "       WHERE g_name LIKE '%'||#{ss}||'%' ", 
	    "       </if>",
	    "       ORDER BY gno ASC",
	    "   )",
	    ") gl",
	    "LEFT JOIN typename_2 tn ON gl.gno = tn.gno", 
	    "WHERE num BETWEEN #{start} AND #{end}",
	    "</script>"
	})
	public List<GoodsVO> goodsListData(Map map);

// 상품 전체 페이징
	@Select({
	    "<script>",
	    "SELECT CEIL(COUNT(*)/12.0) FROM goodslist",
	    "<if test='ss != null'>",
	    "WHERE g_name LIKE '%'||#{ss}||'%'",
	    "</if>",
	    "</script>"
	})
public int goodsTotalpage(Map map);

//상품 카테고리 분류 리스트
	@Select({
	    "<script>",
	    "SELECT DISTINCT gl.gno, gl.g_name, gl.g_price, gl.g_img, gl.category_minor, tn.type_names, tn.type_img, num ",
	    "FROM (",
	    "   SELECT gno, g_name, g_price, g_img, category_minor, ROWNUM AS num ",
	    "   FROM (",
	    "       SELECT gno, g_name, g_price, g_img, category_minor ",
	    "       FROM goodslist ",
	    "       WHERE (category LIKE #{category} OR category_minor LIKE #{category_minor}) AND g_name LIKE '%'||#{ss}||'%'  ", 
	    "       ORDER BY gno ASC",
	    "   )",
	    ") gl",
	    "LEFT JOIN typename_2 tn ON gl.gno = tn.gno",
	    "WHERE num BETWEEN #{start} AND #{end}",
	    "</script>"
	})
public List<GoodsVO> goodsCategoryList(Map map);

// 상품 카테고리 페이징
@Select("SELECT CEIL(COUNT(*)/12.0) FROM goodslist WHERE (category LIKE #{category} OR category_minor LIKE #{category_minor}) AND g_name LIKE '%'||#{ss}||'%'")
public int goodsCategoryTotalpage(Map map);

//상품 카테고리 소분류 리스트
@Select("SELECT DISTINCT category,category_minor FROM goodslist WHERE category LIKE #{category}")
public List<GoodsVO> goodsCateMinorList(String category);

//상품 디테일 
@Select("SELECT gno,g_name,g_price,g_img FROM goodslist WHERE gno=#{gno}")
public GoodsVO goodsDetailData(int gno);

// 상품 디테일 이미지
@Select("SELECT gl.gno, gs.g_subimg FROM goodslist gl "
		+ "JOIN goods_sub_img gs ON gl.gno=gs.gno WHERE gl.gno=#{gno}")
public List<GoodsVO> goodsDetailImg(int gno);
}





 
