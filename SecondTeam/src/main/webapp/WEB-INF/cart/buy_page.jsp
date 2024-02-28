<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="https://img.f-ridge.com/_data/favicon/favicon_1692850256.ico">
<link rel="apple-touch-icon" href="https://img.f-ridge.com/_data/favicon/favicon_1692850256.ico">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<style type="text/css">
#buyApp {
	margin: 50px 0 50px 0;
}
.title {
	font-size: 1.5em;
	margin-bottom: 10px;
}
table {
	width: 100%;
	margin-bottom: 20px;
	border-collapse: collapse;
}
th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}
th {
	background-color: #f2f2f2;
}
input[type="text"], textarea {
	width: 100%;
	padding: 8px;
	box-sizing: border-box;
}
.reconfirm {
	margin-top: 20px;
}

</style>
</head>
<body>
<div class="container" id="buyApp">
            <div class="row" @submit="order">
            <div class="row mb-4">
				<div class="col-sm-6">
					<h2 class="posts-entry-title"></h2>
				</div>	
			</div>
                <div class="col-lg-10" >
 <h3 class="title">주문자 정보</h3>
				<table class="tbl_order" style="margin-bottom: 10px;">
					<colgroup>
						<col style="width:18%;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><label for="order_buyer_name">주문하시는 분</label></th>
							<td><input type="text" name="buyer_name" :value="mvo.userName" id="" class="form_input" readonly></td>
						</tr>
						<tr>
							<th scope="row"><label for="buyer_cell">전화번호</label></th>
							<td>
								<input type="text" name="" id="" :value="mvo.phone" class="" readonly>
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="order_buyer_email">이메일</label></th>
							<td><input type="text" name="" :value="mvo.email" id="" class="" readonly></td>
						</tr>

					</tbody>
				</table>
				<div class="title_delivery" style="">
					<h3 class="title">배송지 정보</h3>
				</div>
				<table class="tbl_order" style="">
					<colgroup>
						<col style="width:18%;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">기존 배송지</th>
							<td>
								<input type="text"  :value="mvo.addr1+'-'+mvo.addr2" readonly>
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="order_addressee_name">받으시는 분</label></th>
							<td><input type="text" name="recipient" ref="recipient" v-model="recipient" class="form_input"></td>
						</tr>
						<tr>
	<th scope="row"><label for="addressee_phone">전화번호</label></th>
	<td>
		<input type="text" name="phone" ref="phone" v-model="phone" class="form_input remove_dash">
	</td>
</tr>
<tr>
	<th scope="row"><label for="order_addressee_zip">주소</label></th>
	<td class="address">
    <div style="display: flex; align-items: center;">
        <input type="text" ref="post" style="width: 300px;" readonly class="input-sm" v-model="post" name="post"  @click="postFind()">
        <button class="form-control" @click="postFind()" style="width: 150px; height: 43px;">우편번호 찾기</button>
    </div>
    <input type="text" ref="addr1" size="50" readonly class="input-sm" v-model="addr1" name="addr1"  @click="postFind()">
    <input type="text" ref="addr2" size="50" class="input-sm" v-model="addr2" name="addr2">
