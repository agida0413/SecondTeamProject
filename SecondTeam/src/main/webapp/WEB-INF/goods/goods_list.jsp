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
<div class="container" id="goodsList" style="margin-top: 50px;">
    <div class="row mb-4">
        <div class="col-sm-6">
            <h2 class="posts-entry-title">제품별 쇼핑</h2>
        </div>
        <div class="col-sm-6 text-sm-end"><a href="../main/main.do" class="read-more">Main Home</a></div>
    </div>
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
						<input type="button" class="form-control" style="width: 150px; height: 40px;" value="라이프스타일" @click="CateListChange('라이프스타일')"> 
						<input type="button" class="form-control" style="width: 105px; height: 40px;" value="패션" @click="CateListChange('패션')"> 
						<input type="button" class="form-control" style="width: 105px; height: 40px;" value="식품" @click="CateListChange('식품')"> 
						<input type="button" class="form-control" style="width: 125px; height: 40px;" value="출산/유아동" @click="CateListChange('출산/유아동')"> 
						<input type="button" class="form-control" style="width: 105px; height: 40px;" value="반려동물" @click="CateListChange('반려동물')">
					</div>
				</div>
				<div class="goodsCateMinor" style="text-align: left;">
   				 <template v-for="vo in cateminor_list">
       				 <div v-if="vo.category_minor !== null" style="display: inline-block;">
           				 <input type="button" class="form-control" style="width: 200px; height: 40px;" :value="vo.category_minor"> 
      				 </div>
  			    </template>
</div>
			</div>
		</form>
    <div class="row" v-if="category === '전체' && goods_list.length !== 0">
        <div class="col-lg-4 mb-4" v-for="(vo, index) in goods_list" :key="index">
            <div class="post-entry-alt">
                <a href="#" class="img-link">
                    <img :src="vo.g_img" alt="Image" class="img-fluid">
                </a>
                <div class="excerpt">
                	<template v-for="(img, imgIndex) in vo.type_img.split(',')">
                      <img v-if="imgIndex < 2" :src="img" alt="Image" class="img-fluid spaced-img" :key="imgIndex" style=" margin-right: 10px;">
             	   </template>
                    <h2 style="font-weight: bold"><a href="single.html">{{vo.g_name}}</a></h2>
                    <span style="font-size: 20px;font-weight: bold">{{vo.g_price}}</span>
                </div>
            </div>
        </div>
    </div>
    <div class="row" v-if="category === '전체' && goods_list.length === 0">
       <div style="margin: 50px 0 230px 0">
       <span>검색 조건에 해당하는 상품이 없습니다.</span>
       </div>
    </div>
    <div class="row" v-if="category !== '전체' && find_list.length !== 0">
        <div class="col-lg-4 mb-4" v-for="(fvo, index) in find_list" :key="index">
            <div class="post-entry-alt">
                <a href="#" class="img-link">
                    <img :src="fvo.g_img" alt="Image" class="img-fluid">
                </a>
                 <div class="excerpt">
                	<template v-for="(img, imgIndex) in fvo.type_img.split(',')">
                      <img v-if="imgIndex < 2" :src="img" alt="Image" class="img-fluid spaced-img" :key="imgIndex" style=" margin-right: 10px;">
             	   </template>
                   <h2 style="font-weight: bold"><a href="single.html">{{fvo.g_name}}</a></h2>
                    <span style="font-size: 20px;font-weight: bold">{{fvo.g_price}}</span>
                </div>
            </div>
        </div>
    </div>
    <div class="row" v-if="category !== '전체' && find_list.length === 0">
       <div style="margin: 50px 0 230px 0">
       <span>검색 조건에 해당하는 상품이 없습니다.</span>
       </div>
    </div>
    <div class="row">
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
<script src="../js/goodslist.js"></script>
</body>
</html>