<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row .my_buy{
	width: 800px;
	margin: 20px 0 0 30px;
}

.mybuy_table {
	width: 890px;
	margin: 0 0 50px 10px;
}

.mybuy_table td {
	height: 130px;
}

.mybuy_table tr {
	border-bottom: 1px solid #f2f2f2;
}

.myship_table {
	width: 890px;
	margin-bottom: 150px;
}

.myship_table th {
	border-bottom: 1px solid #f2f2f2;
}
</style>
</head>
<body>
<div class="conatiner" id="buyListApp">
		<div class="row my_buy" style="flex: center;">
			<h4 class="text-center">&nbsp;상품 결제내역</h4>
			<div class="buyList" v-if="buy_list.length>0">
			<table class="mybuy_table" style="margin-top: 20px;" v-for="vo in buy_list">
				<tr>
					<th class="text-center" width="15%"></th>
					<th class="text-center" width="25%" style="text-align: center">상품명</th>
					<th class="text-center" width="10%">수량</th>
					<th class="text-center" width="10%">결제금액</th>
					<th class="text-center" width="15%">결제일자</th>
					<th class="text-center" width="15%">배송상태</th>
					<th class="text-center" width="10%">결제상태</th>
				</tr>
							<tr>
								<td class="text-center"><a href="#"><img
										:src="vo.gvo.g_img" style="width: 150px; height: 150px"></a>
								</td>
								<td>{{vo.gvo.g_name}}</td>
								<td class="text-center" width="80px;">{{vo.cart_count}}개</td>
								<td class="text-center" width="80px;">{{(vo.cart_count*vo.price).toLocaleString()}}</td>
								<td class="text-center" width="80px;">{{vo.dbday}}</td>
								<td class="text-center" width="80px;">
								<span v-if="vo.buy_state=='order'">결제승인대기</span>
								<span v-if="vo.buy_state=='buyOk'">배송중</span>
								</td>
								<td>

							<button class="form-control" v-if="vo.buy_state=='order'"
								style="width: 100px; height: 40px;" @click="buyCancel(vo.gcno)">결제취소</button>
							<button class="form-control" v-if="vo.buy_state=='buyOk'"
								style="width: 100px; height: 40px;" @click="noCancel()">결제완료</button>
					</td>
					</tr>
					<tr>
							<th>배송정보</th>
						</tr>
						<tr>
							<td class="text-left" style="height: 20px;">{{vo.recipient}}</td>
						</tr>
						<tr>
							<td class="text-left" style="height: 20px; width: 360px;" colspan="6">{{vo.buy_addr1}}</td>
						</tr>
						<tr>
							<td class="text-left" style="height: 20px; width: 360px;" colspan="6">{{vo.buy_addr2}}</td>
						</tr>
						<tr>
							<td class="text-left" style="height: 20px; width: 30px">{{vo.phone}}</td>
						</tr>
						<tr>
							<td class="text-left" colspan="6" style="height: 20px;">{{vo.buy_request}}</td>
						</tr>
			</table>
			
		</div>
		<div class="text-center" >
                    <div style="margin:70px 0 150px" v-if="buy_list.length==0">
                    <span>구매내역이 존재하지 않습니다</span>
                    </div>
                    </div>
		</div>
	</div>
	<script>
	let buyListApp=Vue.createApp({
		data(){
			return{
					buy_list:[],
					userid:''
				}
		},
		mounted(){
			this.buyList()
		},
		methods:{
			buyList(){
				axios.get('../myAndAdpage/buylist_vue.do').then(res=>{
					console.log(res.data)
					this.buy_list=res.data
					this.userid=this.buy_list[0].userid
					console.log(this.userid)
				})
			},
			buyCancel(gcno){
				axios.get("../myAndAdpage/buyCancel_vue.do",{
					params:{
    					gcno:gcno,
    					userid:this.userid
    				}
				}).then(res=>{
    				console.log(res.data)
    				this.buy_list=res.data
    				alert("주문이 취소되었습니다")
    				
    			})
			},
			noCancel(){
				alert("상품이 배송중이므로 결제 취소 불가합니다")
			}
		}
	}).mount("#buyListApp")
	</script>
</body>
</html>