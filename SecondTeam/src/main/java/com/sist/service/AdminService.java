package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.CartVO;
import com.sist.vo.MemberVO;

public interface AdminService {
	public List<MemberVO> memberList(Map map);
	public int totalpage(Map  map);
	public List<CartVO> buyList(Map map);
	public int buyTotalpage();
	public void buyOk(int gcno);
	
	public void memberControl(int mno,String type);
}
