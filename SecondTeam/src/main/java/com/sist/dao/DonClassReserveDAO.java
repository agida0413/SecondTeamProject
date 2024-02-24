package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.DonClassReserveMapper;
import com.sist.vo.DonClassResHistoryVO;
import com.sist.vo.DonClassReserveVO;
import com.sist.vo.DonClassVO;

import lombok.Data;

@Repository
public class DonClassReserveDAO {
@Autowired
private DonClassReserveMapper mapper;

public List<Integer> monthInwonList(Map map){
	return mapper.monthInwonList(map);
}

public List<DonClassReserveVO> reserveInform(Map map){
	return mapper.reserveInform(map);
}

public void insertReserveInform(DonClassResHistoryVO vo) {
	 mapper.insertReserveInform(vo);
}

public void resCanNumMinus(int rnum,int rno) {
	mapper.resCanNumMinus(rnum, rno);
}
public void resCanNumPlus(int rnum,int rno) {
	mapper.resCanNumPlus(rnum, rno);
}

public void UpdateUserMinusWing(int wing,String userid) {
	mapper.UpdateUserMinusWing(wing, userid);
}

public void UpdateUserPlusWing(int wing,String userid) {
	mapper.UpdateUserPlusWing(wing, userid);
}
public int userWing(String userid) {
	return mapper.userWing(userid);
}


//마이페이지

public List<DonClassVO> donClassReserveHistoryList(Map map){
	return mapper.donClassReserveHistoryList(map);
}

public int donClassReserveHistoryTotalPage(String userid) {
	return mapper.donClassReserveHistoryTotalPage(userid);
}

public void updateResState(DonClassResHistoryVO vo) {
	 mapper.updateResState(vo);
}
}
