<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
var IMP = window.IMP; // 생략 가능
IMP.init("imp08073165"); // 예: imp00000000
function requestPay() {
	console.log('clicked');
  // IMP.request_pay(param, callback) 결제창 호출
	IMP.request_pay({
	    pg : 'html5_inicis', // version 1.1.0부터 지원.
	    
	        /*
	            'kakao':카카오페이,
	            'inicis':이니시스, 'html5_inicis':이니시스(웹표준결제),
	            'nice':나이스,
	            'jtnet':jtnet,
	            'uplus':LG유플러스
	        */
	    pay_method : 'card', // 'card' : 신용카드 | 'trans' : 실시간계좌이체 | 'vbank' : 가상계좌 | 'phone' : 휴대폰소액결제
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : $('#payTitle').text(),
	    amount : $('#howMuch').val(),
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456',
	    app_scheme : 'iamporttest' //in app browser결제에서만 사용 
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	        
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	        
	        let price=$('#howMuch').val();
			let dno=$('#don_pay').attr("data-no")
			$.ajax({
	    	type:'post',
	    	url:'../donation/buy_ok.do',
	    	data:{"dno":dno,"price":price},
	    	success:function(result)
	    	{
	    		// 마이페이지 이동 
	    		if(result=='yes')
	    		{
	    			alert("소중한 후원 감사합니다.")
	    			location.href="../myAndAdpage/donated_campaign.do"
	    		}
	    		else
	    		{
	    			alert("후원 실패하셨습니다")
	    		}
	    		
	    	}
	    })
	    }
	});
}
$(function(){
	$('#dobuy').click(function(){
		requestPay()
	})
})
</script>
</head>
<body>
<div class="hero overlay inner-page bg-primary py-5">
		<div class="container">
			<div class="row align-items-center justify-content-center text-center pt-5">
				<div class="col-lg-6">
					<h1 class="heading text-white mb-3" data-aos="fade-up">결제 페이지</h1>
				</div>
			</div>
		</div>
</div>
<div class="section" id="donationPayApp">
		<div class="container" style="border: 1px solid #ccc">
			<div class="row" style="margin-top: 20px;margin-bottom: 20px;">
				<div class="col-lg-4 mb-5 mb-lg-0" data-aos="fade-up" data-aos-delay="100">
					<div class="contact-info">
						
						<div>
						  	<img :src="detail_data.d_image" class="img-fluid" style="border-radius: 10px;">
						</div>
						
						<div class="address mt-2" id="don_pay" data-no="${dno }">
							<i class="icon-room"></i>
							<h4 class="mb-2">Location:</h4>
							<p id="payTitle">{{detail_data.d_title}}</p>
						</div>

						<div class="open-hours mt-4">
							<i class="icon-clock-o"></i>
							<h4 class="mb-2">Open Hours:</h4>
							<p>
								{{detail_data.d_startdate}}
								~
								{{detail_data.d_enddate}}
							</p>
						</div>

						<div class="email mt-4">
							<i class="icon-envelope"></i>
							<h4 class="mb-2">Email:</h4>
							<p>{{detail_data.d_now}}</p>
						</div>

						<div class="phone mt-4">
							<i class="icon-phone"></i>
							<h4 class="mb-2">Call:</h4>
							<p>{{detail_data.d_goal}}</p>
						</div>
						
						
					</div>
				</div>
				<div class="col-lg-8" data-aos="fade-up" data-aos-delay="200">
					<form action="#">
						<div class="row">
							<div class="col-6 mb-3">
								<input type="text" class="form-control" value="${sessionScope.name }" readonly>
							</div>
							<div class="col-6 mb-3">
								<input type="email" class="form-control" value="${sessionScope.email }" readonly>
							</div>
							<div class="col-12 mb-3">
								<input type="text" class="form-control" id="howMuch" value="20000">
							</div>
							<div class="col-12 mb-3">
								<textarea name="" id="" cols="30" rows="7" class="form-control" placeholder="후원금과 함께 전달되는 메세지를 입력해주세요."></textarea>
							</div>

							<div class="col-12">
								<input type="button" value="후원하기" class="btn btn-primary" id="dobuy">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div> <!-- /.untree_co-section -->
	
<script>
 let donationPayApp=Vue.createApp({
	 data(){
		return{
			dno:${dno},
			detail_data:{}
		} 
	 },
	 mounted(){
		 axios.get('../donation/donation_detail_vue.do',{
			 params:{
				 dno:this.dno
			 }
		 }).then(res=>{
			console.log(res.data) 
			this.detail_data=res.data
		 })
	 },
	 methods:{
		 
	 }
 }).mount('#donationPayApp')
</script>
</body>
</html>