<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .myres_table {
        border-collapse: collapse;
        width: 100%;
        font-size: 16px; 
    }
    .myres_table th, .myres_table td {
        border-bottom: 1px solid #ddd;
        padding: 10px;
        text-align: center; 
    }
</style>
</head>
<body>
<div class="conatiner" id="donresApp">
<div class="row my_res">
<div class="row">
<h4 class="text-left" style="font-weight: bold">&nbsp;기부스토어 예약내역</h4>
 <div class="donres" v-if="donres_list.length>0">
 <table class="myres_table" style="margin-top: 20px; text-align: center" v-for="vo in donres_list">
  
   <tr>
    <th class="text-center">예약스토어</th>
    <th class="text-center">스토어번호</th>
    <th class="text-center">일자</th>
    <th class="text-center">시간</th>
    <th class="text-center">주소</th>
    <th class="text-center">인원</th>
    <th></th>
   </tr>
	<tr>
	<td>{{vo.dvo.name}}</td>
	<td>{{vo.dvo.phone}}</td>
	<td>{{vo.dbday}}</td>
	<td>{{vo.don_restime}}</td>
	<td>{{vo.dvo.address}}</td>
	<td>{{vo.don_resinwon}}</td>
	<td>
	<button class="form-control"
	style="width: 100px; height: 40px;" @click="resCancel(vo.dresno)">예약취소</button>
	</td>
	</tr>
	
 </table>
 </div>
  <div class="text-center" >
                    <div style="margin:170px 0 150px" v-if="donres_list.length==0">
                    <span>예약내역이 존재하지않습니다</span>
                    </div>
                    </div>
 </div>
 </div>
 </div>
 <script>
let donresApp=Vue.createApp({
	data(){
		return{
			donres_list:[]
		}
	},
	mounted(){
		this.donres()
	},
	methods:{
		donres(){
			axios.get("../myAndAdpage/donres_vue.do").then(res=>{
				console.log(res.data)
				this.donres_list=res.data
			})
		},
		resCancel(dresno){
			axios.get("../myAndAdpage/donres_cancel_vue.do",{
				params:{
					dresno:dresno
				}
			}).then(res=>{
				
				alert("기부스토어 방문 예약이 취소되었습니다")
				this.donres_list=res.data
				this.donres()
			})
		}
	}
}).mount("#donresApp")
 </script>
</body>
</html>