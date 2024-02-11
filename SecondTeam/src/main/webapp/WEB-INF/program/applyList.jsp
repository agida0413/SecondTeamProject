<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.applyLine{
border: 1px solid #cccccc; 
border-radius: 20px;
padding:20px;
}
</style>
	<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class=""><span style="font-weight:bold; font-size:30px; color:black;">봉사프로그램 신청승인</span></div>
  <hr>
<div class="conatainer" id="applyList">

<div style="margin-top:15px;margin-bottom:15px;">

<button class="btn btn-large" :class="type === '신청승인대기중' ? 'btn-danger' : 'btn-primary'" @click="waitList()" style="margin-right:10px;">승인대기중 목록</button>
<button class="btn btn-large" :class="type === '봉사활동 대기중' ? 'btn-danger' : 'btn-primary'" @click="completeList()" style="margin-right:10px;">승인완료 목록</button>
<button class="btn btn-large" :class="type === '봉사중' ? 'btn-danger' : 'btn-primary'" @click="runList()" style="margin-right:10px;">봉사중 목록</button>
<button class="btn btn-large" :class="type === '봉사완료' ? 'btn-danger' : 'btn-primary'" @click="doneList()" style="margin-right:10px;">봉사완료 목록</button>
<button class="btn btn-large" :class="type === '거절' ? 'btn-danger' : 'btn-primary'" @click="refuseList()" style="margin-right:10px;">거절 목록</button>
</div>

<div v-if="applyList.length==0">
<h3>조회 결과가 없습니다.</h3>
</div>
		<div class="row appList" v-for="vo in applyList">
  				
	  			<div class="col-10 applyLine" style="margin-bottom:20px;">
	  				<div class="programName">
							<span style="font-size:25px; font-weight:bold;  color:black;">{{vo.pvo.title}}</span>
						</div>
					<!-- 봉사프로그램정보 -->
					<div class="row" style=" color:black; margin-top:10px;">
					
				
					<div class="col-5"  >
						
						
						<div style="margin-top:7px;">
						<div>
						<span class="programSubinformAll"><span style="font-weight:bold;">[이름]</span><span class="programSubinform">{{vo.mvo.name}}</span></span>
						 <span class="programSubinformAll"><span style="font-weight:bold;">[생년월일]</span><span class="programSubinform">{{vo.mvo.dbBirthday}}</span></span> 
						 </div>
						 <div>
						  <span class="programSubinformAll"><span style="font-weight:bold;">[성별]</span><span class="programSubinform">{{vo.mvo.sex}}</span></span>
						<span class="programSubinformAll"><span style="font-weight:bold;">[전화번호]</span><span class="programSubinform"> {{vo.mvo.phone}}</span></span> 
						</div> 
						
						<div>
						<span class="programSubinformAll"><span style="font-weight:bold;">[신청일시]</span><span class="programSubinform">{{vo.vdbStateTime}}</span></span>
						</div>
						
							<div>
						<span class="programSubinformAll"><span style="font-weight:bold;">[봉사기간]</span><span class="programSubinform">{{vo.pvo.dbV_start}}&nbsp;~&nbsp;{{vo.pvo.dbV_end}}</span></span>
						</div>
					</div>
					
					</div>
					
					
					<div class="col-4" >
						
						
						<div style="margin-top:7px;">
						<div>
						<span class="programSubinformAll"><span style="font-weight:bold;">[이메일]</span><span class="programSubinform">{{vo.mvo.email}}</span></span>
						</div>
						<div>
						<span class="programSubinformAll"><span style="font-weight:bold;">[주소]</span><span class="programSubinform">{{vo.mvo.addr1}}&nbsp;{{vo.mvo.addr2}}</span></span>
						</div>
						<div>
						<span class="programSubinformAll"><span style="font-weight:bold;">[모집센터]</span><span class="programSubinform">{{vo.pvo.centername}}</span></span>
						</div>
						<div>
						<span class="programSubinformAll"><span style="font-weight:bold;">[모집상태]</span><span class="programSubinform">{{vo.pvo.collect_state}}</span></span>
						</div>
						
					</div>
				
										
				</div>
				
				<div class="col-3">
				<div style="margin-top:10px;">
					<input type="button" class="btn btn-large btn-success" value="첨부파일" @click="showFile(vo.vano)" :id="'fileBtn'+vo.vano" class="allCommon">
					</div>
					<div :id="'fileList'+vo.vano" style="display:none; " class="allCommon">
					<table style="border:none;">
								  <tr v-if="v_filecount!=0">
			         
			           <td colspan="3">
			             <ul style="list-style-type: none;   padding-left: 0; /* 왼쪽 패딩 없애기 */
			  			    margin-left: 0; /* 왼쪽 마진 없애기 */">
			               <li v-for="(fn,index) in v_filenames" style="list-style-type: none;   padding-left: 0; /* 왼쪽 패딩 없애기 */
			    			margin-left: 0; /* 왼쪽 마진 없애기 */">
			               	<img src="../Projectimages/file.png" width="20px" >
			                 <a :href="'../program/download.do?fn='+fn+'&type=apply'" style="margin-left:5px;"><span style="font-size:8px;">{{fn}}&nbsp;({{v_filesizes[index]}}Bytes)</span></a>
			               </li>
			             </ul>
			           </td>
			         </tr>
				</table>	
					</div>
				</div>
				
				</div>
				</div>
				
				
				<div class="col-2" v-if="type=='신청승인대기중'">
				
					<div style="margin-top:35px;">
					<input type="button" class="btn btn-large btn-primary" value="참여승인" @click="access(vo.vano)">
					</div>
					
					<div style="margin-top:10px;">
					<input type="button" class="btn btn-large btn-danger" value="거절하기"  @click="refuse(vo.vano)">
					</div>
				</div>				
				<hr>
  		   </div>
  		   
  		   
  		   <div class="row">
  		   	 <ul class="pagination" v-if="totalpage!=0">
  			 		
				  <li @click="prev()" class="page-item"><a v-if="start>1" class="link page-link">&lt;</a></li>
				  <li v-for="i in range(startpage,endpage)" @click="move(i)"  class="page-item" 
				  :class="{ 'active': curpage === i }" 
   				 :aria-current="curpage === i ? 'page' : null">
				  <a class="link page-link">{{i}}</a>
				  </li>
				 
				  <li @click="next()" class="page-item"><a v-if="end<totalpage" class="link page-link">&gt;</a></li>
				   
				   
				   
				</ul> 
  		   </div>
