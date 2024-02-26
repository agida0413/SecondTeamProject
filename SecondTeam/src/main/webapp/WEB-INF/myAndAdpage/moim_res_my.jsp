<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.btn-default{
   background-color: #c8c8c8;
   cursor: pointer;
}
</style>
</head>
<body>
	<div class="wrapper row3" id="moim_res">
		<main class="container clear">
			<h2 class="sectiontitle">예약목록</h2>
			
			<table class="table">
			   <tr>
			      <th>번호</th>
			      <th></th>
			      <th>상호명</th>
			      <th>날짜</th>
			      <th>시간</th>
			      <th>인원</th>
			      <th>상태</th>
			   </tr>
			   <tr v-for="vo in reserve_list">
			      <td>{{vo.mno}}</td>
			      <td>
			         <img :src="vo.mvo.img"
			         style="width: 50px; height: 30px;"
			         >
			      </td>
			      <td>{{vo.mvo.loc}}</td>
			      <td>{{vo.rdate}}</td>
			      <td>{{vo.rtime}}</td>
			      <td>{{vo.rinwon}}</td>
			      <td>
			         <span :class="vo.reserve_ok==0?'btn btn-xs':'btn-default btn-xs'" v-text="vo.reserve_ok==0?'예약대기':'예약완료'"></span>
			         <span class="btn-default btn-xs" @click="reserveCancel(vo.mno)">취소</span>
			      </td>
			   </tr>
			</table>
		</main>
	</div>
		<script>
	let moim_res=Vue.createApp({
		data(){
			return{
				reserve_list:[],
			}
		},
		mounted(){
			axios.get('../moim/mypage_list_vue.do')
			.then(res=>{
				console.log(res.data)
				this.reserve_list=res.data
			})
			.catch(error => {
	            console.error('Axios 요청 오류:', error);
	        });
		},
		methods:{
			//찜하기 취소할때 이렇게 만들어주면됨~!~!~!
			reserveCancel(mno){
				axios.get('../moim/reserve_cancel_vue.do',{
					params:{
						mno:mno
					}
				}).then(res=>{
					console.log(res.data)
					if(res.data=='yes')
					{
						axios.get('../moim/mypage_list_vue.do')
						.then(res=>{
							console.log(res.data)
							this.reserve_list=res.data
						})
					}
					else
					{
						alert("예약 취소 실패하셨습니다.\n 다시 취소 부탁드립니다.");
					}
				})
			}
		}
	}).mount("#moim_res")
	</script>
</body>
</html>