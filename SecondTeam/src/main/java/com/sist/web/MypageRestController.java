package com.sist.web;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.sist.service.MypageService;
import com.sist.vo.VdataboardVO;
import com.sist.vo.VprogramApplyVO;

@RestController
public class MypageRestController {

	@Autowired
	private MypageService service;
	
	
	
	@PostMapping(value="myAndAdpage/certifyUpdate_vue.do",produces = "text/plain;charset=UTF-8")
	   public String databoard_insert(VprogramApplyVO vo,HttpServletRequest request)
	   {
		 
		
		   String result="";
		   try
		   {
			   String path=request.getSession().getServletContext().getRealPath("/")+"applyCertifyUpload\\";
			   path=path.replace("\\", File.separator);// 운영체제의 호환 
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
					   String name=mf.getOriginalFilename();
					   File file=new File(path+name);
					   mf.transferTo(file);//  업로드
					   
					   filename+=name+",";// a.jpg,b.jpg,
					   filesize+=file.length()+",";
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
}
