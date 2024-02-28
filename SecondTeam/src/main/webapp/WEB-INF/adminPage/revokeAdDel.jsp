<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://unpkg.com/vue@3"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container" id="adminApp">
	<div class="row">
	<div class="sidebar-box search-form-wrap mb-4" id="searchDc">
			<div style="position: relative; width:400px;">
					<input type="text" class="form-control" placeholder="${ss==''||ss==null?'아이디 검색':ss }" v-model="ss"
					@keyup.enter="callList()"	
						style="background-color: black;"> <span class="bi bi-search" style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%);" @click="callList()"></span>
							</div>
							</div>
						
		<table class="table">
			<tr class="text-center" style="background-color:#f2f2f2;">
				
				<th width="10%" >아이디</th>
				<th width="15%">이름</th>
				<th width="15%">생일</th>
				<th width="10%">권한</th>
				<th width="10%">보유윙</th>
				<th width="20%">전화번호</th>
				<th width="20%">관리자 처리</th>
			</tr>
			
			
			<tr v-for="vo in memberList" style="vertical-align:middle;" >
			
				<td class="text-center" style="font-weight:bold;">{{vo.userId}}</td>
				<td class="text-center">{{vo.userName}}</td>
				<td class="text-center">{{vo.dbBirthday}}</td>
					<td class="text-center" width="10%">
					<span v-if="vo.admin===1">관리자</span>
					<span v-if="vo.admin!==1">일반</span>
					</td>
				<td class="text-center">{{vo.wing}}</td>
				<td class="text-center">{{vo.phone}}</td>
				<td >
				<div style="margin-bottom:5px;">
				<span style="margin-right:5px;"><button class="btn btn-small btn-primary" @click="grantMem(vo.mno,1)">권한부여</button></span>
				<span ><button class="btn btn-small btn-info" @click="revokeMem(vo.mno,3)">권환회수</button></span>
				
				</div>
				<div >
				
				<span ><button class="btn btn-small btn-danger" @click="revokeMemWing(vo.mno,4)">윙 몰수</button></span>
				
				</div>
				</td>
			</tr>
		
		</table>
		<div class="row text-center">
  			 <ul class="pagination" v-if="totalpage!=0">
  			 		
				  <li @click="prev()" class="page-item"><a v-if="startpage>1" class="link page-link">&lt;</a></li>
				  <li v-for="i in range(startpage,endpage)" @click="move(i)"  class="page-item" 
				  :class="{ 'active': curpage === i }" 
   				 :aria-current="curpage === i ? 'page' : null">
				  <a class="link page-link">{{i}}</a>
				  </li>
				 
				  <li @click="next()" class="page-item"><a v-if="endpage<totalpage" class="link page-link">&gt;</a></li>
				 
				   
				   
				</ul> 
  			</div>
	</div>

</div>

<script>
let adminApp = Vue.createApp({
		data(){
			return{
				memberList:[],
				curpage:1,
				totalpage:0,
				startpage:0,
				endpage:0,
				ss:''
			}
		},
		mounted(){
			this.callList()
			
		},
		methods:{
			callList(){
				axios.get("../adminPage/memberList_vue.do",{
					params:{
						page:this.curpage,
						ss:this.ss
					}
				}).then(res=>{
					this.memberList=res.data
					this.paging()
				    
				})
				
			},
			
			deleteMem(mno,type){
				axios.get('../adminPage/memberControl_vue.do',{
					params:{
						mno:mno,
						type:type
					}
				}).then(res=>{
					alert('처리완료되었습니다.')
					this.callList()
				})
			},
			grantMem(mno,type){
				axios.get('../adminPage/memberControl_vue.do',{
					params:{
						mno:mno,
						type:type
					}
				}).then(res=>{
					alert('처리완료되었습니다.')
					this.callList()
				})
			},
			revokeMem(mno,type){
				axios.get('../adminPage/memberControl_vue.do',{
					params:{
						mno:mno,
						type:type
					}
				}).then(res=>{
					alert('처리완료되었습니다.')
					this.callList()
				})
			},
			revokeMemWing(mno,type){
				axios.get('../adminPage/memberControl_vue.do',{
					params:{
						mno:mno,
						type:type
					}
				}).then(res=>{
					alert('처리완료되었습니다.')
					this.callList()
				})
			},
			
			paging(){
				axios.get("../adminPage/memberList_page_vue.do",{
					params:{
						page:this.curpage,
						ss:this.ss
					}
				}).then(response=>{
					 this.totalpage=response.data.totalpage
					 this.startpage=response.data.startpage
					 this.endpage=response.data.endpage
					 this.curpage=response.data.curpage
					
				})
			},
			
			range(start,end){
				let arr=[]
			
				let size=end-start;
				for(let i=0;i<=size;i++){
					arr[i]=start;
					start++;
				}
				return arr;
			},
			next(){
				this.curpage=this.endpage+1
				this.callList()
				
			},
			prev(){
				this.curpage=this.startpage-1
				this.callList()
				
			},
			move(page){
				this.curpage=page
				this.callList()
				
			}
			
		}
}).mount('#adminApp')

</script>
</body>
</html>