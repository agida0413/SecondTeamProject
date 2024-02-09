package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.ProgramListMapper;
import com.sist.vo.OptionVO;
import com.sist.vo.ProgramVO;
import com.sist.vo.VprogramApplyVO;

@Repository
public class ProgramListDAO {

	@Autowired
	private ProgramListMapper mapper;
	//조회리스트
	public List<ProgramVO> programListData(Map map){
		return mapper.programListData(map);
	}
	//조회페이징
	public int programTotalPage(Map map) {
		return mapper.programTotalPage(map);
	}
	//상세보기
	public ProgramVO programDetailData(int vno) {
		return mapper.programDetailData(vno);
	}
	
	//신청
	public void programApplyInsert(VprogramApplyVO vo) {
		 mapper.programApplyInsert(vo);
	}
	//신청 중복카운트
	public int getApplyCount(VprogramApplyVO vo) {
		return mapper.getApplyCount(vo);
	}
	
	//신청리스트
	public List<VprogramApplyVO> applyList(String  centername){
		return mapper.applyList(centername);
	}
}
