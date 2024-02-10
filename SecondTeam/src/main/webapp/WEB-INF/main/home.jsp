<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#donSdata:hover{
cursor: pointer;
}
</style>
</head>
<body>
<!-- Start retroy layout blog posts -->
	<section class="section bg-light">
		<div class="container">
			<div class="row align-items-stretch retro-layout">
				<div class="col-md-4">
					<a href="single.html" class="h-entry mb-30 v-height gradient">

						<div class="featured-img" style="background-image: url('../Projectimages/가치소비(메인)_1.png');"></div>

						<div class="text">
							<span class="date">가치소비</span>
							<h2>가격이 아닌 가치를 봅니다</h2>
						</div>
					</a>
					<a href="../moim/list.do" class="h-entry v-height gradient">

						<div class="featured-img" style="background-image: url('https://www.youthcenter.go.kr/framework/filedownload/getImage.do?filePathName=K43kYCzEpw54N3DsTLz6bJLpCGXfefyPhrBXNjbTRk7OEZSm89DACCuhJZnoTy5l3nVe89E4xNenWWewSQmXfw%3D%3D');"></div>

						<div class="text">
						<span class="date" style="
						color: #fff; font-weight: 700;
						font-size: 20px; text-shadow: 0 0 5px #555;">소모임 공간대여</span>
							<span class="date">서울청년센터 마포 오랑</span>
							<h2>도움이 필요하지만 뭔가 막막할 때,<br>청년지원매니저를 찾아주세요!</h2>
						</div>
					</a>
				</div>
				<div class="col-md-4">
					<a href="single.html" class="h-entry img-5 h-100 gradient">

						<div class="featured-img" style="background-image: url('../Projectimages/test1.jpg');"></div>

						<div class="text">
							<span class="date">Apr. 14th, 2022</span>
							<h2>나현쨩</h2>
						</div>
					</a>
				</div>
				<div class="col-md-2">
					<a href="single.html" class="h-entry mb-30 v-height gradient">

						<div class="featured-img" style="background-image: url('../Projectimages/2.jpg');"></div>

						<div class="text">
							<span class="date">물품기부</span>
							<h2>나와 우리, 그리고 지구를 위한</h2>
						</div>
					</a>
					<a href="single.html" class="h-entry v-height gradient">

						<div class="featured-img" style="background-image: url('../Projectimages/SNS.jpg');"></div>
						
						<span class="date" style="
						position:absolute; top:20px; right:20px;
						color: #fff; font-weight: 700;
						font-size: 25px; text-shadow: 0 0 5px #555;">SNS</span>
						<div class="text">
							<span class="date">다양한 사람<br>지속적인 모임</span>
							<h2>오프라인을 넘어 SNS에서 따스함을 공유하세요</h2>
						</div>
					</a>
					
					
				</div>
				
				<div class="col-md-2">
					<a href="single.html" class="h-entry mb-30 v-height gradient">

						<div class="featured-img" style="background-image: url('../Projectimages/volmain.jpg');"></div>

						<div class="text">
							<span class="date">봉사프로그램</span>
							<h2>가치있는 시간,보람있는 순간</h2>
						</div>
					</a>
					<a href="single.html" class="h-entry v-height gradient">

						<div class="featured-img" style="background-image: url('../Projectimages/talenetmain3.jpg');"></div>

						<div class="text">
							<span class="date">재능기부</span>
							<h2>도운만큼 얻어가는 다양한 재능</h2>
						</div>
					</a>
					
					
				</div>
				
				
			</div>
		</div>
	</section>
	<!-- End retroy layout blog posts -->
	  <section class="section posts-entry posts-entry-sm bg-light">
		<div class="container" id="donSearch">
		<div class="row mb-4">
				<div class="col-sm-6">
					<h2 class="posts-entry-title">기부스토어 검색</h2>
				</div>
				<div class="col-sm-6 text-sm-end"><a href="category.html" class="read-more">방문예약하기</a></div>
			</div>
			<div class="row g-3">
				<div class="col-md-7 order-md-2">
					<div class="row">
						<div class="col-md-12">
						  <!-- 지도 출력 -->
							<div class="blog-entry">
									<div v-if="donStore_list.length>0" id="map" style="width:770px;height:500px;"></div>
									<div v-if="donStore_list.length===0">
									<img src="../Projectimages/지도 (1).png" style="margin-left: 200px;">
									</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="text-end">
						<div style="position: relative;">
							<input type="text" class="form-control" placeholder="Search..."
								ref="ss" v-model="ss" @keyup.enter="search()"
								style="background-color: black;"> 
								<span class="bi bi-search" 
								style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%);"
								@click="search()"></span>
						</div>
					</div>
					<span v-if="ss===''">
					<br>
					[방문기증 예약 안내]<br><br>
					매장을 검색하시어<br> 
					보다 편리한 방문 예약을 이용해보세요!<br><br>
					매장 오픈시간과 마감시간은 혼잡하오니
					해당 시간대를 피해서 예약해주시면 좀 더 원활하게 이용하실 수 있습니다.<br><br>
					</span>
					
					<table class="text-center" v-if="ss!==''">
						<tr v-if="donStore_list.length>0">
							<th width="10%">번호</th>
							<th width="25%">지점</th>
							<th width="25%">전화번호</th>
							<th width="40%">주소</th>
						</tr>
						<tr v-for="vo in donStore_list" height="85px;"  @click="dnoSend(vo.dno)" id="donSdata">
							<td>{{vo.dno}}</td>
							<td>{{vo.name}}</td>
							<td>{{vo.phone}}</td>
							<td>{{vo.address}}</td>
						</tr>
						<span v-if="donStore_list.length===0 && ss!==''" >
							<br>
							검색하신 키워드와 일치하는 매장이 없습니다.<br><br>
							다시 검색 해주세요.
					    </span>
					</table>
					<div class="row" v-if="donStore_list.length>0" class="donSpage">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<li class="page-item" v-if="startpage>1"><a class="page-link" href="#"
								aria-label="Previous" @click="prev()"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<li class="page-item" v-for="i in range(startpage,endpage)" :class="curpage===i?'active':''"><a class="page-link" href="#" @click="change(i)">{{i}}</a></li>
							<li class="page-item" v-if="endpage<totalpage"><a class="page-link" href="#"
								aria-label="Next" @click="next()"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
				</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Start posts-entry -->
	<!-- Start posts-entry -->
		

	<section class="section posts-entry posts-entry-sm bg-light">
		<div class="container">
			<div class="row mb-4">
				<div class="col-sm-6">
					<h2 class="posts-entry-title">인기상품</h2>
				</div>
				<div class="col-sm-6 text-sm-end"><a href="category.html" class="read-more">View All</a></div>
			</div>

			<div class="row">
				
				
				<div class="col-lg-4 mb-4">
					<div class="post-entry-alt">
						<a href="single.html" class="img-link"><img src="../images/img_1_horizontal.jpg" alt="Image" class="img-fluid"></a>
						<div class="excerpt">
							

							<h2><a href="single.html">Startup vs corporate: What job suits you best?</a></h2>
							<div class="post-meta align-items-center text-left clearfix">
								<figure class="author-figure mb-0 me-3 float-start"><img src="../images/person_3.jpg" alt="Image" class="img-fluid"></figure>
								<span class="d-inline-block mt-1">By <a href="#">David Anderson</a></span>
								<span>&nbsp;-&nbsp; July 19, 2019</span>
							</div>

							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quo sunt tempora dolor laudantium sed optio, explicabo ad deleniti impedit facilis fugit recusandae! Illo, aliquid, dicta beatae quia porro id est.</p>
							<p><a href="#" class="read-more">Continue Reading</a></p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-4">
					<div class="post-entry-alt">
						<a href="single.html" class="img-link"><img src="../images/img_4_horizontal.jpg" alt="Image" class="img-fluid"></a>
						<div class="excerpt">
							
							

							<h2><a href="single.html">Startup vs corporate: What job suits you best?</a></h2>
							<div class="post-meta align-items-center text-left clearfix">
								<figure class="author-figure mb-0 me-3 float-start"><img src="../images/person_2.jpg" alt="Image" class="img-fluid"></figure>
								<span class="d-inline-block mt-1">By <a href="#">David Anderson</a></span>
								<span>&nbsp;-&nbsp; July 19, 2019</span>
							</div>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quo sunt tempora dolor laudantium sed optio, explicabo ad deleniti impedit facilis fugit recusandae! Illo, aliquid, dicta beatae quia porro id est.</p>
							<p><a href="#" class="read-more">Continue Reading</a></p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-4">
					<div class="post-entry-alt">
						<a href="single.html" class="img-link"><img src="../images/img_3_horizontal.jpg" alt="Image" class="img-fluid"></a>
						<div class="excerpt">
							
							

							<h2><a href="single.html">Startup vs corporate: What job suits you best?</a></h2>
							<div class="post-meta align-items-center text-left clearfix">
								<figure class="author-figure mb-0 me-3 float-start"><img src="../images/person_5.jpg" alt="Image" class="img-fluid"></figure>
								<span class="d-inline-block mt-1">By <a href="#">David Anderson</a></span>
								<span>&nbsp;-&nbsp; July 19, 2019</span>
							</div>

							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quo sunt tempora dolor laudantium sed optio, explicabo ad deleniti impedit facilis fugit recusandae! Illo, aliquid, dicta beatae quia porro id est.</p>
							<p><a href="#" class="read-more">Continue Reading</a></p>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</section>
	<!-- Start posts-entry -->
	<section class="section posts-entry">
		<div class="container">
			<div class="row mb-4">
				<div class="col-sm-6">
					<h2 class="posts-entry-title">유나</h2>
				</div>
				<div class="col-sm-6 text-sm-end"><a href="../moim/list.do" class="read-more">View All</a></div>
			</div>
			<div class="row">
				<div>
					<div class="row" style="display: flex; justify-content: space-between;">
					<c:forEach var="mvo" items="${mlist }">
						<div class="col-md-6" style="width: 30% !important;">
							<div class="blog-entry">
								<a href="single.html" class="img-link">
									<img src="${mvo.img }" alt="Image" class="img-fluid">
								</a>
								<span class="date">${mvo.time }</span>
								<h2><a href="single.html">${mvo.loc }</a><span class="date" style="font-size: 19px; font-weight: 650;">${mvo.type }</span></h2>
								<p>${mvo.content }</p>
								<p><a href="single.html" class="btn btn-sm btn-outline-primary">더보기</a></p>
							</div>
						</div>
					  </c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End posts-entry -->

	<!-- Start posts-entry -->
	<section class="section posts-entry posts-entry-sm bg-light">
		<div class="container">
		<h1>나현</h1><!-- 지워도됌 -->
			<div class="row">
				<div class="col-md-6 col-lg-3">
					<div class="blog-entry">
						<a href="single.html" class="img-link">
							<img src="../images/img_1_horizontal.jpg" alt="Image" class="img-fluid">
						</a>
						<span class="date">Apr. 14th, 2022</span>
						<h2><a href="single.html">Thought you loved Python? Wait until you meet Rust</a></h2>
						<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
						<p><a href="#" class="read-more">Continue Reading</a></p>
					</div>
				</div>
				<div class="col-md-6 col-lg-3">
					<div class="blog-entry">
						<a href="single.html" class="img-link">
							<img src="../images/img_2_horizontal.jpg" alt="Image" class="img-fluid">
						</a>
						<span class="date">Apr. 14th, 2022</span>
						<h2><a href="single.html">Startup vs corporate: What job suits you best?</a></h2>
						<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
						<p><a href="#" class="read-more">Continue Reading</a></p>
					</div>
				</div>
				<div class="col-md-6 col-lg-3">
					<div class="blog-entry">
						<a href="single.html" class="img-link">
							<img src="../images/img_3_horizontal.jpg" alt="Image" class="img-fluid">
						</a>
						<span class="date">Apr. 14th, 2022</span>
						<h2><a href="single.html">UK sees highest inflation in 30 years</a></h2>
						<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
						<p><a href="#" class="read-more">Continue Reading</a></p>
					</div>
				</div>
				<div class="col-md-6 col-lg-3">
					<div class="blog-entry">
						<a href="single.html" class="img-link">
							<img src="../images/img_4_horizontal.jpg" alt="Image" class="img-fluid">
						</a>
						<span class="date">Apr. 14th, 2022</span>
						<h2><a href="single.html">Don’t assume your user data in the cloud is safe</a></h2>
						<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
						<p><a href="#" class="read-more">Continue Reading</a></p>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<section class="section posts-entry posts-entry-sm bg-white">
		<div class="container">
		<h1>용준</h1><!-- 지워도됌 -->
			<div class="row">
				<div class="col-md-6 col-lg-3">
					<div class="blog-entry">
						<a href="single.html" class="img-link">
							<img src="../images/img_1_horizontal.jpg" alt="Image" class="img-fluid">
						</a>
						<span class="date">Apr. 14th, 2022</span>
						<h2><a href="single.html">Thought you loved Python? Wait until you meet Rust</a></h2>
						<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
						<p><a href="#" class="read-more">Continue Reading</a></p>
					</div>
				</div>
				<div class="col-md-6 col-lg-3">
					<div class="blog-entry">
						<a href="single.html" class="img-link">
							<img src="../images/img_2_horizontal.jpg" alt="Image" class="img-fluid">
						</a>
						<span class="date">Apr. 14th, 2022</span>
						<h2><a href="single.html">Startup vs corporate: What job suits you best?</a></h2>
						<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
						<p><a href="#" class="read-more">Continue Reading</a></p>
					</div>
				</div>
				<div class="col-md-6 col-lg-3">
					<div class="blog-entry">
						<a href="single.html" class="img-link">
							<img src="../images/img_3_horizontal.jpg" alt="Image" class="img-fluid">
						</a>
						<span class="date">Apr. 14th, 2022</span>
						<h2><a href="single.html">UK sees highest inflation in 30 years</a></h2>
						<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
						<p><a href="#" class="read-more">Continue Reading</a></p>
					</div>
				</div>
				<div class="col-md-6 col-lg-3">
					<div class="blog-entry">
						<a href="single.html" class="img-link">
							<img src="../images/img_4_horizontal.jpg" alt="Image" class="img-fluid">
						</a>
						<span class="date">Apr. 14th, 2022</span>
						<h2><a href="single.html">Don’t assume your user data in the cloud is safe</a></h2>
						<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
						<p><a href="#" class="read-more">Continue Reading</a></p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End posts-entry -->

	<!-- Start posts-entry -->
	<!-- Start posts-entry -->
		<script>
	let search=Vue.createApp({
		data(){
			return{
				donStore_list:[],
				ss:'',
				curpage:1,
				totalpage:0,
				startpage:0,
				endpage:0,
				dno:0,
				address:'',
				name:'',
				state:'N'
				
			}
		},
		mounted(){
			
		},
		methods:{
			send() {
	            axios.get("../donstore/search_vue.do", {
	                params: {
	                    ss: this.ss,
	                    page: this.curpage
	                }
	            }).then(res => {
	            
	                this.donStore_list = res.data
	                if (this.donStore_list.length > 0) {
	                    this.dno = this.donStore_list[0].dno
	                    console.log('샌드'+this.dno)
	                }
	                this.donMap()
	                
	            }).catch(error => {
	                console.error("error:", error);
	            })
	            axios.get("../donstore/page_vue.do",{
	            	params:{
	            		ss:this.ss,
	            		page:this.curpage
	            	}
	            }).then(res=>{
	            	this.curpage=res.data.curpage
	            	this.startpage=res.data.startpage
	            	this.endpage=res.data.endpage
	            	this.totalpage=res.data.totalpage
	            })
	         
	        },
	        search(){
	        	
	        		
	        	   console.log('서치'+this.dno)
	        	this.state='Y'
	        	this.send()	
	        	this.donMap()
				let sss=this.$refs.ss.value;
				if(sss=="")
				{
					alert("검색어를 입력하세요")		
					return
				}
				
	        	
	        	this.count=this.count+1;
			},
			range(start,end){
				let arr=[]
				let leng=end-start
				for(let i=0;i<=leng;i++)
				{
					arr[i]=start
					start++
				}
				return arr;
			},
			prev(){
				this.curpage=this.startpage-1
				this.send()
			},
			change(page){
				this.curpage=page
				this.send()
			},
			next(){
				this.curpage=this.endpage+1
				this.send()
			},
			dnoSend(dno){
				this.state='N'
				this.dno = dno;
		       
		        this.donMap();
		  },
		  donMap(){
			
			  console.log('돈맵'+this.dno)
			 
			  axios.get("../donstore/detail_vue.do", {
			        params: {
			            dno: this.dno
			        }
			    }).then(res => {
			    
			        this.vo = res.data;
			        this.address = res.data.address;
			        this.name = res.data.name;
			        if (window.kakao && window.kakao.maps) {
			            this.initMap();
			        } else {
			            this.addScript();
			        }
			    });
			},
			addScript(){
				const script=document.createElement("script") // <script>
				/* global kakao */
				script.onload=()=>kakao.maps.load(this.initMap)
				script.src="https://dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=23e8040d553778eeeb77f0900cb92322&libraries=services"
				document.head.appendChild(script)
			},
			initMap(){
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();

			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(this.address, (result, status)=> {

			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {

			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });

			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+this.name+'</div>'
			        });
			        infowindow.open(map, marker);

			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			})
		  }
			
		}
	}).mount("#donSearch")
</script>
	

	

</body>
</html>