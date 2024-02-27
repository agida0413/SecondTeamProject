<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/3f828a1af5.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../css/donation.css">
<style type="text/css">
.do_category_theme_list{
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-pack: justify;
    -ms-flex-pack: justify;
    justify-content: space-between;
    position: relative;
    white-space: nowrap;
    list-style: none;
}
.dlink, input[type=radio]+label{
	cursor: pointer;
}
.do_category_item:hover{
	background-color: #e3e3e3;
}
.do_category_list li.active{
	background-color: #e3e3e3;
}
.do_category_item{
	display: block;
    height: 48px;
    padding: 12px 11px 0;
    border: 1px solid #e3e3e3;
    border-radius: 30px;
    cursor: pointer;
    margin-left: 9px;
}
.do_category_sublist{
	padding: 12px 14px;
    background-color: #f6f6f6;
    border-radius: 30px;
    font-size: 0;
    text-align: center;
    margin-left: 40px;
 	width: 1085px;   
}
.do_category_supportlist{
	overflow: auto;
    margin-bottom: -15px;
    padding-bottom: 15px;
    white-space: nowrap;
}
.category_support_label {
    display: inline-block;
    position: relative;
    height: 31px;
    padding: 7px 16px 0;
    font-size: 15px;
    color: #333;
}
.category_support_label:hover {
	text-decoration: underline;
	color: #00ab33;
	font-weight: bold;
}

.do_category_sublist li.active .category_support_label{
	text-decoration: underline;
	color: #00ab33;
	font-weight: bold;
}

input[type=radio] {
    overflow: hidden;
    position: absolute;
    width: 1px;
    height: 1px;
    margin: -1px;
    clip: rect(0 0 0 0);
}
.do_category_subitem {
    display: inline-block;
}
.donaTitle{
   white-space: nowrap; /* 텍스트가 줄바꿈되지 않도록 함 */ 
   overflow: hidden; /* 초과된 텍스트를 감추기위해 오버플로우를 숨김 */
   text-overflow: ellipsis; /* 말줄임표 만드는 속성 */
   font-size: 15px;
   letter-spacing: -.5px;
}
.card_bar {
    height: 5px;
    margin-top: 13px;
    background-color: #e8e8e8;
}
.card_bar_collection {
    display: inline-block;
    height: 100%;
    background-color: #10c838;
    text-align: right;
    vertical-align: top;
}
.card_content{
 	padding: 21px 20px 0;
 	border: 1px;
}
.card_form{
	float: left;
    position: relative;
    width: 267px;
    height: 250px;
    margin: 0 0 24px 24px;
    background-color: #fff;
    font-family:"Work Sans", sans-serif;;
    border: 1px solid rgba(0,0,0,.11);
    border-radius: 5px;
}
.card_percent{
	display: inline-block;
    margin-top: 11px;
    font-size: 17px;
    letter-spacing: -.2px;
    color: #00ab33;
    font-family:"Work Sans", sans-serif;;
}
.card_money {
    float: right;
    margin-top: 11px;
    font-size: 17px;
    color: #333;
    font-family:"Work Sans", sans-serif;;
}
.pagination li.active a{
	background-color: #214252;
    color: #fff;
}