</div>
<script>
let applyList=Vue.createApp({
	data(){
		return{
			applyList:[],
			curpage:1,
			totalpage:0,
			startpage:0,
			endpage:0,
			type:'신청승인대기중',
			v_filenames:[],
			v_filesizes:[],
			v_filecount:0
		
		}
	},
	mounted(){
		this.getList()
	},
	methods:{
		getList(){
			axios.get('../program/applyList_vue.do',{
				params:{
					page:this.curpage,
					type:this.type
				}
			})
			.then(res=>{
				this.applyList=res.data
				console.log(this.applyList)
				this.getPaging()
			})
		},
		showFile(vano){
			
			axios.get('../program/applyListFiles_vue.do',{
       			params:{
       				vano:vano
       			}
       		}).then(response=>{
       			console.log(response.data)
       			let leng=response.data.v_filecount;
       			if(leng>0)
       			{	
       				this.v_filenames=response.data.v_filename.split(",")
       			    this.v_filesizes=response.data.v_filesize.split(",")
       			}
       			
       			this.v_filecount=leng;
       			
       		})
			
			
			  let fileBtn = document.querySelector('#fileBtn'+vano);
		        let fileList = document.querySelector('#fileList'+vano);
		        let fileBtns = document.querySelectorAll('[id^="fileBtn"]');
		        let fileLists= document.querySelectorAll('[id^="fileList"]');
		        fileBtns.forEach(btn => {
		        	 if (btn !== fileBtn) {
		        	        // fileBtn이 아닌 경우에만 실행될 코드를 작성합니다.
		        	        btn.style.display='block';
		        	    }
		        });
		        
		        
		        fileLists.forEach(list => {
		        	 if (list !== fileList) {
		        	        // fileBtn이 아닌 경우에만 실행될 코드를 작성합니다.
		        	       list.style.display='none'
		        	    }
		        });
		        if (fileBtn && fileList) {
		        	
		            fileBtn.style.display = 'none';
		            fileList.style.display = 'block';
		        }
		     
		},
		getPaging(){
			axios.get('../program/applyListPage_vue.do',{
				params:{
					page:this.curpage,
					type:this.type
				}
			})
			.then(res=>{
			this.startpage=res.data.startpage;
			this.endpage=res.data.endpage;
			this.totalpage=res.data.totalpage;
			this.curpage=res.data.curpage;
			
			})
			
		},
		range(start,end){
			let arr=[]
			console.log(start)
			console.log(end)
			let size=end-start;
			for(let i=0;i<=size;i++){
				arr[i]=start;
				start++;
			}
			return arr;
		},
		next(){
			
			this.curpage=this.end+1
			this.getList()
			
			this.resetFile();
		},
		prev(){
			this.curpage=this.start-1
			this.getList()
			this.resetFile();
		},
		move(page){
			this.curpage=page
			this.getList()
			this.resetFile();
		},
		
		resetFile(){
			 
		        let fileBtns = document.querySelectorAll('[id^="fileBtn"]');
		        let fileLists= document.querySelectorAll('[id^="fileList"]');
		        fileBtns.forEach(btn => {
		        	 
		        	        btn.style.display='block';
		        	   
		        });
		        
		        
		        fileLists.forEach(list => {
		        	
		        	        
		        	       list.style.display='none'
		        	  
		        });
		       
		},
		access(vano){
			axios.get('../program/applyAccess_vue.do',
					{
							params:{
								vano:vano	
							}
						}
			).then(res=>{
				if(res.data==='YES'){
					alert('승인되었습니다.')
					this.getList()
				}
				else{
					alert('정원이 초과하였습니다.')
				}
				
			})
		},
		refuse(vano){
			axios.get('../program/applyRefuse_vue.do',
					{
							params:{
								vano:vano	
							}
						}
			).then(res=>{
				alert('거절되었습니다.')
				this.getList()
			})
		},
		waitList(){
			this.type='신청승인대기중'
			this.getList()
		},
		completeList(){
			this.type='봉사활동 대기중'
				this.getList()

		},
		runList(){
			this.type='봉사중'
				this.getList()
		},
		doneList(){
			this.type='봉사완료'
				this.getList()
		},
		refuseList(){
			this.type='거절'
				this.getList()
		}
	}
}).mount('#applyList')
</script>
</body>
</html>