<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://unpkg.com/vue@3"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.aLink{
cursor:pointer;
}
</style>
</head>
<body>
<ul class="list-group" id="mypageApp">
  <li class="list-group-item" style="font-size:40px; padding:25px; font-weight:bold;">마이페이지</li>
  
<a href="../myAndAdpage/mypage.do"> <li class="list-group-item ${cate == 'inform' ? 'active' : ''}" style="padding: 18px;">개인정보</li></a>

  
  <a href="../myAndAdpage/programHistory.do?state=WAIT"><li class="list-group-item ${cate == 'programHistory' ? 'active' : ''}" style="padding:18px;">봉사프로그램 신청현황</li></a>
  <a href="../myAndAdpage/programCertify.do?state=COMPLETE"><li class="list-group-item ${cate == 'programCertify' ? 'active' : ''}" style="padding:18px;">봉사완료프로그램 인증신청</li></a>
   <a href="../myAndAdpage/programwishList.do"><li class="list-group-item ${cate == 'wishlist' ? 'active' : ''}" style="padding:18px;">봉사프로그램 관심목록</li></a>
   <a class="aLink" @click="centerCheck()"><li class="list-group-item ${cate == 'centerProgram' ? 'active' : ''}" style="padding:18px;">센터's 프로그램</li></a>
 
  <a href="../myAndAdpage/donClassWishList.do"> <li class="list-group-item ${cate == 'classWishList' ? 'active' : ''}" style="padding:18px;">원데이 클래스 관심목록</li></a>
  <a href="../myAndAdpage/classResHistory.do"> <li class="list-group-item ${cate == 'classHistory' ? 'active' : ''}" style="padding:18px;">원데이 클래스 예약내역</li></a>
	 <a href="../myAndAdpage/myclass.do"> <li class="list-group-item ${cate == 'myclass' ? 'active' : ''}" style="padding:18px;">나의 원데이클래스</li></a>
	  <a href="../myAndAdpage/myclassResHistory.do"> <li class="list-group-item ${cate == 'myclassResHistory' ? 'active' : ''}" style="padding:18px;">나의 원데이클래스 예약관리</li></a>
	 <a href="../myAndAdpage/wishgoods.do"> <li class="list-group-item" style="padding:18px;">상품 위시리스트</li></a>
</ul>


<script>
let myPageApp=Vue.createApp({
	data(){
		return{
		centername:'${sessionScope.centername}'	
		}
	},
	methods:{
		centerCheck(){
			if(this.centername===''){
				alert('센터회원만 이용가능합니다.')
				return;
			}else{
				location.href="../myAndAdpage/centerProgram.do"
			}	
		}
	}
}).mount('#mypageApp')
</script>
</body>
</html>