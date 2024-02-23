package com.sist.dao;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.manager.WordManager;
import com.sist.mapper.ProgramRcAverageMapper;
import com.sist.vo.ProgramStatisticsVO;
import com.sist.vo.ProgramVO;
import com.sist.vo.VprogramApplyVO;
@Repository
public class ProgramRcAverageDAO {

	@Autowired
	private ProgramRcAverageMapper mapper;
	//회원별 추천
	
	@Autowired 
	private WordManager mgr;
	
	//시정보 
	public List<ProgramStatisticsVO> siList(){
		
		return mapper.siList();
		
	}
	
	public int siCount(ProgramStatisticsVO vo) {
		return mapper.siCount(vo);
	}
	
	
	public int monthCount(Map map) {
		return mapper.monthCount(map);
	}
	
		
		
	
	public int siCompleteCount(ProgramStatisticsVO vo) {
		return mapper.siCompleteCount(vo);
	}
	
	public int stateCount(String state) {
		return mapper.stateCount(state);
	}
		
	public int ageTypeCount(int start,int end) {
		return mapper.ageTypeCount(start, end);
	}
	
	


	public List<String> recTitleData(Map map){
		return mapper.recTitleData(map);
	}
	public List<ProgramVO> recCateData(Map map){
		return mapper.recCateData(map);
	}
	public List<ProgramVO>  recommandList(Map map){
		return mapper.recommandList(map);
	}
	//추천프로그램
	
	public List<String> recommandWordList(Map map){
	List<String> titleList=mapper.recTitleData(map);
	List<String> returnList=new ArrayList<String>();
	if(titleList.size()>0) {
		String titles="";
		for (String title : titleList) {
			titles+=title;
		}
		
		returnList = mgr.wordListData(titles);

	}
	


	return returnList; 
	}
	
}
