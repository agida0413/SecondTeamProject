<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<div class="container" id="goodsList" style="margin-top: 50px;">
    <div class="row mb-4">
        <div class="col-sm-6">
            <h2 class="posts-entry-title">전체 상품</h2>
        </div>
        <div class="col-sm-6 text-sm-end"><a href="../main/main.do" class="read-more">Main Home</a></div>
    </div>
    <form @submit.prevent="listChange()">
	<div class="text-end">
			<select v-model="category" class="input-sm" @change="CateListChange">
				<option value="전체">전체</option>
				<option value="뷰티">뷰티</option>
				<option value="라이프스타일">라이프스타일</option>
				<option value="패션">패션</option>
				<option value="식품">식품</option>
				<option value="출산/유아동">출산/유아동</option>
				<option value="반려동물">반려동물</option>	
			</select>
			<div style="position: relative;">
							<input type="text" class="form-control" placeholder="Search..."
								ref="ss" v-model="ss" @keyup.enter="search()"
								style="background-color: black;"> 
								<button class="bi bi-search" 
								style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%);" @click="search()"
								></button>
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