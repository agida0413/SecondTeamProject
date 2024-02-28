package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.AdminMapper;
import com.sist.vo.CartVO;
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
public List<CartVO> buyList(Map map){
	return mapper.buyList(map);
}
public int buyTotalpage() {
	return mapper.buyTotalpage();
}
public void buyOk(int gcno) {
	mapper.buyOk(gcno);
}

public void deleteMem(int mno) {
	mapper.deleteMem(mno);
}

public void grantMem(int mno) {
 	mapper.grantMem(mno);
}
public void revokeMem(int mno) {
	mapper.revokeMem(mno);
}
public void deleteMemWing(int mno) {
	mapper.deleteMemWing(mno);
}
}