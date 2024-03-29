<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 수정버튼 -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
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

</style>
</head>
<body>
	<div class="container" style="margin-top: 50px;">
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
<!-- 	       <div class="post-entry-sidebar follow_id_list" v-for="vo in follow_list">
	          <i class="xi-profile"></i><br>
	          <span class="date"
	          style="font-size: 9px;"
	          ><i class="xi-at"></i>{{vo.userId}}</span><br>
	          <span class="date"
	          style="color: #666; font-size: 11px;"
	          >{{vo.userName}}</span>
	          <a style="border: 2px solid #93a0a8; border-radius: 2px; display:block;
	                   width:80px; margin: 0 auto; cursor:pointer;
				        color: #93a0a8; padding: 5px; font-size: 13px;" @click="followInsert(vo.userId)">
				        <i class="xi-user-plus"></i>&nbsp;follow</a>
	       </div> -->
	       <div class="post-entry-sidebar follow_id_list" v-for="vo in follow_list">
    <i class="xi-profile"></i><br>
    <span class="date" style="font-size: 9px;"><i class="xi-at"></i>{{vo.userId}}</span><br>
    <span class="date" style="color: #666; font-size: 11px;">{{vo.userName}}</span>
    <a style="border: 2px solid #93a0a8; border-radius: 2px; display:block; width:80px; margin: 0 auto; cursor:pointer; color: #93a0a8; padding: 5px; font-size: 13px;"
     @click="followInsert(vo.userId)">
        <i class="xi-user-plus"></i>&nbsp;follow
    </a>
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
   				 >My Feed ({{count}})</span>
   	    </div>
   	    
   	     <!-- sns insert 부분 시작 -->
               <div style="color: #000;
   				 margin-bottom: 30px;
   				 padding-bottom: 20px;
   				 border-bottom: 1px solid #e6e6e6;" v-show="myid!=''">
			       <textarea style="float: left; width: 80%; height: 100%;
			       " v-model="content" ref="content"  @keyup.enter="snsInsert()"></textarea>
			       <input type=button value="새글쓰기" style="float: right;height: 100%; background: #848d92;" 
			       class="btn" @click="snsInsert()">
			   </div>
            <!-- sns insert 부분 종료 -->
   	    
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
				<div v-if="vo.userid===myid">
				<a href="#" :id="'up'+vo.sno" @click="snsUpdateForm(vo.sno)" class="updates"
				style="border: 2px solid #93a0a8; border-radius: 2px; display:inline-block;
				color: #93a0a8; padding: 5px; font-size: 13px;"><i class="xi-pen"></i>&nbsp;글수정하기</a>&nbsp;
				<a href="#"
				style="border: 2px solid #93a0a8; border-radius: 2px; display:inline-block;
				color: #93a0a8; padding: 5px; font-size: 13px;" @click="snsDelete(vo.sno)"><i class="xi-close-circle"></i>&nbsp;글삭제하기</a>
				</div>
			</h6>
			<span>{{vo.dbday}}</span>
			 <div :id="'u'+vo.sno" class="ups" style="margin: 20px 0; display: none;">
			        <textarea style="float: left; width: 80%; height: 100%;" :id="'content'+vo.sno">{{vo.content}}</textarea>
			        <input type=button value="글 수정" style="float: right;height: 100%; background: #848d92;" 
			        class="btn" @click="snsUpdate(vo.sno)">
             </div>
			
			
		</div><!-- blog-entry -->
		</div>
    <div class="col-md-4" >
    
        <div id="sns_keep">
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
        
        <!-- 태그 부분 시작 -->
      <!--  <div style="margin-left: 20px;" id="moim_tag" class="sidebar-box"
       >
       <h3 class="heading">tag list</h3>
           <ul class="tags" >
              <li><a class="link">예시자료</a></li>
            </ul>
       </div> -->
    </div>
   
		</div><!-- row -->
	</div><!-- container -->
<script>
   let moimlist=Vue.createApp({
	   data(){
		   return{
			   
		   }
	   },
	   mounted(){
		   axios.get("",{
			   params:{
				   
			   }
		   })
	   }
   }).mount('#moim_tag')
</script>
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
						 height:400
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
  let follow_list=Vue.createApp({
	  data(){
		  return{
			  follow_list:[],
		      userId:'${id}'
		  }
	  },
	  mounted(){
		  this.dataRecv()
	  },
	  methods:{
		  dataRecv(){
			  axios.get('../sns/list_id_vue.do',{
				  params: {
				        userId: this.userId
				    }
			  }).then(res=>{
				  console.log(res.data)
				  this.follow_list=res.data
			  })
		  },
		// 추가
		  followInsert(userId) {
			    console.log("전송할 userId 값:", userId); // userId 값 콘솔 출력
			    axios.post('../sns/follow_insert_vue.do',null, {
			    	params:{
			    		userId: userId
			    	}
			    }).then(res => {
			        console.log(res.data);
			        this.follow_list = res.data;
			        alert(userId+"가 팔로우 되었습니다.")
			    }).catch(error => {
			        console.error('Error adding follow:', error);
			    });
			}
	  }
  }).mount('#id_list')
</script>
<script>
  let mycontent_list=Vue.createApp({
	  data(){
		  return{
			  mycontent_list:[],
			  myid:'${id}',
			  content:'',
			  bCheck:true,
			  count:0
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
				  this.count=res.data.length
			  })
		  },
		  //수정
		  snsUpdateForm(sno){
			   $('.ups').hide();
				 $('.updates').attr("value","수정")
				 if(this.bCheck===true)
				 {
					$('#u'+sno).show();
					$('#up'+sno).attr("value","취소")
					this.bCheck=false
				 }
				 else
				 {
					 $('#u'+sno).hide();
					 $('#up'+sno).text("수정")
					 this.bCheck=true
				 }
				  
			  },
			  snsUpdate(sno){
					let content=$('#content'+sno).val();
					axios.get('../sns/update_vue.do',{
						params:{
							sno:sno,
							content:content
						}
					}).then(response=>{
						// 상태 관리 => 데이터 변경 
						this.mycontent_list=response.data
						$('#u'+sno).hide()
						$('#up'+sno).attr("value","수정")
						// 페이지 새로고침
				        window.location.reload();
					})
				  },
		  // 삭제 
		 snsDelete(sno) {
    // 확인 대화상자 띄우기
    if (confirm("정말로 삭제하시겠습니까?")) {
        axios.get("../sns/delete_vue.do", {
            params: {
                sno: sno
            }
        }).then(response => {
            this.mycontent_list = response.data;
        });
    } else {
        // 사용자가 No를 선택한 경우
        console.log("삭제 취소");
    }
},
		// 추가
		  snsInsert(){
			  if(this.content==="")
			  {
				  this.$refs.content.focus()
				  return
			  }
			  
			  axios.get('../sns/insert_vue.do',{
				  params:{
					  content:this.content
				  }
			  }).then(response=>{
				  this.mycontent_list=response.data
				  this.content=""
			  })
		  }
	  }
  }).mount('#mycontent_list')
</script>
</body>
</html>