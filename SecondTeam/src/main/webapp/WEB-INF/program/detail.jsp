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
            		  	<c:if test="${sessionScope.id==null }">
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
				<div class="row">
				
				
				</div>
          
		
			
		
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
				sessionId:'${sessionScope.id}',
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
			
				if(this.sessionId===''){
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
				if(this.sessionId===''){
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
	
	</script>
</body>
</html>