package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.AdminMapper;
import com.sist.vo.MemberVO;

@Repository
public class AdminDAO {
@Autowired
   private AdminMapper mapper;


public List<MemberVO> memberList(Map map){
   return mapper.memberList(map);
}

public int totalpage(Map  map) {
   return mapper.totalpage(map);
}
}