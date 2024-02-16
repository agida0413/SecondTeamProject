package com.sist.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

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
	public List<VprogramApplyVO> applyList(Map map){
		return mapper.applyList(map);
	}
	//신청리스트 토탈페이지
	public int applyListTotalPage(Map map) {
		return mapper.applyListTotalPage(map);
	}
	
	
	
	//인증센터 승인
	
	public VprogramApplyVO centerCertifyAccess(int vano) {
		return mapper.centerCertifyAccess(vano);
	}
	
	//신청 승인
	
	
	 @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
	public String  updateAccess(int vano) {
		String up="봉사활동 대기중";
		String result="";
		int vno=mapper.getVno(vano);
		ProgramVO vo=mapper.getCollectnumApplynum(vno);
		
		
		
		if (vo.getCollect_num()==vo.getApply_num()) {
			
			result="NO";
		}
		else {
				//신청인원===정원-1
			
			
			Map map=new HashMap();
			map.put("up", up);
			map.put("vano", vano);
			mapper.updateAcess(map);
			
				if(vo.getCollect_num()-1==vo.getApply_num()) {
					map.put("st", "모집완료");
					map.put("vno", vno);
					mapper.updateCollectState(map);
				}
			
			mapper.updateApplyNum(vno);
			result="YES";
		}
		
		return result;
		
		
	}
	//신청거절
	public void updateRefuse(int vano) {
		String up="거절";
		Map map=new HashMap();
		map.put("up", up);
		map.put("vano", vano);
		mapper.updateRefuse(map);
	}
	
	
	
	//프로그램 승인완료 후 업데이트
	
	
	 @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
	public void updateInformAfCertify(int vano) {
		VprogramApplyVO vo=mapper.getCertifyIdVno(vano);
		
		String id=vo.getId();
		int vno=vo.getVno();
		
		int wing=mapper.getCertifyWing(vno);
		
		Map map=new HashMap();
		map.put("wing", wing);
		map.put("id", id);
		map.put("state", "보상지급완료");
		map.put("vano", vano);
		
		mapper.updateProgramAfterState(map);
		
		mapper.updateProgramAfterWing(map);
		
		
	}
	
	//신청 리스트 파일
	public VprogramApplyVO getApplyFiles(int vano) {
		return mapper.getApplyFiles(vano);
	}
	//신청내역 스케쥴러를 통한 봉사중으로 상태업데이트를 위해 vno리스트넘기기
	public List<Integer> updateRunStVnoList(){
		return mapper.updateRunStVnoList();
	}
	//신청내역 스케쥴러를 통한 봉사완료로 상태업데이트를 위해 vno리스트넘기기
	public List<Integer> updateEndStVnoList(){
		return mapper.updateEndStVnoList();
	}
	//스케쥴러 상태업데이트
	public void updateRunSt(Map map) {
	 mapper.updateRunSt(map);	
	}
	//스케쥴러 상태업데이트
	public void updateEndSt(Map map) {
		mapper.updateEndSt(map);
	}
	
	
	
	//마이페이지 관련
	
	//봉사프로그램 신청내역
		public List<VprogramApplyVO> applyHistoryList(Map map){
			return mapper.applyHistoryList(map);
		}
		
		public int applyHistotyTotalPage(Map map) {
			return mapper.applyHistotyTotalPage(map);
		}
		
		public VprogramApplyVO certifyDetail(Map map) {
			return mapper.certifyDetail(map);
		}
		
		public void updateCertifyUpload(VprogramApplyVO vo) {
			mapper.updateCertifyUpload(vo);
		}
		
		//센터 프로그램 정보
		public List<ProgramVO> centerProgramList(Map map){
			return mapper.centerProgramList(map);
		}
		
		public int centerProgramTotalPage(String centername) {
			return mapper.centerProgramTotalPage(centername);
		}

		//센터프로그램 등록
		public void insertCenterProgram(ProgramVO vo) {
			 mapper.insertCenterProgram(vo);
		}
}
