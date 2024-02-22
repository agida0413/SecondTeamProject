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
		List<ProgramStatisticsVO> list=mapper.siList();
		List<ProgramStatisticsVO> returnList=new ArrayList<ProgramStatisticsVO>();
		
		for (ProgramStatisticsVO vo : list) {
			ProgramStatisticsVO returnVo=new ProgramStatisticsVO();
			
			int count=mapper.siCount(vo);
			
			
			
			returnVo.setSi(vo.getSi());
			returnVo.setCount(count);
			
			
			returnList.add(returnVo);
			
		}
		
		
		return returnList;
		
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
	
	
//	public List<VprogramApplyVO> recTitleData(Map map) {
//	    List<VprogramApplyVO> returnList = new ArrayList<VprogramApplyVO>();
//	    String tempId = (String) map.get("id");
//	    
//	    if (tempId != null) {
//	       String titles="";
//	       	System.out.println(map.get("id"));
//	    	List<String> list = mapper.recTitleData(map);
//	   
//	       
//	        
//	       
//	        if (list.size() > 0) {
//	        	
//	            for (String title : list) {
//	    			titles+=title;
//	    		}
//	        	 List<String>wordList=mgr.wordListData(titles);
//	       
//	            Set<String> titleSet = new HashSet<>(); // 중복을 제거할 Set
//	            for (String title : list) {
//	    			titleSet.add(title);
//	    		}
//	            int i = 0;
//	            for (String title : wordList) {
//	            	
//	            System.out.println("추천어"+title);
//	                
//	                    
//	                
//	            }
//	        }
//	    }
//	    return returnList;
//	}

	
	//추천프로그램
	public List<ProgramVO> recommandList(Map map){
		List<String>recList=mapper.recTitleData(map);
		  Set<String> titleSet = new HashSet<>(); // 중복을 제거할 Set
		  for (String str : titleSet) {
			titleSet.add(str);
		}
		List<ProgramVO> list = mapper.recCateData(map);
		List<ProgramVO> returnlist =new ArrayList<ProgramVO>();
		int i=0;
		for (ProgramVO vo : list) {
			if(i==8) {
				break;
			}
			
			map.put("mjf", vo.getMajor_field());
			
		
			ProgramVO vo2=mapper.recommandList(map);
			
			if(!titleSet.contains(vo2.getTitle())) {
				returnlist.add(vo2);
				i++;
			}
			
		}
		return  returnlist;
	}
	
	public List<String> recommandWordList(Map map){
	List<String> titleList=mapper.recTitleData(map);
	String titles="";
	for (String title : titleList) {
		titles+=title;
	}
	
	List<String> returnList = mgr.wordListData(titles);
	
	return returnList; 
	}
	
}
