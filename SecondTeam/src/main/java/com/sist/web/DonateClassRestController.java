package com.sist.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mongodb.DBPortPool.SemaphoresOut;
import com.sist.commons.CommonsFunction;
import com.sist.service.DonateClassService;
import com.sist.vo.DonClassReviewVO;

@RestController
public class DonateClassRestController {

	@Autowired
	private DonateClassService service;
	
	@Autowired
	private CommonsFunction cf;
	@GetMapping(value="donateclass/wishlistUpdate_vue.do",produces = "text/plain;charset=UTF-8")
	   public String updateZzim(int dcno,String zzimstate,HttpSession sesion) {
		   String id=(String)sesion.getAttribute("id");
		   Map map =new HashMap();
		   map.put("id", id);
		   map.put("dcno", dcno);
		   if(zzimstate.equals("NO")) {
			   map.put("state","YES");   
		   }
		   
		   if(zzimstate.equals("YES")) {
			   map.put("state","NO");   
		   }
		   
		   String send=service.updateWishList(map);
		   
		   return send;
		   
	   }
	
	@PostMapping(value="donateclass/insert_dcReview_vue.do",produces = "text/plain;charset=UTF-8")
	public String insertReview(DonClassReviewVO vo,HttpSession session,HttpServletRequest request) throws IllegalStateException, IOException {
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		
		String result="";
		if(id!=null) {
			vo.setId(id);
			vo.setName(name);
			if(vo.getRmf()!=null) {
				String path = request.getSession().getServletContext().getRealPath("/reviewImg/");
				 File dir=new File(path);
				   if(!dir.exists())
				   {
					   dir.mkdir();
				   }
				   
				   MultipartFile mf=vo.getRmf();
				   String originalFilename = mf.getOriginalFilename();
				   String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
				   String newFilename = UUID.randomUUID().toString() + extension; // 새로운 파일 이름 생성
				   
				   File newFile = new File(path + newFilename);
				   mf.transferTo(newFile); // 업로드된 파일을 새로운 이름으로 저장
				   vo.setFilename(newFilename);
			}
				
			   
			   service.insertReview(vo);
			   result="YES";
		}
		else {
			result="NO";
		}
		
		
		return result;
	}
	
	
	
	@GetMapping(value="donateclass/reviewList_vue.do",produces = "text/plain;charset=UTF-8")
	public String reviewList(int dcno,String type,int page) throws JsonProcessingException {
		String index="";
		String message="";
		if(type.equals("A")) {
			index="regdateDesc";//최신순인덱스
		}
		if(type.equals("B")) {
			index="regdateAsc";//오래된순 인덱스
		}
		if(type.equals("C")) {
			index="regdateDesc";//최신순인덱스
			message="ORDER BY score DESC";//높은평점순 인덱스
				}
		if(type.equals("D")) {
			index="regdateDesc";//최신순인덱스
			message="ORDER BY score ASC";//낮은평점숨 인덱스
		}
		int rowsize=5;
		int start=cf.start(rowsize, page);
		int end=cf.end(rowsize, page);
		System.out.println(index);
		Map map=new HashMap();
		map.put("dcno", dcno);
		map.put("index", index);
		map.put("start", start);
		map.put("end", end);
		map.put("typeno", 1);
		map.put("msg", message);
		
		List<DonClassReviewVO> list = service.reviewList(map);
		ObjectMapper mapper = new ObjectMapper();
		String json= mapper.writeValueAsString(list);
		
		return json;
	}
	
	
	
	@GetMapping(value="donateclass/reviewList_vue_page.do",produces = "text/plain;charset=UTF-8")
	public String reviewpage(int dcno,int page) throws JsonProcessingException {
	
		
		DonClassReviewVO vo = new DonClassReviewVO();
		vo.setObjno(dcno);
		int reviewAmount= service.reviewNum(vo);
		
		Map map=new HashMap();
		map.put("dcno", dcno);
		map.put("typeno", 1);
		
		int totalpage=service.reviewTotalpage(map);
		
		final int BLOCK=10;
		int startpage=cf.startPage(BLOCK, page);
		int endpage=cf.endPage(BLOCK, page, totalpage);
		
		Map sendMap= new HashMap();
		sendMap.put("startpage", startpage);
		sendMap.put("endpage", endpage);
		sendMap.put("page", page);
		sendMap.put("totalpage", totalpage);
		sendMap.put("rNum", reviewAmount);
		ObjectMapper mapper = new ObjectMapper();
		String json= mapper.writeValueAsString(sendMap);
		
		return json;
	}
	
	
	@GetMapping(value="donateclass/deleteReview_vue.do",produces = "text/plain;charset=UTF-8")
	public void deleteReview(DonClassReviewVO vo,HttpServletRequest request) throws JsonProcessingException {
		String filename= service.getFilename(vo);
		service.deleteReview(vo);
			
		String path = request.getSession().getServletContext().getRealPath("/reviewImg/");
	
		System.out.println(filename);
		
		File file= new File(path+filename);
		
		if(file.exists()) {
			file.delete();
		}
				
	
	}
	
	
	
}