</td>
</tr>
						
						<tr>
							<th scope="row"><label for="order_dlv_memo">배송시요청사항</label></th>
							<td><textarea type="text" name="buy_request" id="buy_request" v-model="buy_request" class="form_input block"></textarea></td>
						</tr>

					</tbody>
				</table>

				<div id="prd_gift_list" style="display:none">
					
				</div>
			</div>
			<div class="area_right">
				<div class="inner">
					<div class="box">
						<h3 class="title first">결제 정보</h3>
						<table class="tbl_order2">
							<colgroup>
								<col style="width:60%;">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">상품합계 금액</th>
									<td>W{{totalPrice.toLocaleString()}}</td>
								</tr>
								<tr class="total">
									<th scope="row">배송비 <a class="i_info p_cursor" onclick="$('#delivery_info').toggle()"></a></th>
									<td>
										(+) W<span id="delivery_prc2">3,000</span>
									</td>
								</tr>
								
							</tbody>
						</table>
						
						<table class="tbl_order2">
							<colgroup>
								<col style="width:60%;">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">총 결제 금액</th>
									<td>
										<strong class="total_price">W<span class="order_info_sale_prc">{{(totalPrice+3000).toLocaleString()}}</span></strong>
										
									</td>
								</tr>
							</tbody>
						</table>		
						<div class="reconfirm">
							<label><input name="reconfirm" id="reconfirm" type="checkbox" v-model="checked" @change="upChecked"> 결제정보를 확인하였으며,구매진행에 동의합니다.</label>
						</div>
						<div id="order1">
							<button class="form-control" @click="pay()">주문하기</button>
					</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<script>
		let buyApp = Vue.createApp({
		    data() {
		        return {
		            buyinfo: [],
		            mvo: {},
		            userid: '',
		            post: '',
		            addr1: '',
		            addr2: '',
		            recipient: '',
		            phone: '',
		            buy_request: '',
		            checked: false,
		            totalPrice: 0
		        }
		    },
		    mounted() {
		        this.buyInfo();
		    },
		    methods: {
		        buyInfo() {
		            axios.get("../cart/buy_info_vue.do").then(res => {
		                console.log(res.data);

		                this.buyinfo = res.data.buyinfo;
		                this.mvo = res.data.mvo;
		                this.userid = res.data.mvo.userId;
		                this.sum(); // sum 메서드 호출
		            });
		        },
		        postFind() {
		            let _this = this;
		            new daum.Postcode({
		                oncomplete: function(data) {
		                    _this.post = data.zonecode;
		                    _this.addr1 = data.address;
		                }
		            }).open();
		        },
		        upChecked() {
		            this.checked = true;
		        },
		        order() {
		            let form = new FormData();
		            form.append("buy_post", this.post);
		            form.append("buy_addr1", this.addr1);
		            form.append("buy_addr2", this.addr2);
		            form.append("userid", this.userid);
		            console.log("u" + this.userid);
		            form.append("recipient", this.recipient);
		            console.log("u" + this.recipient);
		            form.append("phone", this.phone);
		            form.append("buy_request", this.buy_request);
		            axios.post("../cart/order_info_vue.do", form, {
		                headers: {
		                    'Content-Type': 'multipart/form-data'
		                }
		            }).then(res => {
		                alert("주문이 정상 완료되었습니다");
		                location.href = "../myAndAdpage/buylist.do";
		            }).catch(error => {
		                console.error("Error occurred while sending review:", error);
		            });
		        },
		        pay() {
		            if (this.recipient === '') {
		                alert("수령인을 입력하세요");
		                this.$refs.recipient.focus();
		                return;
		            }
		            if (this.phone === '') {
		                alert("전화번호를 입력하세요");
		                this.$refs.phone.focus();
		                return;
		            }
		            if (this.post === '') {
		                alert("주소를 검색하세요");
		                this.$refs.post.focus();
		                return;
		            }

		            if (this.checked === false) {
		                alert("결제정보를 확인하고 구매진행 동의에 체크해주세요");
		                return;
		            }
		            let IMP = window.IMP; // 생략 가능
		            IMP.init("imp34378262");
		            console.log('clicked');
		            // IMP.request_pay(param, callback) 결제창 호출
		            IMP.request_pay({
		                pg: 'html5_inicis',
		                pay_method: 'card',
		                merchant_uid: 'merchant_' + new Date().getTime(),
		                name: '상품주문',
		                amount: this.totalPrice+3000, // totalPrice를 실제 결제할 금액으로 지정
		                buyer_email: 'iamport@siot.do',
		                buyer_name: '구매자이름',
		                buyer_tel: '010-1234-5678',
		                buyer_addr: '서울특별시 강남구 삼성동',
		                buyer_postcode: '123-456',
		                app_scheme: 'iamporttest'
		            }, (rsp) => {
		                if (rsp.success) {
		                    // 결제 성공 시 처리
		                } else {
		                    // 결제 실패 시 처리
		                    this.order();
		                }

		            });

		        },
		        sum() {
		            let totalPrice = 0;

		            for (let i = 0; i < this.buyinfo.length; i++) {
		                totalPrice += this.buyinfo[i].price * this.buyinfo[i].cart_count;
		            }
		            this.totalPrice = totalPrice;
		        }
		    }
		}).mount('#buyApp');
		</script>
</body>
</html>