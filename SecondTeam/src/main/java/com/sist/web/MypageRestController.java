package com.sist.web;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.CartService;
import com.sist.service.GoodsService;
import com.sist.service.MypageService;
import com.sist.vo.CartVO;
import com.sist.vo.DonClassResHistoryVO;
import com.sist.vo.DonResVO;
import com.sist.vo.GoodsVO;
import com.sist.vo.VdataboardVO;
import com.sist.vo.VprogramApplyVO;

@RestController
public class MypageRestController {

	@Autowired
	private MypageService service;
	
	@Autowired
	private GoodsService gService;
	
	@Autowired
	private CartService cService;
	
	@PostMapping(value="myAndAdpage/certifyUpdate_vue.do",produces = "text/plain;charset=UTF-8")
	   public String certifyUpdate_vue(VprogramApplyVO vo,HttpServletRequest request)
	   {
		 
		
		   String result="";
		   try
		   {
//			   String path=request.getSession().getServletContext().getRealPath("/")+"applyCertifyUpload\\";
//			   path=path.replace("\\", File.separator);// 운영체제의 호환 
			   
			   String path = request.getSession().getServletContext().getRealPath("/applyCertidy/");
			   // Hosting => AWS(리눅스)
			   File dir=new File(path);
			   if(!dir.exists())
			   {
				   dir.mkdir();
			   }
			
			   List<MultipartFile> list=vo.getAccesssImgs();//임시 저장
		
			   
			   if(list==null) // 업로드가 없는 상태
			   {
				   vo.setV_ok_filename("");
				   vo.setV_ok_filesize("");
				   vo.setV_ok_filecount(0);
			   }
			   else //업로드가 있는 상태 
			   {
				   String filename="";
				   String filesize="";
				   for(MultipartFile mf:list)
				   {
					   String originalFilename = mf.getOriginalFilename();
					   String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
					   String newFilename = UUID.randomUUID().toString() + extension; // 새로운 파일 이름 생성

					   // 파일 저장
					   File newFile = new File(path + newFilename);
					   mf.transferTo(newFile); // 업로드된 파일을 새로운 이름으로 저장
					   
					   filename+=newFilename+",";// a.jpg,b.jpg,
					   filesize+=newFile.length()+",";
				   }
				   filename=filename.substring(0,filename.lastIndexOf(","));
				   filesize=filesize.substring(0,filesize.lastIndexOf(","));
				   vo.setV_ok_filename(filename);
				   vo.setV_ok_filesize(filesize);
				   vo.setV_ok_filecount(list.size());
				   vo.setState("봉사인증 승인대기중");
				   
				   service.updateCertifyUpload(vo);
			   }
			   
			   result="yes";
		   }catch(Exception ex)
		   {
			   result=ex.getMessage();   
		   }
		   return result;
	   }
	
	//예약취소
	@GetMapping(value="myAndAdpage/cancleReserve.do",produces = "text/plain;charset=UTF-8")
	public void cancleReserve(DonClassResHistoryVO vo,String hostname) throws Exception
	{		
		service.reserveCancel(vo, hostname);
		
		
	}
	
	
	@GetMapping(value="myAndAdpage/wishgoodslist_vue.do",produces = "text/plain;charset=UTF-8")
	public String wishgoodslist_vue(HttpSession session,String id) throws Exception
	{
		id=(String)session.getAttribute("id");
		List<GoodsVO> list=gService.goodsWishList(id);
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		
		return json;
	}
	@GetMapping(value="myAndAdpage/buylist_vue.do",produces = "text/plain;charset=UTF-8")
	public String buylist_vue(HttpSession session) throws Exception
	{
		String userid=(String)session.getAttribute("id");
		List<CartVO> cList=cService.buyList(userid);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(cList);
		
		return json;
		
	}
	@GetMapping(value="myAndAdpage/buyCancel_vue.do",produces = "text/plain;charset=UTF-8")
	public String buycancel_vue(HttpSession session,CartVO vo) throws Exception
	{
		String userid=(String)session.getAttribute("id");
		cService.buyCancle(vo);
		List<CartVO> cList=cService.buyList(userid);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(cList);
		
		return json;
	}
	
	@GetMapping(value="myAndAdpage/donres_vue.do",produces = "text/plain;charset=UTF-8")
	public String donres_vue(HttpSession session) throws Exception
	{
		String userid=(String)session.getAttribute("id");
		System.out.println(userid);
		List<DonResVO> dList=service.donResList(userid);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(dList);
		
		return json;
	}
	@GetMapping(value="myAndAdpage/donres_cancel_vue.do",produces = "text/plain;charset=UTF-8")
	public void donres_cancel (int dresno) throws Exception
	{
		service.donresCancel(dresno);
	}
	
	
}
