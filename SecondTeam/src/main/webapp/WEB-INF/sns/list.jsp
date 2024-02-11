<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
  cursor:pointer;
  text-align: center;
  margin-bottom: 20px;
  padding-bottom: 10px;
  border-bottom: 1px solid #e6e6e6;"
}
</style>
</head>
<body>
	<div class="container" style="margin-top: 50px;">
	   <div class="row">
	    <div class="col-md-1" id="id_list">
	      <h3 class="heading"
	      style="font-size: 18px; text-align:center;
   				 color: #000;
   				 font-weight: 400;
   				 margin-bottom: 30px;
   				 padding-bottom: 20px;
   				 border-bottom: 1px solid #e6e6e6;">추천목록</h3>
	       <div class="post-entry-sidebar follow_id_list" v-for="(vo,index) in id_list">
	          <i class="xi-profile"></i><br>
	          <span class="date"><i class="xi-at"></i>{{vo.id}}</span><br>
	          <span class="date">{{vo.name}}</span>
	       </div>
	    </div>
		<div class="col-md-7" style="display: flex; flex-flow: column;">
		   <div class="blog-entry">
			<div style="display: flex; justify-content: space-between;">
				<div style="display: flex;">
					<i class="xi-profile"></i> &nbsp;
					<div>
						<span class="date">아이디명</span><br> 
						<span class="date">Apr.14th, 2022</span>
					</div>
				</div>
				<div>
					<ul>
					  <li class="has-children">
					    <a href="category.html" id="menuLink">menu</a>
					    <ul class="dropdown" id="submenu">
					      <li><a href="#">삭제</a></li>
					      <li><a href="#">수정</a></li>
					    </ul>
					  </li>
					</ul>
				</div>
			</div>
			<p>
				<img src="../images/img_2_sq.jpg" alt="Image" class="img-fluid"
				style="width: 100%; height: 500px;">
			</p>
			<p>
			    <span>좋아요</span>
			    <span>찜하요</span>
			    <span>신고하기</span>
			</p>
			<h6>
				<a href="single.html">Startup vs corporate: What job suits you
					best?</a>
			</h6>
			<p class="title">Lorem ipsum dolor sit amet consectetur adipisicing elit. Unde,
				nobis ea quis inventore vel voluptas.</p>
		</div>
		</div>
    <div class="col-md-4" id="sns_keep">
         <div class="sidebar-box">
            <h3 class="heading">임시보호 반려동물</h3>
            <div class="post-entry-sidebar">
              <ul>
                <li v-for="(vo,index) in list_keep" class="page-link"
                style="display: flex; padding: 10px 0 5px 10px; border-radius: 10px;" >
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
                      </div>
                    </div>
                </li>
              </ul>
            </div>
          </div>
    </div>
		</div><!-- row -->
	</div><!-- container -->
	
	<script>
document.addEventListener("DOMContentLoaded", function() {
  // 메뉴 링크 요소 가져오기
  var menuLink = document.getElementById("menuLink");

  // 서브 메뉴 요소 가져오기
  var submenu = document.getElementById("submenu");

  // 메뉴 링크 클릭 이벤트 처리
  menuLink.addEventListener("click", function(event) {
    // 기본 링크 동작 방지
    event.preventDefault();

    // 서브 메뉴가 보이는지 확인
    var isVisible = submenu.classList.contains("show");

    // 서브 메뉴가 보이지 않으면 표시, 보이면 숨기기
    if (!isVisible) {
      submenu.classList.add("show");
    } else {
      submenu.classList.remove("show");
    }
  });
});
</script>
<script>
  let sns_keep=Vue.createApp({
	  data(){
		  return{
			  list_keep:[]
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
		  }
	  }
  }).mount('#sns_keep')
</script>
<script>
  let id_list=Vue.createApp({
	  data(){
		  return{
			  id_list:[]
		  }
	  },
	  mounted(){
		  this.dataRecv()
	  },
	  methods:{
		  dataRecv(){
			  axios.get('../sns/list_id_vue.do').then(res=>{
				  console.log(res.data)
				  this.id_list=res.data
			  })
		  }
	  }
  }).mount('#id_list')
</script>
</body>
</html>