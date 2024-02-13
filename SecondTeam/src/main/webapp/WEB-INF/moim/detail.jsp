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
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<style type="text/css">
.title{
white-space: nowrap; 	
overflow: hidden; 	
text-overflow: ellipsis;   
}
</style>
</head>
<body>
<div class="moimDetail">
<!-- 상단 소제목 시작 -->
 <div class="site-cover site-cover-sm same-height overlay single-page" style="background-image: url('../images/hero_5.jpg');">
    <div class="container">
      <div class="row same-height justify-content-center">
        <div class="col-md-6">
          <div class="post-entry text-center">
            <h2 class="mb-4" style="color: #fff !important;">{{detail_data.loc}}</h2>
            <div class="post-meta align-items-center text-center">
              <span class="d-inline-block mt-1">센터번호</span>
              <span>&nbsp;-&nbsp; {{detail_data.num}}</span>
              <span>&nbsp;-&nbsp; {{detail_data.type}}</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 상단 소제목 종료 -->
  
  <!-- img content -->
  <div class="section">
    <div class="container">

      <div class="row blog-entries element-animate">

        <div class="col-md-12 col-lg-8 main-content">

          <div class="post-content-body">
            <div class="row my-4">
              <div class="col-md-12 mb-4">
                <img :src="detail_data.img" :title="detail_data.loc" class="img-fluid rounded"
                style="width: 100%">
              </div>
              <table class="table">
                 <tr>
                    <th>운영기관</th>
                    <td>{{detail_data.center}}</td>
                 </tr>
                 <tr>
                    <th>센터이용시간</th>
                    <td>{{detail_data.time}}</td>
                 </tr>
                 <tr>
                    <th>주소</th>
                    <td>{{detail_data.addr1}}</td>
                 </tr>
                 <tr>
                    <th>문의처</th>
                    <td>{{detail_data.call}}</td>
                 </tr>
                 <tr>
                    <th>센터이용 비용</th>
                    <td>{{detail_data.cost}}</td>
                 </tr>
                 <tr>
                    <th>식음료</th>
                    <td>{{detail_data.food}}</td>
                 </tr>
                 <tr>
                    <th>센터이용방법 </th>
                    <td>{{detail_data.method}}</td>
                 </tr>
                 <tr>
                    <th>홈페이지</th>
                    <td><a :href="detail_data.page" target="blank">{{detail_data.page}}</a></td>
                 </tr>
                 <tr>
                    <th>화상면접</th>
                    <td>{{detail_data.test1}}</td>
                 </tr>
                 <tr>
                    <th>취업상담</th>
                    <td>{{detail_data.test2}}</td>
                 </tr>
              </table>
            </div>
          </div>
          <div class="pt-5" style="display: flex; justify-content: space-between;">
            <p><a class="btn-xs btn" :href="'detail.do?rno=' + (parseInt(detail_data.rno) + 1)">&laquo; 이전글 확인하기</a></p>
            <p><button class="btn-xs btn" @click="dataList()">목록으로 돌아가기</button></p>
            <p><a class="btn-xs btn" :href="'detail.do?rno=' + (parseInt(detail_data.rno) + 1)">다음글 확인하기 &raquo;</a></p>
          </div>
        <!-- img content -->
        </div>
               <!-- 우상단 부분 -->
        <div class="col-md-12 col-lg-4 sidebar moimDetail">
          <div class="sidebar-box">
            <h3 class="heading">센터 소개글</h3>
            <div class="post-entry-sidebar">
              <ul>
                <li>
                    <div class="text">
                      <h4>{{detail_data.content}}</h4>
                      <div class="post-meta">
                        <span class="mr-2" style="margin-top: 10px;">{{detail_data.loc}}</span>
                      </div>
                    </div>
                </li>
              </ul>
            </div>
          </div>
          <!-- END sidebar-box -->

          <div class="sidebar-box">
            <h3 class="heading">사용가능 비품</h3>
            <ul class="categories">
              <li>빔프로젝터 <span>({{detail_data.bean}})</span></li>
              <li>컴퓨터 <span>({{detail_data.pc}})</span></li>
              <li>프린터 <span>({{detail_data.printer}})</span></li>
              <li>마이크 <span>({{detail_data.mic}})</span></li>
            </ul>
          </div>
          <!-- END sidebar-box -->

          <div class="sidebar-box">
            <h3 class="heading">아직 못정한 부분</h3>
            <ul class="tags">
              <li><a href="#">Travel</a></li>
              <li><a href="#">Adventure</a></li>
              <li><a href="#">Food</a></li>
              <li><a href="#">Lifestyle</a></li>
              <li><a href="#">Business</a></li>
              <li><a href="#">Freelancing</a></li>
              <li><a href="#">Travel</a></li>
              <li><a href="#">Adventure</a></li>
              <li><a href="#">Food</a></li>
              <li><a href="#">Lifestyle</a></li>
              <li><a href="#">Business</a></li>
              <li><a href="#">Freelancing</a></li>
            </ul>
          </div>
        </div>
        <!-- END sidebar -->
        <!-- 우상단부분 종료 -->
            <!-- END comment-list -->
          </div>
        </div>

        <!-- END main-content -->
      </div>
    </div>
     <!-- 댓글부분 시작 -->
        <div class="container">
          <div class="pt-5 comment-wrap" id="moim_reply">
            <h3 class="mb-5 heading">{{count}} Comments</h3>
               <div class="row">
			     <table class="table">
			       <tr>
			        <td>
			          <table class="table" v-for="vo in reply_list">
			           <tr>
			            <td class="text-left"><i class="xi-tag"></i>&nbsp;{{vo.username}}({{vo.dbday}})</td>
			            <td style="text-align: right;">
			              <span v-if="vo.userid===sessionId">
			                <input type=button value="수정" class="btn-xs btn updates" style="margin-left: 3px" :id="'up'+vo.mrno" @click="replyUpdateForm(vo.mrno)">
			                <input type=button value="삭제" class="btn-xs btn" @click="replyDelete(vo.mrno)">
			              </span>
			            </td>
			           </tr>
			           <tr>
			             <td colspan="2">
			              <pre style="white-space: pre-wrap;background-color: white;border:none">{{vo.msg}}</pre>
			             </td>
			           </tr>
			           
			           <tr :id="'u'+vo.mrno" class="ups" style="display:none">
			            <td colspan="2">
			             <textarea rows="5" cols="90" style="float: left" :id="'msg'+vo.mrno">{{vo.msg}}</textarea>
			             <input type=button value="댓글수정" style="float: left;height: 96px" class="btn" @click="replyUpdate(vo.mrno)">
			           </td>
			          </tr>
			           
			          </table>
			        </td>
			       </tr>
			     </table>
			     <table class="table" v-show="sessionId!=''">
			       <tr>
			         <td class="text-left">
			          <textarea rows="3" cols="125" style="float: left" v-model="msg" ref="msg"  @keyup.enter="replyInsert()"></textarea>
			          <input type=button value="댓글쓰기" style="float: left;height: 96px" class="btn" @click="replyInsert()">
			         </td>
			       </tr>
			     </table>
			   </div>
             </div>
            </div>
            <!-- 댓글부분 종료 -->
 
  <script>
   let moim_detail=Vue.createApp({
	   data(){
		   return{
			   detail_data:{},
			   rno:${rno}
		   }
	   },
	   methods:{
		   dataList(){
			   location.href="../moim/list.do"
		   }
	   },
	   mounted(){
		   axios.get('../moim/detail_vue.do',{
			   params:{
				   rno:this.rno
			   }
		   }).then(res=>{
			   console.log(res.data)
			   this.detail_data=res.data
		   })
	   }
   }).mount('.moimDetail')
   
   let moim_reply=Vue.createApp({
	   data(){
		   return{
			   rno:${rno},
			   sessionId:'${userid}',
			   reply_list:[],
			   mrno:0,
			   msg:'',
			   bCheck:true,
			   count:0
		   }
	   },
	   mounted(){
		   axios.get('../moim/detail_reply_vue.do',{
			   params:{
				   rno:this.rno
			   }
		   }).then(res=>{
			   console.log(res.data)
			   this.reply_list=res.data
			   this.count=res.data.length
		   })
	   },
	   methods:{
		   replyUpdateForm(mrno){
			   $('.ups').hide();
				 $('.updates').attr("value","수정")
				 if(this.bCheck===true)
				 {
					$('#u'+mrno).show();
					$('#up'+mrno).attr("value","취소")
					this.bCheck=false
				 }
				 else
				 {
					 $('#u'+mrno).hide();
					 $('#up'+mrno).text("수정")
					 this.bCheck=true
				 }
				  
			  },
			  replyUpdate(mrno){
					let msg=$('#msg'+mrno).val();
					axios.get('../moim/detail_reply_update_vue.do',{
						params:{
							mrno:mrno,
							rno:this.rno,
							msg:msg
							
						}
					}).then(response=>{
						// 상태 관리 => 데이터 변경 
						this.reply_list=response.data
						$('#u'+mrno).hide()
						$('#up'+mrno).attr("value","수정")
					})
				  },
				  
				  // 삭제 
				  replyDelete(mrno){
					  axios.get("../moim/detail_reply_delete_vue.do",{
						  params:{
							  mrno:mrno,
							  rno:this.rno
						  }
					  }).then(response=>{
						  this.reply_list=response.data
					  })
				  },
				  
				  // 추가
				  replyInsert(){
					  if(this.msg==="")
					  {
						  this.$refs.msg.focus()
						  return
					  }
					  
					  axios.get('../moim/detail_reply_insert_vue.do',{
						  params:{
							  rno:this.rno,
							  msg:this.msg
						  }
					  }).then(response=>{
						  this.reply_list=response.data
						  this.msg=""
					  })
				  }
	   }
   }).mount('#moim_reply')
  </script>
</body>
</html>