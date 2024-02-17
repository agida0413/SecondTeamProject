package com.sist.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.sist.service.DonateClassService;
import com.sist.vo.DonClassReviewVO;

@RestController
public class DonateClassRestController {

	@Autowired
	private DonateClassService service;
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
			}
				
			   
			   service.insertReview(vo);
			   result="YES";
		}
		else {
			result="NO";
		}
		
		
		return result;
	}
}