</style>
</head>
<body>
  <div class="col-sm-8">
  <div class="wrap" id="donationList">
  	
  	<!-- 카테고리 출력 -->
  	<div class="do_category_list">
  	  <ul class="do_category_theme_list" id="doThemeList">
  	    <li :class="cate===1?'do_category_item active':'do_category_item'">
  	      <a class="dlink" @click="docate(1)">
  	        <i class="fa-solid fa-heart"></i>
  	        <span class="text">전체</span>
  	      </a>
  	    </li>
  	    <li :class="cate===2?'do_category_item active':'do_category_item'">
  	      <a class="dlink" @click="docate(2)">
  	        <i class="fa-solid fa-child"></i>
  	        <span class="text">아동/청소년</span>
  	      </a>
  	    </li>
  	    <li :class="cate===3?'do_category_item active':'do_category_item'">
  	      <a class="dlink" @click="docate(3)">
  	        <i class="fa-solid fa-person-cane"></i>
  	        <span class="text">어르신</span>
  	      </a>
  	    </li>
  	    <li :class="cate===4?'do_category_item active':'do_category_item'">
  	      <a class="dlink" @click="docate(4)">
  	        <i class="fa-solid fa-wheelchair"></i>
  	        <span class="text">장애인</span>
  	      </a>
  	    </li>
  	    <li :class="cate===5?'do_category_item active':'do_category_item'">
  	      <a class="dlink" @click="docate(5)">
  	        <i class="fa-regular fa-handshake"></i>
  	        <span class="text">다문화</span>
  	      </a>
  	    </li>
  	    <li :class="cate===6?'do_category_item active':'do_category_item'">
  	      <a class="dlink" @click="docate(6)">
  	        <i class="fa-solid fa-earth-americas"></i>
  	        <span class="text">지구촌</span>
  	      </a>
  	    </li>
  	    <li :class="cate===7?'do_category_item active':'do_category_item'">
  	      <a class="dlink" @click="docate(7)">
  	        <i class="fa-solid fa-people-roof"></i>
  	        <span class="text">가족/여성</span>
  	      </a>
  	    </li>
  	    <li :class="cate===8?'do_category_item active':'do_category_item'">
  	      <a class="dlink" @click="docate(8)">
  	        <i class="fa-solid fa-comments"></i>
  	        <span class="text">시민사회</span>
  	      </a>
  	    </li>
  	    <li :class="cate===9?'do_category_item active':'do_category_item'">
  	      <a class="dlink" @click="docate(9)">
  	        <i class="fa-solid fa-paw"></i>
  	        <span class="text">동물</span>
  	      </a>
  	    </li>
  	    <li :class="cate===10?'do_category_item active':'do_category_item'">
  	      <a class="dlink" @click="docate(10)">
  	        <i class="fa-solid fa-seedling"></i>
  	        <span class="text">환경</span>
  	      </a>
  	    </li>
  	    <li :class="cate===11?'do_category_item active':'do_category_item'">
  	      <a class="dlink" @click="docate(11)">
  	        <i class="fa-solid fa-ellipsis"></i>
  	        <span class="text">기타</span>
  	      </a>
  	    </li>
  	  </ul>
  	</div>
  	
  	<!-- 서브카테고리 -->
  	<div class="do_category_sublist" v-show="isShow">
  	  <ul class="do_category_supportlist">
  	  	<li :class="smallCateSelected==='1'?'do_category_subitem active':'do_category_subitem'">
  	  	  <input type="radio" value="1" v-model="smallCateSelected" id="category_support1" class="category_support_radio" @change="smallcateChange()">
  	  	  <label for="category_support1" class="category_support_label">전체</label>
  	    </li>
  	    <li :class="smallCateSelected==='2'?'do_category_subitem active':'do_category_subitem'">
  	      <input type="radio" value="2" v-model="smallCateSelected" id="category_support2" class="category_support_radio" @change="smallcateChange()">
  	      <label for="category_support2" class="category_support_label">문화예술</label>
  	    </li>
  	    <li :class="smallCateSelected==='3'?'do_category_subitem active':'do_category_subitem'">
  	      <input type="radio" value="3" v-model="smallCateSelected" id="category_support3" class="category_support_radio" @change="smallcateChange()">
  	      <label for="category_support3" class="category_support_label">교육지원</label>
  	    </li>
  	    <li :class="smallCateSelected==='4'?'do_category_subitem active':'do_category_subitem'">
  	      <input type="radio" value="4" v-model="smallCateSelected" id="category_support4" class="category_support_radio" @change="smallcateChange()">
  	      <label for="category_support4" class="category_support_label">연구조사</label>
  	    </li>
  	    <li :class="smallCateSelected==='5'?'do_category_subitem active':'do_category_subitem'">
  	      <input type="radio" value="5" v-model="smallCateSelected" id="category_support5" class="category_support_radio" @change="smallcateChange()">
  	      <label for="category_support5" class="category_support_label">건강한 삶</label>
  	    </li>
  	    <li :class="smallCateSelected==='6'?'do_category_subitem active':'do_category_subitem'">
  	      <input type="radio" value="6" v-model="smallCateSelected" id="category_support6" class="category_support_radio" @change="smallcateChange()">
  	      <label for="category_support6" class="category_support_label">생계안정</label>
  	    </li>
  	    <li :class="smallCateSelected==='7'?'do_category_subitem active':'do_category_subitem'">
  	      <input type="radio" value="7" v-model="smallCateSelected" id="category_support7" class="category_support_radio" @change="smallcateChange()">
  	      <label for="category_support7" class="category_support_label">주거/환경개선</label>
  	    </li>
  	    <li :class="smallCateSelected==='8'?'do_category_subitem active':'do_category_subitem'">
  	      <input type="radio" value="8" v-model="smallCateSelected" id="category_support8" class="category_support_radio" @change="smallcateChange()">
  	      <label for="category_support8" class="category_support_label">더 나은 사회</label>
  	    </li>
  	  </ul>
  	</div>
  	
    <br>
  
 	<!-- 목록출력 --> 
 	<div class="row">
        <div class="col-lg-4 mb-4" v-for="vo in do_list">
            <div class="card_form">
                <a :href="'../donation/donation_before_detail.do?dno='+vo.dno" class="img-link">
                    <img :src="vo.d_image" style=" width:266px; height: 150px; border-top-left-radius: 5px;border-top-right-radius: 5px">
                </a>
                <div class="card_content">
                    <h2 class="donaTitle"><a :href="'../donation/donation_before_detail.do?dno='+vo.dno">{{vo.d_title}}</a></h2>
                    <div class="card_bar">
                      <span class="card_bar_collection" :style="'width:'+vo.d_nowpercent+'%'"></span>
                    </div>
                    <strong class="card_percent">{{vo.d_nowpercent}}%</strong>
                    <span class="card_money">{{vo.d_goal}}원</span>
                </div>
            </div>
        </div>
    </div>
 	
			
	
	
	<!-- pagination -->
		
		<div class="text-center">
			<ul class="pagination">
			   <li v-if="startPage>1" class="page-item"><a class="dlink" @click="prev()">&laquo;</a></li>
          	   <li v-for="i in range(startPage,endPage)" :class="i===curpage?'active':''"><a class="dlink" @click="pageChange(i)">{{i}}</a></li>
          	   <li v-if="endPage<totalpage" class="page-item"><a class="dlink" @click="next()">&raquo;</a></li>
			</ul>
		</div>
		
  </div>
  </div>
  
  <!-- 리스트페이지 사이드바 -->
  <div class="col-sm-4" style="width: 25%;margin-left: 10px;margin-top: 88px;" id="donationListSideApp">
  				<div class="sidebar-box search-form-wrap mb-4">
						<form action="#" class="sidebar-search-form">
							<input type="text" size=25 id="s" class="input-lg" placeholder="검색어를 입력하세요">
							<span style="margin-left: 15px;"><a class="dlink"><i class="fa-solid fa-magnifying-glass"></i></a></span>
						</form>
					</div>
					<!-- END sidebar-box -->
					<div class="sidebar-box">
						<h3 class="heading">최근 방문한 캠페인</h3>
						<div class="post-entry-sidebar">
							<ul>
								<li v-for="cvo in cookie_list">
									<a :href="'../donation/donation_detail.do?dno='+cvo.dno">
										<img :src="cvo.d_image" class="rounded" style="width: 110px;height: 80px;">
										<div class="text" style="margin-left: 5px;">
											<h6>{{cvo.d_title}}</h6>
											<div class="post-meta">
												<span class="mr-2">목표:{{cvo.d_goal}}원</span>
											</div>
										</div>
									</a>
								</li>
							</ul>
						</div>
					</div>
					<!-- END sidebar-box -->
					<!-- END sidebar-box -->
					<div class="sidebar-box">
						<h3 class="heading">추천 캠페인</h3>
						<div class="post-entry-sidebar">
							<ul>
								<li v-for="recvo in recommend_list">
									<a :href="'../donation/donation_detail.do?dno='+recvo.dno">
										<img :src="recvo.d_image" class="rounded" style="width: 110px;height: 80px;">
										<div class="text" style="margin-left: 5px;">
											<h6>{{recvo.d_title}}</h6>
											<div class="post-meta">
												<span class="mr-2">목표:{{recvo.d_goal}}원</span>
											</div>
										</div>
									</a>
								</li>
							</ul>
						</div>
					</div>
					<!-- END sidebar-box -->

  </div>
  
