package com.sist.mapper;

import org.apache.ibatis.annotations.Select;
import java.util.*;
import com.sist.vo.MoimListVO;

public interface MoimListMapper {
	@Select("SELECT rno,img,loc,type,time,content,rownum "
			+"FROM moim_list "
			+"WHERE rno=12 OR rno=13 OR rno=17")
	public List<MoimListVO> moimMainData();
}
