package com.sist.vo;

import org.apache.ibatis.annotations.Select;

import lombok.Data;
import java.util.*;

@Data
public class GoodsVO {
	private int gno,hit,buy_count,g_like,g_hit,intprice;
	private String g_name,g_price,g_img,category,dbday,category_minor,type_names,type_img,g_subimg;
	private Date g_regdate;
	private WishListVO wvo=new WishListVO();
}
