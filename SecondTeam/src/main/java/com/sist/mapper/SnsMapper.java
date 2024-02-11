package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.SnsKeepVO;

public interface SnsMapper {
	
	//�ӽú�ȣ�����Խñ� 5�� �������
	@Select("SELECT kano, keeploc, keeptitle, keepregdate, keepimage, keepwriter, num "
			+ "FROM (SELECT kano, keeploc, keeptitle, keepregdate, keepimage, keepwriter, rownum AS num "
			+ "FROM (SELECT kano, keeploc, keeptitle, keepregdate, keepimage, keepwriter "
			+ "FROM SNS_KEEP  ORDER BY dbms_random.value )) "
			+ "WHERE num BETWEEN 5 AND 9")
	public List<SnsKeepVO> snsKeepList();
}
