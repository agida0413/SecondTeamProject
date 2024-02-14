package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.DonClassVO;

public interface ClassInformMapper {

	
	//재능기부 클래스 리스트 관련
	
	@Select("SELECT dcno,name,id,cls_level,time,full_num,image,address,category,wing,score,num "
			+"FROM (SELECT dcno,name,id,cls_level,time,full_num,image,address,category,wing,score,ROWNUM as num "
			+"FROM (SELECT dcno,name,id,cls_level,time,full_num,image,address,category,wing,score "
			+"FROM donate_class "
			+"WHERE name LIKE'%'||#{ss}||'%' AND "
			+"category LIKE'%'||#{category}||'%'))"
			+"WHERE num BETWEEN #{start} and #{end}")
	public List<DonClassVO> donateClassList(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/5.0) FROM donate_class "
			+"WHERE name LIKE'%'||#{ss}||'%' AND "
			+"category LIKE'%'||#{category}||'%'")
	public int donateClassTotalPage(Map map);
	
	@Select("SELECT COUNT(*) FROM donate_class "
			+"WHERE category LIKE'%'||#{category}||'%'")
	public int donateClassCategoryCount(String category);
}
