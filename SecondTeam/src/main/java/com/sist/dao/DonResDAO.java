package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.DonResMapper;
import com.sist.vo.DonResVO;

@Repository
public class DonResDAO {
@Autowired
private DonResMapper mapper;

public void donresInsert(DonResVO vo) {
	mapper.donresInsert(vo);
}
}
