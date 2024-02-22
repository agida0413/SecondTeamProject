<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>


<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.zzim{
margin-left:15px; margin-right:15px;  padding:10px; border-radius:4px; background-color:#87CEEB;
            		
}

.zzim:hover{
cursor: pointer;
}
.textareaStyle{
 width: 100%; /* 너비를 부모 요소에 맞게 설정 */
        height: auto; /* 높이를 자동으로 조정 */
        padding: 10px; /* 안쪽 여백 */
        border: 1px solid #ddd; /* 테두리 스타일 및 색상 */
        border-radius: 5px; /* 테두리 둥글게 */
        resize: none; /* 크기 조정 비활성화 */
        outline: none; /* 포커스 효과 제거 */
        font-size: 16px; /* 글꼴 크기 */
        font-family: Arial, sans-serif; /* 글꼴 설정 */
        color: #333; /* 글꼴 색상 */
}

.answerTextarea{
width: 95%; /* 너비를 부모 요소에 맞게 설정 */
        height: auto; /* 높이를 자동으로 조정 */
        padding: 10px; /* 안쪽 여백 */
        border: 1px solid #ddd; /* 테두리 스타일 및 색상 */
        border-radius: 5px; /* 테두리 둥글게 */
        resize: none; /* 크기 조정 비활성화 */
        outline: none; /* 포커스 효과 제거 */
        font-size: 16px; /* 글꼴 크기 */
        font-family: Arial, sans-serif; /* 글꼴 설정 */
        color: #333; /* 글꼴 색상 */
}
.insert{
 padding: 5px 20px;
        background: #f2f2f2;
        color: #000;
        font-size: 15px;
         border-radius: 0.25rem !important;
         cursor:pointer;
}
.rpoint{
cursor:pointer;
}
.act{
font-weight:bold;
color:blue;
}

