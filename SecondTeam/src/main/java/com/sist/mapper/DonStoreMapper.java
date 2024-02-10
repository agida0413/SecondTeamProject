package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;

import com.sist.vo.DonStoreVO;

public interface DonStoreMapper {
@Select("SELECT dno,name,phone,address,num "
		+ "FROM(SELECT dno,name,phone,address,ROWNUM AS num "
		+ "FROM(SELECT dno,name,phone,address "
		+ "FROM donationstoreInfo WHERE name LIKE '%'||#{ss}||'%' ORDER BY dno ASC)) "
		+ "WHERE num BETWEEN #{start} AND #{end}")
public List<DonStoreVO> dnoStoreSearch(Map map);
@Select("SELECT CEIL(COUNT(*)/5.0) FROM donationstoreInfo WHERE name LIKE '%'||#{ss}||'%'")
public int donTotalpage(Map map);
@Select("SELECT dno,name,phone,address "
		+ "FROM donationstoreInfo WHERE dno=#{dno}")
public DonStoreVO donDetailData(int dno);

}
