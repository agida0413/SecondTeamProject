<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>


<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>

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
            <h3 class="mb-5 heading">6 Comments</h3>
               	
              
              <!-- 새댓글 작성 -->
                <div class="comment-body" v-if="sessionId!==''">
                
                <div style="margin-bottom:10px;">
               <img src="../Projectimages/userIcon.jpg" alt="Image placeholder" width="40px">
              <span style="font-weight:bold;color:black; font-size:20px; margin-left:5px;">김용준</span>
                   </div>
                   
                <textarea rows="3" cols="98" class="textareaStyle" placeholder="새로운 댓글을  작성해 주세요." v-model="content"></textarea>
                   <p style="float:right; margin-top:10px;">
                 <a class="insert rounded" @click="replyNormalInsert()">등록하기</a>
                  </p>
               
                
                </div>
      <!-- 새댓글 작성  끝-->
      
      		 <!-- 조건별 -->
          		  <div  style="margin-top:50px;">
		            	 <p >
		            	 <span style="margin-right:5px;"><a href="#" class="insert rounded">최신순</a></span>
		                 <span style="margin-right:5px;"><a href="#" class="insert rounded">순공감순</a></span>
		                <span ><a href="#" class="insert rounded">공감비율순</a></span>   
		                  </p>
                  </div>
                   <!-- 조건별 끝 -->
                  
                  
               <!-- 보더-->   
            <div style=" margin-bottom:30px;border-top:2px #999 solid;"></div>
            
            
            
            
            <!-- 댓글리스트 -->
              <ul class="comment-list" v-for="vo in replyListData">
             
			
              <li class="comment" style="border-bottom:2px #999 solid;">
               
               
               <!-- 일반댓글 -->
                <div class="vcard">
                  <img src="../Projectimages/userIcon.jpg" alt="Image placeholder">
                </div>
                <div class="comment-body">
                  <h3>{{vo.username}}
                   
                 <span style="float:right; margin-right:10px;">
                   <span style="margin-right:10px;"><a style= "color:#ff9999;"class="reply rounded">삭제</a></span>
                        <span style="margin-right:10px;"> <a style="color:#8470FF;" class="reply rounded">수정</a> </span>
                 <a class="reply rounded">신고하기</a>
                 
                 </span> 
                  </h3>
                  <div class="meta">{{vo.dbDay}}</div>
                  <p>{{vo.content}}</p>
                  <p>
                  <a class="reply rounded" @click="showAnswers()">답변({{vo.depth}})</a>
                  <span style="float:right; margin-right:10px;">
                
                   
                
                  <span style="margin-right:10px;"><img src="../Projectimages/notup.png" width="20px;">
	                  <span>
	                  20
	                  </span>
                  </span>
                    <span>
                    <img src="../Projectimages/dislike.png" width="20px;">
                    	  <span>
			                  20
			               </span>
                     </span>
                    </span> 
                  </p>
                </div>
  <!-- 일반댓글 끝-->


				<!-- 답변댓글 -->
                <ul class="children" style="background-color:#f8f8f8; border-top:2px #999 solid; display:none;" ref="answer5">
                  <li class="comment">
                    <div class="vcard">
                      <img src="../Projectimages/userIcon.jpg" alt="Image placeholder">
                    </div>
                    <div class="comment-body">
                      <h3>Jean Doe
                        <span style="float:right; margin-right:10px;">
                   <span style="margin-right:10px;"><a style= "color:#ff9999;"class="reply rounded">삭제</a></span>
                        <span style="margin-right:10px;"> <a style="color:#8470FF;" class="reply rounded">수정</a> </span>
                 <a class="reply rounded">신고하기</a>
                 
                 </span> 
                      </h3>
                      <div class="meta">January 9, 2018 at 2:21pm</div>
                      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                        <p>
               
                  <span style="float:right; margin-right:10px;">
                
                   
                
                  <span style="margin-right:10px;"><img src="../Projectimages/notup.png" width="20px;">
	                  <span>
	                  20
	                  </span>
                  </span>
                    <span>
                    <img src="../Projectimages/dislike.png" width="20px;">
                    	  <span>
			                  20
			               </span>
                     </span>
                    </span> 
                  </p>
                    </div>


                  </li>
                   
                </ul>
                <!-- 답변댓글 끝 -->
                
                
                <!-- 답변달기 -->
                   <ul class="children" style="background-color:#f8f8f8; border-top:2px #999 solid; display:none;">
		               	<li >
		               		   <textarea  class="answerTextarea" placeholder="새로운 답변을  작성해 주세요."></textarea>
		               		   
		                   <p style="float:right; margin-top:10px; margin-right:42px;">
		                <span style="margin-right:5px;"><a href="#" class="insert rounded"><img src="../Projectimages/upSide.png" width=15px>&nbsp;답글접기</a></span>
		                  <span><a href="#" class="insert rounded" style="color:#8470FF; font-weight:bold;">등록하기</a></span>
		                  </p>
		                  
		                   
		               	</li>
                 
              	  </ul>
                <!-- 답변달기 끝 -->
              
                </li>

            
            </ul>
          
            <!-- END comment-list -->

        
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
				vno:${vo.vno},
				content:'',
				rtype:1,
				root:0,
				replyListData:[],
				condition:1,
				 curpage:1,
   			 totalpage:0,
   			 startpage:0,
   			 endpage:0
				
				
			}
		},
		mounted(){
			this.replyNormalList();
		},
		methods:{
			showAnswers(){
				
				if(this.$refs.answer5.style.display === 'block'){
					this.$refs.answer5.style.display = 'none';
				}else{
					this.$refs.answer5.style.display = 'block';
				}
				
				
				
			},
			replyNormalInsert(){
				this.rtype=1
				this.root=0
				axios.get('../program/replyInsert_vue.do',{
					params:{
						content:this.content,
						rtype:this.rtype,
						root:this.root,
						objno:this.vno,
						typeno:1
					
						
						
						
					}
				}).then(res=>{
					this.content=''
					alert('성공')
				})
			},
			replyNormalList(){
				this.rtype=1
				this.root=0
				axios.get('../program/replyList_vue.do',{
				
					
					params:{
						condition:this.condition,
						rtype:this.rtype,
						root:this.root,
						objno:this.vno,
						page:this.curpage
					}
				}).then(res=>{
					this.replyListData=res.data
					console.log(this.replyListData)
					alert('성공')
				})
			}
		}
	}).mount('#programReplyApp')
	</script>
</body>
</html>