</style>
</head>
<body>

  	 <div class=""><span style="font-weight:bold; font-size:30px; color:black;">봉사프로그램 조회</span></div>

            		<hr>
            
            <div class="container" id="programDetailHeader">
          			
            		<span><input type="button" class="btn btn-medium btn-primary" value="목록" onClick="javascript:history.back()"></span>
            		  <span style="float:right;">
            		  <input type="button" class="btn btn-medium btn-danger" value="신청하기" @click="applyClick()">
            		  
            		  <span class="zzim" @click="zzimBtnClick">
            		  	<c:if test="${sessionScope.id==null }"><!-- 변경요망 -->
            		  	 	<img src="../Projectimages/emptyHeart.png" width="25px">
            		  	</c:if>
            		  	<img v-if="zzimstate=='NO'" src="../Projectimages/emptyHeart.png" width="25px">
            		  	<img v-if="zzimstate=='YES'" src="../Projectimages/fullHeart.png" width="25px">
            		  	&nbsp;<span style="font-weight:bold; font-size:15px; color:white;">관심목록 담기</span>
            		  	
            		  </span>
            		
            		  </span> 
            	
            </div>
	<div class="container" id="programDetail">
	
		<div class="row">
			
          
            	<div class="row">
            		<!-- 헤드 -->
            		
            		
            		<!-- 목록,신청,관심목록 -->
            		
            		  
            		  <!-- 타이틀 -->
            		  <div class="pg_detail_title">
            		  <span style="font-weight:bold; color:black;">${vo.title }</span>&nbsp;
            		  <span style="color:red;opacity:0.7;">(${vo.collect_state})</span>
            		  </div>
            		  <!-- 상세정보 -->
            		<table class="table detailTable">
            			
            			
            			<tr>
            				<td style="width:15%; background-color:#f0f0f0;" class="informObj" >봉사기간</td>
            				<td style="width:35%">${vo.dbV_start}&nbsp;~&nbsp;${vo.dbV_end}</td>
            				<td style="width:15%; background-color:#f0f0f0;" class="informObj">봉사시간</td>
            				<td style="width:35%">${vo.runtime }</td>
            			</tr>
            			
            			<tr>
            				<td class="informObj" style="background-color:#f0f0f0;">모집기간</td>
            				<td>${vo.dbCollect_start }&nbsp;~&nbsp;${vo.dbCollect_end }</td>
            				<td class="informObj" style="background-color:#f0f0f0;">활동요일</td>
            				<td>${vo.rundate }</td>
            			</tr>
            			
            			<tr>
            				<td class="informObj" style="background-color:#f0f0f0;">모집인원</td>
            				<td>${vo.collect_num }명</td>
            				<td class="informObj" style="background-color:#f0f0f0;">신청인원</td>
            				<td>${vo.apply_num }명</td>
            			</tr>
            			
            			<tr>
            				<td class="informObj" style="background-color:#f0f0f0;">봉사분야</td>
            				<td>${vo.major_field}&nbsp;&gt;&nbsp;${vo.minor_field }</td>
            				<td class="informObj" style="background-color:#f0f0f0;">봉사자유형</td>
            				<td>${vo.volunteer_type }</td>
            			</tr>
            			
            			<tr>
            				<td class="informObj" style="background-color:#f0f0f0;">모집센터</td>
            				<td>${vo.centername }</td>
            				<td class="informObj" style="background-color:#f0f0f0;">위치구분</td>
            				<td>${vo.si }&nbsp;${vo.gu }</td>
            			</tr>
            			
            			<tr>
            				<td class="informObj" style="background-color:#f0f0f0;">상세위치</td>
            				<td>${vo.address }</td>
            				<td class="informObj" style="background-color:#f0f0f0;">봉사대상</td>
            				<td>${vo.target }</td>
            			</tr>
            			
            			<tr>
            			<td class="informObj" style="background-color:#f0f0f0;">활동구분</td>
            			<td >${vo.active_type }</td>
            			<td class="informObj" style="background-color:#f0f0f0;">획득가능보상</td>
            				<td>${vo.getwing }&nbsp;<img src="../Projectimages/wing3.png" width="20px;"></td>
            			</tr>
            		</table>
            	</div>
            	
            	<!-- 지도 -->
            	<div class="row" style="margin-top:15px;">
					<div id="map" style="width:100%;height:350px;"></div>
				</div>
				
				<!-- 댓글 -->
		
 		</div>
		
		
	</div>
			<div class="row" id="programReplyApp">
			
			
				     <div class="pt-5 comment-wrap">
				     <!-- 댓글 갯수 -->
            <h2 class="mb-5 heading" style="font-size:25px;">{{rsize}} Comments</h2>
               	
              
              <!-- 새댓글 작성 -->
                <div class="comment-body" v-if="sessionId!==''">
                
                <div style="margin-bottom:10px;">
               <img src="../Projectimages/userIcon.jpg" alt="Image placeholder" width="40px">
              <span style="font-weight:bold;color:black; font-size:20px; margin-left:5px;">{{sessionName}}</span>
               
                   </div>
                   
                <textarea rows="3" cols="98" class="textareaStyle" placeholder="새로운 댓글을  작성해 주세요." v-model="content"></textarea>
                   <p style="float:right; margin-top:10px;">
                 <a class="insert rounded" style="font-weight:bold;" @click="replyNormalInsert(1,0)">등록하기</a>
                  </p>
               
                
                </div>
      <!-- 새댓글 작성  끝-->
      
      		 <!-- 조건별 -->
          		  <div  style="margin-top:50px;">
		            	 <p >
		            	 <span style="margin-right:5px;" @click="replyNewlyList()"><a class="insert rounded" :class="condition==1?'act':''" >최신순</a></span>
		                 <span style="margin-right:5px;" @click="replyLikeList()"><a  class="insert rounded" :class="condition==2?'act':''">순공감순</a></span>
		                <span style="margin-right:5px;" @click="replyLikePercentList()"><a class="insert rounded" :class="condition==3?'act':''">공감비율순</a></span>
		                 <span v-if="sessionId!==''" @click="replyMyReList()"><a class="insert rounded" :class="condition==4?'act':''">My댓글</a></span>      
		                  </p>
                  </div>
                   <!-- 조건별 끝 -->
                  
                  
               <!-- 보더-->   
            <div style=" margin-bottom:30px;border-top:2px #999 solid;"></div>
            
            
        
          </div>
               <div v-if="rsize===0">
               	<h2>아직 등록된 댓글이 없습니다.</h2>
               </div>
            <!-- 댓글리스트 -->
              <ul class="comment-list" v-for="vo in replyListData">
             	
			
              <li class="comment" style="border-bottom:2px #999 solid;">
             
              
               <!-- 일반댓글 -->
                <div class="vcard">
                  <img src="../Projectimages/userIcon.jpg" alt="Image placeholder">
                </div>
                <div class="comment-body" >
                  <h3>{{vo.username}}
                 
                 <span style="float:right; ">
                   <span  @click="replyDelete(vo.rno,vo.root)" v-if="vo.content!=='삭제된 댓글입니다.'"><a style= "color:#ff9999; margin-right:10px;"class="reply rounded rpoint" v-if="vo.userid===sessionId">삭제</a></span>
                        <span  @click="updateForm(vo.rno)" v-if="vo.content!=='삭제된 댓글입니다.'"> <a style="color:#8470FF; margin-right:10px;" class="reply rounded rpoint" v-if="vo.userid===sessionId" >수정</a> </span>
                   <span ><a  style="margin-right:10px;" class="reply rounded rpoint" v-if="vo.userid!==sessionId">신고하기</a></span>
                 
                 </span> 
                  </h3>
                  <div class="meta">{{vo.dbDay}}</div>
                  <p style="margin-top:8px; font-weight:bold; color:black;">{{vo.content}}</p>
                  <p>
                  <a class="reply rounded rpoint" @click="replyNormalList(2,vo.rno,vo.userid)">답변({{vo.depth}})</a>
                 
                  <span style="float:right; margin-right:10px;">
                
                   
                
                  <span style="margin-right:10px;">
                  
                  <img src="../Projectimages/notup.png" width="20px;" v-if="vo.rvo.like_state!=='YES'" @click="replyLike(vo.rno,vo.rvo.like_state,vo.rvo.hate_state,1,vo.root,vo.userid)" class="rpoint">
                  <img src="../Projectimages/up.png" width="20px;" v-if="vo.rvo.like_state==='YES'" @click="replyLike(vo.rno,vo.rvo.like_state,vo.rvo.hate_state,1,vo.root,vo.userid)" class="rpoint">
	                  <span style="margin-left:4px;">
	                {{vo.like_count}}
	                  </span>
                  </span>
                    <span>
                   
                     <img src="../Projectimages/notdislike.png" width="20px;" v-if="vo.rvo.hate_state!=='YES'" @click="replyLike(vo.rno,vo.rvo.like_state,vo.rvo.hate_state,2,vo.root,vo.userid)" class="rpoint">
                  <img src="../Projectimages/dislike.png" width="20px;" v-if="vo.rvo.hate_state==='YES'" @click="replyLike(vo.rno,vo.rvo.like_state,vo.rvo.hate_state,2,vo.root,vo.userid)" class="rpoint">
                    	  <span style="margin-left:4px;">
			               {{vo.hate_count}}
			               </span>
                     </span>
                    </span> 
                  </p>
                </div>
                
                
                  
  <!-- 일반댓글 끝-->

		 <ul class="children hideA" style="background-color:#f8f8f8; border-top:2px #999 solid; display:none;" :id="'noAnswer'+vo.rno" >
		 <li class="comment">
		 등록된 답변이 없습니다.
		 </li>
		 </ul>
				<!-- 답변댓글 -->
				
                <ul class="children hideA" style=" border-top:2px #999 solid; display:none;" :id="'answer'+vo.rno" >
               
                  <li class="comment" v-for="avo in answerList" style="border:1px #999 solid; padding:20px;border-radius:15px; background-color:#f8f8f8;   ">
                   	 
                   	
                    <div class="vcard" >
                      <img src="../Projectimages/userIcon.jpg" alt="Image placeholder">
                      
                    </div>
                    <div class="comment-body">
                 
                      <h3>{{avo.username}}
                        <span style="float:right;">
                   <span  @click="replyDelete(avo.rno,avo.root)"><a style= "margin-right:10px; color:#ff9999;"class="reply rounded rpoint" v-if="avo.userid===sessionId">삭제</a></span>
                        <span @click="updateForm(avo.rno)"> <a style="margin-right:10px; color:#8470FF;" class="reply rounded rpoint" v-if="avo.userid===sessionId" >수정</a> </span>
                 <span ><a style="margin-right:10px;" class="reply rounded rpoint" v-if="avo.userid!==sessionId">신고하기</a></span>
                 
                 </span> 
                      </h3>
                      <div class="meta">{{avo.dbDay}}</div>
                      <p style="margin-top:8px; font-weight:bold; color:black;">{{avo.content}}</p>
                        <p>
               
                <span style="float:right; margin-right:10px;">
                
                   
                
                  <span style="margin-right:10px;">
                  
                  <img src="../Projectimages/notup.png" width="20px;" v-if="avo.rvo.like_state!=='YES'" @click="replyLike(avo.rno,avo.rvo.like_state,avo.rvo.hate_state,1,avo.root,avo.userid)" class="rpoint">
                  <img src="../Projectimages/up.png" width="20px;" v-if="avo.rvo.like_state==='YES'" @click="replyLike(avo.rno,avo.rvo.like_state,avo.rvo.hate_state,1,avo.root,avo.userid)" class="rpoint">
	                  <span style="margin-left:4px;">
	                {{avo.like_count}}
	                  </span>
                  </span>
                    <span>
                   
                     <img src="../Projectimages/notdislike.png" width="20px;" v-if="avo.rvo.hate_state!=='YES'" @click="replyLike(avo.rno,avo.rvo.like_state,avo.rvo.hate_state,2,avo.root,avo.userid)" class="rpoint">
                  <img src="../Projectimages/dislike.png" width="20px;" v-if="avo.rvo.hate_state==='YES'" @click="replyLike(avo.rno,avo.rvo.like_state,avo.rvo.hate_state,2,avo.root,avo.userid)" class="rpoint">
                    	  <span style="margin-left:4px;">
			               {{avo.hate_count}}
			               </span>
                     </span>
                    </span> 
                   
                  </p>
                    </div>
                    
                    
                    
                 


                  </li>
                   
                </ul>
              
              
                <!-- 답변댓글 끝 -->
                
                
                <!-- 답변달기 -->
             	
                   <ul class="children hideA" style="background-color:#f8f8f8; border-top:2px #999 solid; display:none;" :id="'Form'+vo.rno" v-if=" sessionId!==''">
		               	<li >
		               		   <textarea  class="answerTextarea" placeholder="새로운 답변을  작성해 주세요." v-model="answerContent"></textarea>
		               		   
		                   <p style="float:right; margin-top:10px; margin-right:42px;">
		                <span style="margin-right:5px;"><a class="insert rounded" @click="hideAnswer(vo.rno)"><img src="../Projectimages/upSide.png" width=15px >&nbsp;답글접기</a></span>
		                  <span @click="replyNormalInsert(2,vo.rno)"><a  class="insert rounded" style="color:#8470FF; font-weight:bold; margin-right:5px;">등록하기</a></span>
		                  </p>
		                  
		                   
		               	</li>
                 
              	  </ul>
                <!-- 답변달기 끝 -->
              
               

            
            </ul>
          
            <!-- END comment-list -->
                <div  v-show="isShow" id="replyDialog" >
		<div class="comment-body">
		            <div style="margin-bottom:10px;">
		                <img src="../Projectimages/userIcon.jpg" alt="Image placeholder" width="40px">
		                <span style="font-weight:bold;color:black; font-size:20px; margin-left:15px;">{{updateName}}</span>
		            </div>
		            <textarea rows="5" cols="98" class="textareaStyle" v-model="updateContent">{{updateContent}}</textarea>
		            <p style="float:right; margin-top:10px;">
		                <a class="insert rounded" style="color:blue;" @click ="replyUpdate(updateRno,updateRoot)">수정하기</a>
		            </p>
		        </div>
        </div>
          
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
				
				
          
	
	<script>

	
	
	let programDetail = Vue.createApp({
	    data() {
	        return {
	            address: '${vo.centername}',
	            sigu: '${vo.si}' + ' ' + '${vo.gu}',
	            state: 'Y'
	            
	           
	        }
	    },
	    mounted() {
	        if (window.kakao && window.kakao.maps) {
	            this.initMap();
	        } else {
	            this.addScript();
	        }
	    },
	    methods: {
	        addScript() {
	            const script = document.createElement("script");
	            script.onload = () => kakao.maps.load(this.initMap);
	            script.src = "https://dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=c2368186c0091fdb14d91b7b4aa613ff&libraries=services";
	            document.head.appendChild(script);
	        },
	        initMap() {
	            var mapContainer = document.getElementById('map');
	            var mapOption = {
	                center: new kakao.maps.LatLng(33.450701, 126.570667),
	                level: 3
	            };
	            var map = new kakao.maps.Map(mapContainer, mapOption);
	            var geocoder = new kakao.maps.services.Geocoder();
	            
	            geocoder.addressSearch(this.address, (result, status) => {
	                if (status === kakao.maps.services.Status.OK) {
	                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	                    this.displayMarker(map, coords);
	                    map.setCenter(coords);
	                } else {
	                    this.state = 'N';
	                    this.trySecondSearch(map, geocoder);
	                }
	            });
	        },
	        trySecondSearch(map, geocoder) {
	            if (this.state === 'N') {
	                geocoder.addressSearch(this.sigu, (result, status) => {
	                    if (status === kakao.maps.services.Status.OK) {
	                        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	                        this.displayMarker(map, coords);
	                        map.setCenter(coords);
	                    }
	                });
	            }
	        },
	        displayMarker(map, coords) {
	            var marker = new kakao.maps.Marker({
	                map: map,
	                position: coords
	            });

	            var infowindow = new kakao.maps.InfoWindow({
	            	content: '<div style="width:150px;text-align:center;padding:6px 0; color:black;">' + (this.state === 'Y' ? this.address : this.sigu) + '</div>'

	               
	            });

	            infowindow.open(map, marker);
	        }
	    }
	    
	}).mount('#programDetail');
	
	
	let programDetailHeader=Vue.createApp({
		data(){
			return{
				sessionId:'${sessionScope.id}',<!--변경요망-->
				vno:${vo.vno},
				ct:'${vo.collect_state}',
				zzimstate:'${state}'
			}
		},
		mounted(){
			console.log(this.zzimstate)
		},
		methods:{
			applyClick(){
			
				if(this.sessionId===''){<!--변경요망-->
					alert('로그인 후 이용가능합니다')
					return;
				}
				else if(this.ct==='모집완료'){
					alert('모집종료된 프로그램입니다.')
					return;
				}
				
				else{
					location.href="../program/apply.do?vno="+this.vno
				}
			},
			zzimBtnClick(){
				if(this.sessionId===''){<!--변경요망-->
					alert('로그인 후 이용가능합니다')
					return;
				}
				
				axios.get('../program/wishlistUpdate_vue.do',{
					params:{
						zzimstate:this.zzimstate,
						vno:this.vno
					}
				}).then(res=>{
					this.zzimstate=res.data
				})
			}
		}
	}).mount('#programDetailHeader')
	
	
	
	let programReplyApp=Vue.createApp({
		data(){
			return{
				sessionId:'${sessionScope.id}',
				sessionName:'${sessionScope.name}',
				vno:${vo.vno},
				content:'',
				rtype:1,
				root:0,
				replyListData:[],
				rsize:0,
				condition:1,
				 curpage:1,
	   			 totalpage:0,
	   			 startpage:0,
	   			 endpage:0,
	   			answerContent:'',
	   			answerList:[],
	   			answerSize:0,
	   			updateContent:'',
	   			updateName:'',
	   			updateRno:0,
	   			updateRoot:0,
	   			isShow:false
	   	
	   			
	   		
				
				
			}
		},
		mounted(){
			console.log(this.sessionId)
			this.replyNormalList(1,0);
		},
		methods:{
			replyLike(rno,ls,hs,rtype,updateRoot,us){
					
				let type=0;
				
				if(updateRoot===0){
					type=1;
				}
				else{
					type=2;	
				}
			
				if(this.sessionId===''){
					alert('로그인 후 이용가능합니다.')
					return;
				}
				
				
				if(this.sessionId===us){
					alert('본인댓글엔 공감을 누를 수 없습니다.')
					return;
				}
				
			
				axios.get('../program/replyLikeUpdate_vue.do',{
					params:{
						rno:rno,
						like_state:ls,
						hate_state:hs,
						type:rtype
					}
				}).then(res=>{
					if(type==1){
						
						this.replyNormalList(1,0,'a')
					}
					if(type==2){
					
						this.replyNormalList(2,updateRoot,'open')
						
						
					}
				})
			},
			
			replyDelete(rno,updateRoot){
				let type=0;
				
				if(updateRoot===0){
					type=1;
				}
				else{
					type=2;	
				}
				axios.get('../program/replyDelete_vue.do',{
					params:{
						rno:rno,
						root:updateRoot
					}
				}).then(res=>{
						
					
						if(type==1){
						
						this.replyNormalList(1,0,'a')
					}
					if(type==2){
					
						this.replyNormalList(2,updateRoot,'open')
						
						
					}
					alert('댓글 삭제가 완료되었습니다.')
				})
			},
			replyUpdate(rno,updateRoot){
				console.log('asdasdasd'+rno)
				let type=0;
				if(updateRoot===0){
					type=1;
				}
				else{
					type=2;	
				}
				console.log(rno)
				if(this.updateContent.trim()===''){
					alert('내용을 입력해주세요.')
					return;
				}
				
				axios.get('../program/replyUpdate_vue.do',{
					params:{
						rno:rno,
						content:this.updateContent
					}
				}).then(res=>{
					
					if(type==1){
						
						this.replyNormalList(1,0,'a')
					}
					if(type==2){
					
						this.replyNormalList(2,updateRoot,'open')
						
						
					}
					 this.isShow=false
					 $('#replyDialog').dialog('close');
					 alert('수정이 완료되었습니다.')
				})
			},
			
			updateForm(rno){
				axios.get('../program/getUpdateInfo_vue.do',{
					params:{
						rno:rno
					}
				}).then(res=>{
					
					 this.updateContent=res.data.content
					 this.updateName=res.data.username
					 this.updateRno=res.data.rno
					 
					 this.updateRoot=res.data.root
					
	    			 this.isShow=true
					 $('#replyDialog').dialog({
	    				 autoOpen:false,
	    				 modal:true,
	    				 width:600,
	    				 height:300,
	    				 position: {
	    				        my: "center",
	    				        at: "center",
	    				        of: window
	    				    }
	    			 }).dialog('open')
	    			 
				})
			},
			showAnswers(rno){
				this.answerContent=''
				
			
				
				 	let answer = 'answer' + rno;
				
			        let showAnswer = $('#' + answer).css('display');
			        
			        let Form ='Form'+rno
			        let showAnswerForm = $('#' +Form).css('display');
			        
			        if (showAnswer === 'none') {
			         
			            console.log('1실행')
			            
			             $('#' + answer).css('display', 'block');
			           
			           
			            
			        } else {
			        	   $('#' + answer).css('display', 'none');
				         
				            console.log('2실행')
						 
			        }
			        
			        if (showAnswerForm === 'none') {
				         
			          
			            
			           
			            $('#' +Form).css('display', 'block');
			           
			            
			        } else {
			        	  
				            $('#' + Form).css('display', 'none');
				          
						 
			        }
			        
			        
			        
			        
			        $('[id^="answer"]').each(function(index, element) {
			            if (element.id !== 'answer' + rno) {
			                $(element).css('display', 'none'); // 해당 ID가 아닌 경우 display를 none으로 설정
			            }
			        });
				
			        
			        $('[id^="Form"]').each(function(index, element) {
			            if (element.id !== 'Form' + rno) {
			                $(element).css('display', 'none'); // 해당 ID가 아닌 경우 display를 none으로 설정
			            }
			        });
			        
			    
			       
			    	
			    	
			  
			    	
			},
			
			hideAnswer(rno){
				this.answerContent=''
					 let answer = 'answer' + rno;
			         
			        
			        let Form ='Form'+rno
			      	
			        
			        $('#' + answer).css('display', 'none');
			        $('#' + Form).css('display', 'none');
			},
			replyNormalInsert(type,root){
				this.rtype=type
				this.root=root
				let content = '';
				if(type===1){
					if(this.content.trim()===''){
						alert('내용을 입력해주세요.')
						return;
					}
					content=this.content
				}
				else{
					if(this.answerContent.trim()===''){
						alert('내용을 입력해주세요.')
						return;
					}
					
					content=this.answerContent	
				}
				axios.get('../program/replyInsert_vue.do',{
					params:{
						content:content,
						rtype:this.rtype,
						root:this.root,
						objno:this.vno,
						typeno:1
					
						
						
						
					}
				}).then(res=>{
					this.content=''
					if(type==1){
						this.condition=1
						this.curpage=1
						this.replyNormalList(1,0,'a')
					}
					if(type==2){
					
						this.replyNormalList(2,root,'open')
						
						
					}
						
				})
				
			},
			replyNormalList(type,root,userid){
				this.rtype=type
				this.root=root
				
				axios.get('../program/replyList_vue.do',{
				
					
					params:{
						condition:this.condition,
						rtype:this.rtype,
						root:this.root,
						objno:this.vno,
						page:this.curpage
					}
				}).then(res=>{
					
					
					if(type===1){
						this.replyListData=res.data
						this.paging()
						
						
					}
					else{
					
						this.answerList=res.data
						
						this.answerSize=this.answerList.length
						
						this.showAnswers(root)
						
					
						
						if(this.answerSize===0){
							let answer = 'answer' + root;
							 $('#' + answer).css('display', 'none');
							if(this.sessionId===''){
								alert('등록된 답변이 없으며,답변은 로그인 후 가능합니다.')
							}
							
						}
						
						if(userid==='open'){
							let answer = 'answer' + root;
							 let Form ='Form'+root
							 $('#' + answer).css('display', 'block');
							  $('#' +Form).css('display', 'block');
						}
						
						
						
						
						
					}
					
					//여기 
					axios.get('../program/getAmount_vue.do.do',{
						params:{
						objno:this.vno	
						}
					}).then(res=>{
						this.rsize=res.data
					})
					
				})
			},
			paging(){
				$('.hideA').hide()
				axios.get("../program/replyListPage_vue.do.do", {
				    params: {
				     objno:this.vno,
				     page:this.curpage,
				     condition:this.condition
				    }
				}).then(response => {
				 this.totalpage=response.data.totalpage
				 this.startpage=response.data.startpage
				 this.endpage=response.data.endpage
				 this.curpage=response.data.curpage
				
				 
				
				
				}).catch(error => {
				   
				});
				
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
				this.curpage=this.end+1
				this.replyNormalList(1,0);
			},
			prev(){
				this.curpage=this.start-1
				this.replyNormalList(1,0);
			},
			move(page){
				this.curpage=page
				this.replyNormalList(1,0);
			},
			replyNewlyList(){
				this.condition=1
				this.curpage=1
				this.replyNormalList(1,0);
			},
			replyLikeList(){
				this.condition=2
				this.curpage=1
				this.replyNormalList(1,0);
			},
			replyLikePercentList(){
				this.condition=3
				this.curpage=1
				this.replyNormalList(1,0);
			},
			replyMyReList(){
				this.condition=4
				this.curpage=1
				this.replyNormalList(1,0);
			}
		}
	}).mount('#programReplyApp')
	</script>
</body>
</html>