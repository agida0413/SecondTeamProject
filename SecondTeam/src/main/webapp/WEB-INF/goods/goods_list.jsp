<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
#goodsSearch:hover{
cursor: pointer;
}
#goodsSearch{
margin-right: 10px;
}
</style>
</head>
<body>
<div class="section search-result-wrap">
<div class="container" id="goodsList" style="margin-top: 20px;" >
    <div class="row mb-4">
        <div class="col-sm-6">
            <h2 class="posts-entry-title">제품별 쇼핑</h2>
        </div>
        <div class="col-sm-3 text-sm-end"><a href="../main/main.do" class="read-more">Main Home</a></div>
    </div>
    <div class="row posts-entry">
    <div class="col-lg-9">
    <form @submit.prevent="listChange()">
			<div class="text-end">
				<div style="position: relative;">
					<input type="text" class="form-control" placeholder="Search..."
						ref="ss" v-model="ss" @keyup.enter="search()"
						style="background-color: black;"> <span
						class="bi bi-search" id="goodsSearch"
						style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%);"
						@click="search()"></span>
				</div>
				<div class="goodsCate" v-model="category">
					<div class="row" style="display: flex; margin-left: 2px;">
						<input type="button" class="form-control" style="width: 105px; height: 40px;" value="전체" @click="CateListChange('전체')"> 
						<input type="button" class="form-control" style="width: 105px; height: 40px;" value="뷰티" @click="CateListChange('뷰티')"> 
						<input type="button" class="form-control" style="width: 160px; height: 40px;" value="라이프스타일" @click="CateListChange('라이프스타일')"> 
						<input type="button" class="form-control" style="width: 105px; height: 40px;" value="패션" @click="CateListChange('패션')"> 
						<input type="button" class="form-control" style="width: 105px; height: 40px;" value="식품" @click="CateListChange('식품')"> 
						<input type="button" class="form-control" style="width: 130px; height: 40px;" value="출산/유아동" @click="CateListChange('출산/유아동')"> 
						<input type="button" class="form-control" style="width: 115px; height: 40px;" value="반려동물" @click="CateListChange('반려동물')">
					</div>
				</div>
				<div class="goodsCateMinor" style="text-align: left;">
   				 <template v-for="vo in cateminor_list">
       				 <div v-if="vo.category_minor !== null" style="display: inline-block;">
           				 <input type="button" class="form-control" style="width: 180px; height: 40px;" :value="vo.category_minor"
           				  @click="selectCateMinor(vo.category_minor)"> 
      				 </div>
  			    </template>
				</div>
			</div>
		</form>
			<div class="row" v-if="category === '전체' && goods_list.length !== 0">
						<div class="col-lg-4 col-md-4" v-for="(vo, index) in goods_list"
							:key="index">
							<div class="post-entry-alt" style="width: 300px; height: 300px;">
								<div class="goodsimsg">
								<a :href="'../goods/goods_before_detail.do?gno='+vo.gno">
									 <img :src="vo.g_img"
									class="img-fluid" style="width: 100%; height: 100%;">
									</div>
								</a>
							</div>
							<div class="excerpt" style="margin-top: 20px;">
									<template v-for="(img, imgIndex) in vo.type_img.split(',')">
										<img v-if="imgIndex < 2" :src="img" alt="Image"
											class="img-fluid spaced-img" :key="imgIndex"
											style="margin-right: 10px; width: 100px; height: 30px;">
									</template>
								</div>
							<span style="font-weight: bold; white-space: prewarp; font-size: 18px;">
							 <a href="single.html">{{vo.g_name}}</a>
							</span><br> <span style="font-size: 20px; font-weight: bold">{{vo.g_price}}</span>
						</div>
					</div>
			<div class="row" v-if="category === '전체' && goods_list.length === 0">
				<div style="margin: 50px 0 230px 0">
					<span>검색 조건에 해당하는 상품이 없습니다.</span>
				</div>
			</div>
			<div class="row" v-if="category !== '전체' && find_list.length !== 0">
				<div class="col-lg-4 col-md-4" v-for="(fvo, index) in find_list"
					:key="index">
					<div class="post-entry-alt" style="width: 300px; height: 300px;">
						<a :href="'../goods/goods_before_detail.do?gno='+fvo.gno"
							class="img-link"> <img :src="fvo.g_img" style="width: 300px;height: 300px;">
						</a>
						</div>
						<div class="excerpt">
							<template v-for="(img, imgIndex) in fvo.type_img.split(',')">
								<img v-if="imgIndex < 2" :src="img" alt="Image"
									class="img-fluid spaced-img" :key="imgIndex"
									style="margin-right: 10px;">
							</template>
						</div>
					<span style="font-weight: bold; white-space: prewarp; font-size: 18px;">
								<a href="single.html">{{fvo.g_name}}</a>
							</span>
							<br>
							<span style="font-size: 20px; font-weight: bold">{{fvo.g_price}}</span>
				</div>
			</div>
			<div class="row" v-if="category !== '전체' && find_list.length === 0">
				<div style="margin: 50px 0 230px 0">
					<span>검색 조건에 해당하는 상품이 없습니다.</span>
				</div>
			</div>
			  <div class="row" style="margin: 50px 0 -50px 0;">
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
		 <div class="col-lg-3 sidebar">
					<div class="sidebar-box">
						<h3 class="heading" style="font-weight: bold">최근 본 상품</h3>
						<div class="post-entry-sidebar" v-if="cookie_list.length!==0">
							<div class="cookie" v-for="vo in cookie_list" :key="index">
								<div class="post-entry-alt">
									<a :href="'../goods/goods_detail.do?gno='+vo.gno"
										class="img-link"> <img :src="vo.g_img" alt="Image"
										class="img-fluid">
									</a>
								</div>
							</div>
						</div>
						<div class="post-entry-sidebar" v-else>
							<span>최근 조회한 상품이 없습니다</span>
						</div>
					</div>
				</div>
  				
			</div>
		</div>
	</div>
