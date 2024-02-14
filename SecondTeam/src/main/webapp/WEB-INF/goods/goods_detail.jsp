<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<style type="text/css">
#goodsDetail{
margin-top: 50px;
}
</style>
</head>
<body>
	<div class="container" id="goodsDetail">
		<div class="row">
			<div class="row mb-4">
				<div class="col-sm-6">
					<h2 class="posts-entry-title"></h2>
				</div>
				<div class="col-sm-6 text-sm-end">
					<a href="javascript:history.back()" class="read-more">Return List</a>
				</div>
			</div>
			<table class="goodsDetailtab">
				<tr height="40px" style="margin-top: 50px;">
					<td width="30%" class="text-center" rowspan="3">
					<img :src="goodsdetail.g_img" style="width: 400px;">
					</td>
					<td width="70%" style="margin-left: 200px;">
					<span style="font-size: 20px; font-weight: bold"><br>{{goodsdetail.g_name}}</span><br><br>
					<span>{{goodsdetail.g_price}}</span><br><br>
					</td>
				</tr>
				<tr height="40px">
				<td>
				<span>수량</span><br><br>
				<span>총금액</span><br><br>
				</td>
				</tr>
				<tr style="display: flex; height:40px;">
				<td>
					<input type="button" class="form-control"
						style="width: 180px; height: 35px; font-weight: bold" value="장바구니">
					</td>
					<td>
					<input type="button" class="form-control"
						style="width: 180px; height: 35px; margin-left: 5px; font-weight: bold"
						value="바로구매">
					</td>
					<td>
					<div class="form-control text-center"
						style="width: 50px; height: 35px; margin-left: 5px; font-weight: bold">
						<span><i class="xi-heart-o"></i></span>
					</div>
					</td>
				</tr>
			</table>
			<div class="row" style="border-top: 1px solid grey; margin-top: 20px;">
				<div class="text-center" style="margin-top: 15px;">
					<span><a href="#">Details | </a></sapn> 
					<span><a href="#">Review | </a></sapn> 
					<span><a href="#">Q&A | </a></sapn>
					<span><a href="#">Order info</a></sapn>
				</div>
			</div> 
		</div>
		<input type="button" class="form-control" ref="subImg" value="상품상세보기" @click="subImgShow()" style="margin-top: 25px;">
		<div class="subImgShow" v-if="isShow!==false">
		<div class="row" v-for="vo in goodsdetail_img" style="margin-top: 20px;">
			<table class="table">
				<tr>
					<img :src="vo.g_subimg">
				</tr>
			</table>
		</div>
		</div>
		
		<div class="row mb-4">
			<div class="col-sm-6" style="margin-top: 50px;">
				<h2 class="posts-entry-title">상품후기</h2>
			</div>
			<div class="col-sm-6 text-sm-end" style="margin-top: 50px;">
				<a href="#" class="read-more"> <span class=fa-commenting-o"></span>
				My Review
				</a>
			</div>
		 <div class="text-center">
		 <div class="row" style="border-top: 1px solid grey; margin-top: 20px;">
		 	 <div style="margin: 50px 0 230px 0">
     			  <span>등록된 상품 후기가 없습니다.</span>
      		 </div>
		 </div>
		</div>
		</div>
		<div class="row mb-4">
			<div class="col-sm-6" style="margin-top: 50px;">
				<h2 class="posts-entry-title">상품문의</h2>
			</div>
			<div class="col-sm-6 text-sm-end" style="margin-top: 50px;">
				<a href="#" class="read-more">
				Q&A
				</a>
			</div>
		 <div class="text-center">
		 <div class="row" style="border-top: 1px solid grey; margin-top: 20px;">
		 	 <div style="margin: 50px 0 230px 0">
     			  <span>등록된 상품 문의가 없습니다.</span>
      		 </div>
		 </div>
		</div>
		</div>
	</div>
	<script>
let goodsDetail=Vue.createApp({
	data(){
		return{
			goodsdetail:{},
			goodsdetail_img:[],
			gno:${gno},
			isShow:false
		}
	},
	mounted(){
		this.detaildata()
	},
	methods:{
		detaildata(){
			axios.get("../goods/goods_detail_vue.do",{
				params:{
					gno:this.gno
				}
			}).then(res=>{
				console.log(res.data)
				this.goodsdetail=res.data.goodsdetail
				this.goodsdetail_img=res.data.goodsdetail_img
			})
		},
		subImgShow(){
			if(this.isShow===false)
			{
				this.isShow=true	
				this.$refs.subImg.value="상세보기접기"
			}
			else
			{
				this.isShow=false	
				this.$refs.subImg.value="상품상세보기"
			}
			
		}
	}
}).mount("#goodsDetail")
</script>
</body>
</html>