package com.sist.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.SnsService;
import com.sist.vo.SnsIdVO;
import com.sist.vo.SnsKeepVO;
import com.sist.vo.SnsMyContentVO;

@RestController
@RequestMapping("sns/")
public class SnsRestController {
	
	@Autowired
	private SnsService service;
	
	//임시보호동물 게시글 랜덤 5개 출력
	@GetMapping(value = "list_keep_vue.do", produces =  "text/plain;charset=UTF-8")
	public String list_keep_vue() throws Exception
	{
		List<SnsKeepVO> list=service.snsKeepList();
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	
	//sns페이지 본인+팔로우 게시글 출력
	//public List<SnsMyContentVO> snsMyContentList(String id)
	@GetMapping(value = "list_mycontent_vue.do", produces = "text/plain;charset=UTF-8")
	public String list_mycontnet_vue(String id) throws Exception
	{
		List<SnsMyContentVO> list=service.snsMyContentList(id);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	
	//sns id 목록중 4명 랜덤출력
	@GetMapping(value = "list_id_vue.do", produces = "text/plain;charset=UTF-8")
	public String list_id_vue() throws Exception
	{
		List<SnsIdVO> list=service.snsIdList();
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	
	///////////////////////게시판 crud
	//insert
	@PostMapping(value="insert_vue.do", produces = "text/plain;charset=UTF-8")
	public String sns_insert_vue(SnsMyContentVO vo, HttpServletRequest request)
	{
		 System.out.println("접근 완료!!");
	       String result = "";
	       try {
	           String path = request.getSession().getServletContext().getRealPath("/") + "upload/";
	           path = path.replace("\\", File.separator);
	           File dir = new File(path);
	           if (!dir.exists()) {
	               dir.mkdir();
	           }

	           List<MultipartFile> list = vo.getFiles();
	           if (list == null) {
	               vo.setFilename("");
	               vo.setFilesize("");
	               vo.setFilecount(0);
	           } else {
	               String filename = "";
	               String filesize = "";
	               for (MultipartFile mf : list) {
	                   String name = mf.getOriginalFilename();
	                   File file = new File(path + name);
	                   mf.transferTo(file);

	                   filename += name + ",";
	                   filesize += file.length() + ",";
	               }
	               filename = filename.substring(0, filename.lastIndexOf(","));
	               filesize = filesize.substring(0, filesize.lastIndexOf(","));
	               vo.setFilename(filename);
	               vo.setFilesize(filesize);
	               vo.setFilecount(list.size());
	           }
	           service.snsPageInsert(vo);
	           result = "yes";
	       } catch (Exception ex) {
	           result = ex.getMessage();
	       }
	       return result;
	}
	
	@GetMapping(value = "download.do")
	public void sns_download(String fn, HttpServletRequest request, HttpServletResponse response)
	{
		String path=request.getSession().getServletContext().getRealPath("/")+"upload\\";
		path=path.replace("\\", File.separator);
		try {
			File file=new File(path+fn);
			response.setHeader("Content-Disposition", "attachement;filename="+URLEncoder.encode(fn,"UTF-8"));
			response.setContentLength((int)file.length());
			//=>다운로드 창을 보여준다
			BufferedInputStream bis=new BufferedInputStream(new FileInputStream(file));
			//서버에서 파일을 읽어온다
			BufferedOutputStream bos=new BufferedOutputStream(response.getOutputStream());
			//여기서부터는 클라이언트 복사 영역(다운로드 폴더)
			int i=0;
			byte[] buffer=new byte[1024];
			while((i=bis.read(buffer,0,1024))!=-1)
			{
				//i는 읽은 바이트 수
				bos.write(buffer,0,i);
			}
			bis.close();
			bos.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
}
