<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<style type="text/css">
.title{
white-space: nowrap; 	
overflow: hidden; 	
text-overflow: ellipsis;   
}
.addr1search{
width: 200px;
height : 40px;
border: 2px solid gray;
border-radius: 20px;
text-align: center;
}
.addr1button{
background-color: #214252;
border-radius: 20px;
color: #fff;
}
.page-link{
cursor: pointer;
}
/*사이드 메뉴*/
.res_submenu{
	background-color: #214252;
	text-align: center;
	border-radius: 50%;
	position: fixed;
	right: 150px;
	top: 500px;
	width: 100px;
	height: 100px;
	z-index: 9999 !important;
}
.res_submenu a{
	display: block;
}
.res_submenu i{
	margin-top: 20px;
	font-size: 25px;
	color: #fff !important;
}
.res_submenu p{
	color: #fff;
}
.res_submenu:hover{
	 box-shadow: 0 10px 10px 10px rgba(147,160,168, 0.2);
	 transition: all 0.4s ease-in-out;
	 transform: translateY(-25px);
}
</style>
</head>
<body>
<section class="section posts-entry posts-entry-sm bg-white" id="moimList">
		<div class="container" >
   <!-- 일정 사이드 매뉴 시작 -->
   <div class="res_submenu" style="z-index: 9999 !important;">
      <a href="schedule.do"> <i class="xi-calendar-list"></i>
         <p>나의 일정표</p>
      </a>
   </div>
   <!-- 일정 사이드 매뉴 종료 -->
		<div class="row mb-4">
				<div class="col-sm-6">
					<h3 class="heading">공간 대여 리스트</h3>
				</div>
				<div class="col-sm-6 text-sm-end">
                    <!-- ref:기본검색어 / v-model:input에 검색기능 연결 / @keyup.enter:엔터치면해당함수실행 -->
                    <input type="text" class="input-sm addr1search" ref="tt" v-model="tt" @keyup.enter="find()">
                    <!-- @click:클릭시해당함수실행 -->
                    &nbsp;<input type="button" class="btn-sm btn addr1button" value="주소검색" @click="find()">
                </div>
			</div>
			<hr>
			
			<!-- 본문시작 -->
			
			<div class="row">
			<div class="col-lg-4 mb-4" v-for="(vo,index) in moim_list">
					<div class="post-entry-alt">
						<a :href="'before_detail.do?rno='+vo.rno" class="img-link"
						style="display: inline-block;
						max-width: 370px; width:100%; height:100%; max-height: 225px; min-height: 225px;">
						   <img :src="vo.img" :title="vo.loc" class="img-fluid" 
						   style="width: 100%; height: 230px;">
						</a>
						<div class="excerpt">
						    <p style="display: inline-block;">{{vo.type}}</p>
						    &nbsp;<span><i class="xi-videocam"></i> {{vo.beam}}</span>
						    &nbsp;<span><i class="xi-desktop"></i> {{vo.pc}}</span>
						    &nbsp;<span><i class="xi-print"></i> {{vo.printer}}</span>
						    &nbsp;<span><i class="xi-microphone"></i> {{vo.mic}}</span><br>
							<h2 class="title"><a :href="'before_detail.do?rno='+vo.rno">{{vo.loc}}</a></h2>
							<div class="post-meta align-items-center text-left clearfix">
								<p class="title" style="font-weight: 600;">{{vo.time}}</p>
								<p>{{vo.addr1}}</p>
							</div>
						</div>
					</div>
				</div>
			<div class="text-center">
				<ul class="pagination">
			      <li v-if="startPage>1" class="page-item"><a class="page-link" @click="prev()">&laquo;</a></li>
          		  <li v-for="i in range(startPage,endPage)" :class="i===curpage?'active':''"><a class="page-link" @click="pageChange(i)">{{i}}</a></li>
          		  <li v-if="endPage<totalpage" class="page-item"><a class="page-link" @click="next()">&raquo;</a></li>
			    </ul>
		     </div>
		    </div>
		    <!-- 쿠키부분 --> 
		    <div>
		    <h3 class="heading">최근 방문 게시글</h3>
		    <hr>
		    <span v-for="vo in cookie_list">
		     <a :href="'../moim/detail.do?rno='+vo.rno">
 		      <img :src="vo.img" :title="vo.loc"
		      style="border-radius: 10px; width: 100px; height: 100px;">
		     </a>
		    </span>
		    </div>
		</div><!-- .container -->
</section>
<script>
 let moim_list=Vue.createApp({
	 data(){
		 return{
			 rno:1,
			 moim_list:[],
			 page_list:{},
			 tt:' ',
			 curpage:1,
 			 totalpage:0,
 			 startPage:0,
 			 endPage:0,
 			 cookie_list:[]
		 }
	 },
	 mounted(){
		 this.dataRecv()
	  },
	 methods:{
		 dataRecv(){
 			axios.get('../moim/list_vue.do',{
 				params:{
 					page:this.curpage,
 					tt:this.tt
 				}
 			}).then(res=>{
 				console.log(res.data)
 				this.moim_list=res.data // 데이터 속성 수정
 			})
 			
 			axios.get('../moim/page_vue.do',{
 				params:{
 					page:this.curpage,
 					tt:this.tt
 				}
 			}).then(response=>{
 				console.log(response.data)
 				this.page_list=response.data // 데이터 속성 수정
 				this.curpage=response.data.curpage
 				this.totalpage=response.data.totalpage
 				this.startPage=response.data.startPage
 				this.endPage=response.data.endPage
 			})
 			
 			//쿠키
 			axios.get('../moim/moim_cookie_vue.do').then(res=>{
 				console.log(res.data)
 				this.cookie_list=res.data
 			})
 		},
 		range(start,end){
			 let arr=[]
			 let length=end-start
			 for(let i=0;i<=length;i++)
			 {
				 arr[i]=start
				 start++;
			 }
			 return arr;
		 },
		 prev(){
			 this.curpage=this.startPage-1
			 this.dataRecv()
		 },
		 next(){
			 this.curpage=this.endPage+1
			 this.dataRecv()
		 },
		 pageChange(page){
			 this.curpage=page
			 this.dataRecv()
		 },
			find(){
				 this.curpage=1
				 this.dataRecv()
			 }
		}
 }).mount('#moimList')
</script>
</body>
</html>
