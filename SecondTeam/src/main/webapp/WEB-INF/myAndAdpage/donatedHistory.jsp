<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div><span style="font-weight:bold; font-size:30px; color:black;">캠페인 후원 현황</span></div>
  <hr>
<div class="container" id="donatedHistoryApp">
  <table class="table table-striped">
    <thead>
      <tr>
        <th>캠페인 소개</th>
        <th>캠페인 기간</th>
        <th>후원금액</th>
        <th>현재 모금액</th>
        <th>목표 모금액</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="(vo,index) in history_list">
        <td>{{vo.dvo.d_title}}</td>
        <td>{{vo.dvo.d_startdate}}~{{vo.dvo.d_enddate}}</td>
        <td>{{now_price[index]}}</td>
        <td>{{now_data[index]}}</td>
        <td>{{vo.dvo.d_goal}}</td>
      </tr>
    </tbody>
  </table>
</div>
</body>
<script>
  let donatedHistoryApp=Vue.createApp({
	  data(){
		return{
			history_list:[],
			now_data:{},
			now_price:{}
		}  
	  },
	  mounted(){
		  axios.get('../donation/donation_donated_history_vue.do').then(res=>{
			  console.log(res.data)
			  this.history_list=res.data.list
			  this.now_data=res.data.nowList
			  this.now_price=res.data.priceList
		  })
	  }
  }).mount('#donatedHistoryApp')
</script>
</html>