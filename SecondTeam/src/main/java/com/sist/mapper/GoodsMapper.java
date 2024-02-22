package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.CartVO;
import com.sist.vo.GoodsReviewVO;
import com.sist.vo.GoodsVO;
import com.sist.vo.WishListVO;

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
@Select("SELECT gl.gno, gs.g_subimg, tn.type_img FROM goodslist gl "
		+ "JOIN goods_sub_img gs ON gl.gno=gs.gno "
		+ "JOIN typename tn ON gl.gno=tn.gno "
		+ "WHERE gl.gno=#{gno}")
public List<GoodsVO> goodsDetailImg(int gno);

//상품 리뷰 insert
@Insert("INSERT INTO goodsReview "
		+ "VALUES(gr_gno_seq.nextval,#{gno},#{userid},#{username},#{subject},#{content},SYSDATE,#{score},#{filename},#{filesize},#{filecount})")
public void gReviewInsert(GoodsReviewVO vo);

// 상품 리뷰 리스트
@Select("SELECT rno,gno,userid,username,subject,content,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday,score,filename,filesize,filecount "
		+ "FROM goodsReview "
		+ "WHERE gno=#{gno} ORDER BY rno DESC")
public List<GoodsReviewVO> gReviewListData(int gno);

// 상품 리뷰 삭제
@Delete("DELETE FROM goodsReview WHERE rno=#{rno}")
public void gReviewDelete(int rno);

//상품 리뷰 업데이트
@Delete("UPDATE goodsReview SET content=#{content},regdate=SYSDATE,score=#{score} "
		+ "WHERE rno=#{rno}")
public void gReviewUpdate(GoodsReviewVO vo);
// 장바구니 이동
@Insert("INSERT INTO goods_cart(gcno,gno,userid,cart_price,cart_count) "
		+ " VALUES(gct_gcno_seq.nextval,#{gno},#{userid},#{cart_price},#{cart_count})")
public void cartInsert(CartVO vo);

@Results({
	@Result(property = "gvo.gno" ,column="gno"),
})

// 찜추가, 출력
@Update("UPDATE goodslist SET g_like=g_like+1 WHERE gno=#{gno}")
public void gLikeIncrese(int gno);
@Insert("INSERT INTO wishlist(wno,typeno,objno,state,id) VALUES(wishlist_seq.nextval,3,#{objno},#{state},#{id})")
public void wishInsert(WishListVO vo);
@Select("SELECT typeno,objno,state,id FROM wishlist WHERE objno=#{objno} AND id=#{id} AND typeno=3")
public WishListVO wishCk(WishListVO vo);
// 찜삭제
@Delete("DELETE FROM wishlist WHERE id=#{id} AND objno=#{objno}")
public void wishDelete(Map map);


//찜리스트 
@Results({
	@Result(property = "wvo.wno" ,column="wno"),
	@Result(property = "wvo.typeno" ,column="typeno"),
	@Result(property = "wvo.objno" ,column="objno"),
	@Result(property = "wvo.state" ,column="state"),
	@Result(property = "wvo.id" ,column="id")
})

@Select("SELECT wno,gno,id,g_price,g_img,g_name FROM wishlist wl JOIN goodslist gl ON "
		+ "wl.objno=gl.gno WHERE id=#{id} AND typeno=3")
public List<GoodsVO> goodsWishList(String id);


}







 
