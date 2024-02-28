<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrapper row3" id="buyokApp">
		<main class="container clear">
			<h2 class="sectiontitle">구매승인내역</h2>
			<table class="table" style="text-align: center">
			<tr>
				<th>아이디</th>
				<th>상품번호</th>
				<th>상품명</th>
				<th>상품가격</th>
				<th>주문수량</th>
				<th>주문금액</th>
				<th>결제일자</th>
			</tr>
			<tr v-for="vo in buy_list">
				<td>{{vo.userid}}</td>
				<td>{{vo.gvo.gno}}</td>
				<td>{{vo.gvo.g_name}}</td>
				<td>{{vo.gvo.g_price}}</td>
				<td>{{vo.cart_count}}</td>
				<td>{{(vo.price*vo.cart_count).toLocaleString()}}</td>
				<td>{{vo.dbday}}</td>
				<td>
   					<button class="form-control" v-if="vo.buy_state=='order'" style="width: 90px;"  @click="ok(vo.gcno)">승인대기</button>
   					<button class="form-control" v-if="vo.buy_state!='order'">승인완료</button>
				</td>
			</tr>
			</table>
			<nav class="pagination">
        <ul>
          <li v-if="startpage>1"><a @click="prev()" class="link">&laquo; Previous</a></li>
          <li v-for="i in range(startpage,endpage)" :class="i===curpage?'current':''"><a @click="pagechange(i)" class="link">{{i}}</a></li>
          <li v-if="endpage<totalpage"><a @click="next()" class="link">Next &raquo;</a></li>
        </ul>
      </nav>
		</main>
	</div>
	<script>
	let buyokApp=Vue.createApp({
		data(){
			return{
				buy_list:[],
				curpage:1,
				totalpage:0,
				startpage:0,
				endpage:0,
				buy_state:'',
				g_img:'',
				g_name:'',
				recipient:'',
				g_price:'',
				buy_count:'',
				cartprice:'',
				dbday:''
				
			}
		},
		mounted(){
			this.buyList()
		},
		methods:{
			buyList(){
				axios.get("../adminPage/buylist_vue.do", {
					params:{
						page:this.curpage
					}
				}).then(res=>{
					console.log(res.data)
					this.buy_list=res.data
				})
				
				axios.get("../adminPage/buypage_vue.do",{
					params:{
						page:this.curpage
					}
				}).then(res=>{
					console.log(res.data)
					this.curpage=res.data.curpage
					this.startpage=res.data.startpage
					this.totalpage=res.data.totalpage
					this.endpage=res.data.endpage
				})	
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
				this.buyList()
			},
			next(){
				this.curpage=this.endpage+1
				this.dataRecv()
			},
			pagechange(page){
				this.curpage=page
				this.buyList()
			},
			ok(gcno) {
				axios.get("../adminPage/buyok_vue.do",{
					params:{
						gcno:gcno
					}
				}).then(res=>{
					this.buy_list=res.data
					this.buyList()
				})
			   
			}
	    }
	}).mount("#buyokApp")
	</script>
</body>
</html>