<!-- vue -->
<script>
  let doApp=Vue.createApp({
	  data(){
		 return{
			 do_list:[],
			 curpage:1,
			 totalpage:0,
			 startPage:0,
			 endPage:0,
			 cate:1,
			 smallCateSelected:'1',
			 isShow:false
		 }  
	  },
	  mounted(){
		 this.doRecv()
	  },
	  methods:{
		  doRecv(){
			  axios.get('../donation/donation_list_vue.do',{
				  params:{
					  page:this.curpage,
					  cateno:this.cate,
					  smallcateno:this.smallCateSelected
					  
				  }
			  }).then(res=>{
				  console.log(res.data)
				  this.do_list=res.data.list
				  this.curpage=res.data.curpage
				  this.totalpage=res.data.totalpage
				  this.startPage=res.data.startPage
				  this.endPage=res.data.endPage
			  })
			  
			 
		  },
		  range(start,end){
				let arr=[]
				let len=end-start
				for(let i=0;i<=len;i++){
					arr[i]=start++
				}
				return arr
			},
			prev(){
				this.curpage=this.startPage-1
				this.doRecv()
			},
			next(){
				this.curpage=this.endPage+1
				this.doRecv()
			},
			pageChange(page){
				this.curpage=page
				this.doRecv()
			},
			docate(ca){
				if(ca===1){
					this.cate=ca
					this.isShow=false
					this.doRecv()
				}else{
					this.cate=ca
					this.smallCateSelected='1'
					this.isShow=true
					this.doRecv()
				}
			},
			smallcateChange(){
				this.curpage=1
				this.doRecv()
			}
			
	  }
  }).mount('#donationList')
  
  let donationListSideApp=Vue.createApp({
	  data(){
		return{
			cookie_list:[],
			recommend_list:[]
		}  
	  },
	  mounted(){
		  axios.get('../donation/donation_cookie_vue.do').then(res=>{
			  console.log(res.data)
			  this.cookie_list=res.data
		  })
		  
		  axios.get('../donation/donated_max_category_vue.do').then(resp=>{
			  console.log(resp.data)
			  this.recommend_list=resp.data
		  })
	  }
  }).mount('#donationListSideApp')
</script>
</body>
</html>