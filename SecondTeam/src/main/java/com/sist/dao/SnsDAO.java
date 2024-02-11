package com.sist.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.SnsMapper;
import com.sist.vo.SnsKeepVO;

@Repository
public class SnsDAO {
	@Autowired
	private SnsMapper mapper;
	
	//�ӽú�ȣ�����Խñ� 5�� �������
	public List<SnsKeepVO> snsKeepList()
	{
		return mapper.snsKeepList();
	}
}
