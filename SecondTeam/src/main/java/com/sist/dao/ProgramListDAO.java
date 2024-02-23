package com.sist.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
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
	
			//VNO값 가져오기
		
			public int getVno(int vano) {
				return mapper.getVno(vano);
			}
			
			//신청인원이 정원보다 많을시 처리
		
			public ProgramVO getCollectnumApplynum(int vno) {
				return mapper.getCollectnumApplynum(vno);
			}
			
			//신청 승인
			
			public void updateAcess(Map map) {
				mapper.updateAcess(map);
			}
			
			public void updateCollectState(Map map) {
				mapper.updateCollectState(map);
			}
			
			
			//신청승인 후 해당프로그램 신청인원증가 
		
			public void updateApplyNum(int vno) {
				mapper.updateApplyNum(vno);
			}
	
	
			//신청거절
			public void updateRefuse(Map map) {
				
				mapper.updateRefuse(map);
			}
	
	
	
	//프로그램 승인완료 후 업데이트
	
			//아이디,vno얻기
			public VprogramApplyVO getCertifyIdVno(int vano) {
				return mapper.getCertifyIdVno(vano);
			}
			
			//해당프로그램 wing 개수 얻기
			
			
			public int getCertifyWing(int vno) {
				return mapper.getCertifyWing(vno);
			}
			
			//유저 wing 갯수 업데이트
			
			public void updateProgramAfterWing(Map map) {
				mapper.updateProgramAfterWing(map);
			}
			
			//신청내역 보상지급완료로 업데이트
			
			public void updateProgramAfterState(Map map) {
				mapper.updateProgramAfterState(map);
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