<script>
let goodsList=Vue.createApp({
	data(){
		return{
			goods_list:[],
			find_list:[],
			curpage:1,
			totalpage:0,
			startpage:0,
			endpage:0,
			category:'전체',
			ss:'',
			cateminor_list:[],
			category_minor:'',
			cookie_list:[]
		}
	},
	mounted(){
		this.dataRecv()
	},
	methods:{
		dataRecv(){
			axios.get("../goods/goods_list_vue.do",{
				params:{
					page:this.curpage,
					ss: this.ss
				}
			}).then(res=>{
				console.log(res.data)
				this.goods_list=res.data
			})
			axios.get("../goods/page_vue.do",{
            	params:{
            		page:this.curpage,
            		ss: this.ss
            	}
            }).then(res=>{
            	this.curpage=res.data.curpage
            	this.startpage=res.data.startpage
            	this.endpage=res.data.endpage
            	this.totalpage=res.data.totalpage
            })
            axios.get("../goods/goods_cookie_vue.do").then(res=>{
				console.log("cookie:"+res.data)
				this.cookie_list=res.data
			})
         
        },
        CateListChange(category) {
        	this.ss = ''
        	this.category = category
        	if (category === '전체') {
                this.curpage = 1
                this.cateminor_list=[]
                this.dataRecv()
            } else {
                this.curpage = 1
                this.cateMinorChange()
                this.listChange()
            }
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
			if (this.category === '전체') {
	            this.dataRecv();
	        } else {
	            this.listChange();
	        }
		},
		change(page){
			this.curpage=page
			if (this.category === '전체') {
	            this.dataRecv();
	        } else {
	            this.listChange();
	        }
		},
		next(){
			this.curpage=this.endpage+1
			if (this.category === '전체') {
	            this.dataRecv();
	        } else {
	            this.listChange();
	        }
		},
		listChange() {
		    if (this.category !== '전체') {
		        axios.get("../goods/goods_category_list_vue.do", {
		            params: {
		                page: this.curpage,
		                category: this.category,
		                ss: this.ss,
		                category_minor: this.category_minor
		            },
		            headers: {
		                'Content-Type': 'application/json;charset=UTF-8'
		            }
		        }).then(res => {
		            console.log(this.category);
		            console.log("c:", res.data); 
		            this.find_list = res.data;
		            axios.get("../goods/goods_category_page_vue.do", {
		                params: {
		                    page: this.curpage,
		                    category: this.category,
		                    ss: this.ss,
		                    category_minor: this.category_minor
		                }
		            }).then(res => {
		                this.curpage = res.data.curpage;
		                this.startpage = res.data.startpage;
		                this.endpage = res.data.endpage;
		                this.totalpage = res.data.totalpage;
		            }).catch(error => {
		                console.error('error:', error);
		            });
		        }).catch(error => {
		            console.error('error:', error);
		        });
		    } else {
		        this.dataRecv();
		    }
		},
		//카테고리 소분류 리스트 체인지
		cateMinorChange() {
		    if (this.category !== '전체') {
		        axios.get("../goods/goods_cateminor_list_vue.do", {
		            params:{
		                category: this.category,
		            },
		            headers: {
		                'Content-Type': 'application/json;charset=UTF-8'
		            }
		        }).then(res => {
		            console.log(this.category);
		            console.log("c:", res.data); 
		            this.cateminor_list = res.data;
		        }).catch(error => {
		            console.error('error:', error);
		        });
		    } else {
		        this.dataRecv();
		    }
		},
		//상품 목록 체인지
		selectCateMinor(category_minor){
		    console.log("cateminor:"+this.category_minor)
		    console.log(this.find_list)
		    this.category=''
		    this.category_minor=category_minor
		    this.curpage = 1
		    this.listChange()
		},
		 search(){
				let sss=this.$refs.ss.value;
				if (this.category === '전체') {
		            this.dataRecv();
		        } else {
		            this.listChange();
		        }
		}
        
	  }
}).mount("#goodsList")
</script>
</body>
</html>