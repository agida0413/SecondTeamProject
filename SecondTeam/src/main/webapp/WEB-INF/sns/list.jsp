<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 다이얼로그 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<style type="text/css">
li{
    list-style: none;
}
.title {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
.page-link {
	cursor: pointer;
}

.xi-profile {
	font-size: 50px;
}
/* 드롭다운 메뉴를 숨기는 클래스 */
.dropdown {
  display: none;
  position: absolute;
  width: 100px;
  height: 50px;
}
.dropdown li{
  background: gray;
  display: inline-block;
  padding: 5px 10px;
  margin-bottom: 10px;
  border-radius: 10px;
}
.has-children{
  position: relative;
  top: 15px;
}
/* 드롭다운 메뉴 표시 */
.show {
  display: block;
}

.follow_id_list{
  cursor:pointer;
  text-align: center;
  margin-bottom: 20px;
  padding-bottom: 10px;
  border-bottom: 1px solid #e6e6e6;"
}

.mycontent_list{
  cursor:pointer;
  margin-bottom: 20px;
  padding-bottom: 10px;
  border-bottom: 1px solid #e6e6e6;"
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
	<div class="container" style="margin-top: 50px;">
	<!-- 예약 사이드 매뉴 시작 -->
   <div class="res_submenu" style="z-index: 9999 !important;">
      <a href="insert.do"> <i class="xi-pen"></i>
         <p>새글쓰기</p>
      </a>
   </div>
   <!-- 예약 사이드 매뉴 종료 -->
	   <div class="row">
<%-- 	   <p>${sessionScope.id }출력됨</p>
	   <p>${sessionScope.userid }출력안됨</p> --%>
	    <div class="col-md-1" id="id_list">
	      <h3 class="heading"
	      style="font-size: 18px; text-align:center;
   				 color: #000;
   				 font-weight: 400;
   				 margin-bottom: 30px;
   				 padding-bottom: 20px;
   				 border-bottom: 1px solid #e6e6e6;">추천목록</h3>
	       <div class="post-entry-sidebar follow_id_list" v-for="(vo,index) in id_list">
	          <i class="xi-profile"></i><br>
	          <span class="date"><i class="xi-at"></i>{{vo.userid}}</span><br>
	          <span class="date">{{vo.username}}</span>
	       </div>
	    </div>
	    
		<div class="col-md-7" style="display: flex; flex-flow: column;" id="mycontent_list">
		<div class="heading"
	      style="color: #000;
   				 margin-bottom: 22px;
   				 padding-bottom: 12px;
   				 border-bottom: 1px solid #e6e6e6;">
   				 <span
   				 style="font-size: 18px; font-weight: 400;"
   				 >My Feed</span>
   	    </div>
		   <div class="blog-entry mycontent_list" v-for="(vo,index) in mycontent_list">

				<div style="display: flex; justify-content: space-between;">
				  <div style="display: flex;">
					<i class="xi-profile"></i> &nbsp;
					<div>
						<span class="date"><i class="xi-at"></i>{{vo.userid}}</span><br> 
						<span class="date">{{vo.username}}</span>
					</div>
				   </div>
					<div style="display: flex; align-items: center;">
					    <span><i class="xi-heart-o"></i>&nbsp;좋아요</span>&nbsp;
					    <span><i class="xi-lightbulb-o"></i>&nbsp;신고하기</span>
					</div>
				</div>
<!-- 			<p>
				<img :src="vo.pic" class="img-fluid"
				style="width: 100%; height: 400px;">
			</p> -->
			
			<h6 style="display: flex; justify-content: space-between;">
			    <p style="margin-top: 10px; width: 500px;">{{vo.content}}</p>
				<div>
				<a href="#"
				style="border: 2px solid #93a0a8; border-radius: 2px; display:inline-block;
				color: #93a0a8; padding: 5px; font-size: 13px;"><i class="xi-pen"></i>&nbsp;글수정하기</a>&nbsp;
				<a href="#"
				style="border: 2px solid #93a0a8; border-radius: 2px; display:inline-block;
				color: #93a0a8; padding: 5px; font-size: 13px;"><i class="xi-close-circle"></i>&nbsp;글삭제하기</a>
				</div>
			</h6>
			<span>{{vo.regdate}}</span>
			
		</div><!-- blog-entry -->
		</div>
    <div class="col-md-4" id="sns_keep">
         <div class="sidebar-box">
            <h3 class="heading">임시보호 반려동물</h3>
            <div class="post-entry-sidebar">
              <ul>
                <li v-for="(vo,index) in list_keep" class="page-link"
                style="display: flex; padding: 10px 0 5px 10px; border-radius: 10px;" @click="detail(vo.kano)">
                    <div class="img">
                       <img :src="vo.keepimage" 
                       style="width: 50px; height: 50px; border-radius: 100%;">
                    </div>
                    &nbsp;
                    <div class="text">
                      <span style="color: gray;"><i class="xi-at"></i>{{vo.keepwriter}}</span>
                      <p>{{vo.keeptitle}}</p>
                      <div class="post-meta">
                        <span class="mr-2" style="margin-top: 10px;">{{vo.keeploc}}</span>&nbsp;
                        <span class="mr-2" style="margin-top: 10px;">{{vo.keepregdate}}</span>
                        <span>{{vo.kano}}</span>
                      </div>
                    </div>
                </li>
              </ul>
            </div>
          </div>
          <!-- 임시보호동물 상세정보 다이얼로그창 -->
          <div id="dialog" title="임시보호 동물 상세보기" v-show="isShow">
             <detail_dialog v-bind:keep_detail="keep_detail"></detail_dialog>
          </div>
    </div>
		</div><!-- row -->
	</div><!-- container -->
<script>
  const detailComponent={
		  props:['keep_detail'],
		  template:`
			  <table class="table">
	             <tr>
	                <td width="30%" class="text-center" rowspan="7">
	                   <img :src="keep_detail.keepimage" style="width:100%">
	                </td>
	                <td colspan="2">
	                   <h3>{{keep_detail.keeptitle}}</h3>
	                </td>
	             </tr>
	             <tr>
	                <th width="15%">보호장소</th>
	                <td width="55%">{{keep_detail.keeploc}}</td>
	             </tr>
	             <tr>
	                <th width="15%">작성자</th>
	                <td width="55%">{{keep_detail.keepwriter}}</td>
	             </tr>
	             <tr>
	                <th width="15%">발견날짜</th>
	                <td width="55%">{{keep_detail.keepregdate}}</td>
	             </tr>
	             <tr>
	                <th width="15%">발견장소</th>
	                <td width="55%">{{keep_detail.keepaddr}}</td>
	             </tr>
	             <tr>
	                <th width="15%">상세내용</th>
	                <td width="55%">{{keep_detail.keepcontent}}</td>
	             </tr>
	          </table>
		  `
  }
  let sns_keep=Vue.createApp({
	  data(){
		  return{
			  list_keep:[],
			  keep_detail:{},
			  isShow:false
		  }
	  },
	  mounted(){
		  this.dataRecv()
	  },
	  methods:{
		  dataRecv(){
			  axios.get('../sns/list_keep_vue.do').then(res=>{
				  console.log(res.data)
				  this.list_keep=res.data
			  })
		  },
		//여기 kano는 지역변수임
			 detail(kano){
				 axios.get('../sns/detail_keep_vue.do',{
					 params:{
						 kano:kano
					 }
				 }).then(res=>{
					 console.log(res.data)
					 this.keep_detail=res.data
					 this.isShow=true
					 $('#dialog').dialog({
						 autoOpen:false,
						 modal:true,
						 width:700,
						 height:600
					 }).dialog("open")
				 }).catch(error=>{
					 console.log(error.res)
				 })
				
			 }
	  },
	  components:{
		  'detail_dialog':detailComponent
	  }
  }).mount('#sns_keep')
</script>
<script>
  let id_list=Vue.createApp({
	  data(){
		  return{
			  id_list:[]
		  }
	  },
	  mounted(){
		  this.dataRecv()
	  },
	  methods:{
		  dataRecv(){
			  axios.get('../sns/list_id_vue.do').then(res=>{
				  console.log(res.data)
				  this.id_list=res.data
			  })
		  }
	  }
  }).mount('#id_list')
</script>
<script>
  let mycontent_list=Vue.createApp({
	  data(){
		  return{
			  mycontent_list:[],
			  myid:'${id}'
		  }
	  },
	  mounted(){
		  this.dataRecv()
	  },
	  methods:{
		  dataRecv(){
			  axios.get('../sns/list_mycontent_vue.do',{
				  params:{
					  userid:this.myid
				  }
			  }).then(res=>{
				  console.log(res.data)
				  this.mycontent_list=res.data
			  })
		  }
	  }
  }).mount('#mycontent_list')
</script>
</body>
</html>