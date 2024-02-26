<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/shopping.css">
<link rel="stylesheet" href="../css/cart.css">
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
<style type="text/css">
#cartApp{
	margin: 50px 0 50px 0;
}
#shoppadding{
	border: 1px solid black;
	 margin: auto;
     margin-top: 550px; 
}

</style>
</head>
<body>
<div class="container" id="cartApp">
            <div class="row">
                <div class="col-lg-12">
                    
                    <div style="text-align:center;"><img src="../Projectimages/shoppingcart.png" style="width:200px;"></div>
                       <div class="cartShow" v-if="cart_list.length>0">
                        <div class="shoping__cart__table" v-for="(vo, index) in cart_list" :key="index">
                        <table >
                            <thead>
                            
                                
                            </thead>
                            <tbody>
                         
                            <tr class="getSize">
                                    <th class="shoping__product">상품</th>
                                    <th>가격</th>
                                    <th>수량</th>
                                    <th>총액</th>
                                    <th></th>
                                </tr>
                                <tr class="hideAndShow">
                                    <td class="shoping__cart__item">
                                        <a :href="'../goods/goods_detail.do?gno='+vo.gvo.gno"><img :src="vo.gvo.g_img" class="shoppingItemImage"></a>
                                        <h5 style="display:inline; font-weight:bold;">{{vo.gvo.g_name}}</h5>
                                    </td>
                                    <td>
                                     <h7 class="hs_original-price">{{vo.gvo.g_price}}</h7>
                                  <h7 class="hs_discount-rate"></h7>   
                                  <h4 class="hs_final-price getShopPrice" ></h4>
                                    </td>
                                    <td class="shoping__cart__quantity">
                                      <div class="kyj_shoppingQuantity" >
                                        <div class="kyj__ShopInput-container">
								            <button class="kyj_shoppingDecreseBtn"  @click="decreaseQuantity(index)" >-</button>
								
								
								            <input type="text" :value="vo.cart_count" class="kyj_shoppingCal" id="quantity" refs="quantity" v-model="vo.cart_count" min="1" readonly>
								            <button class="kyj_shoppingIncreseBtn" @click="increaseQuantity(index)">+</button>
								        </div>
            						 </div>
                                    </td>
                                    <td class="shoping__cart__total" >
                                     <span v-if="!modify">{{(vo.cart_price*1).toLocaleString()}}</span>
  									 <span v-if="modify">{{(vo.price*vo.cart_count).toLocaleString()}}</span>
                                    </td>
                                    <td class="shoping__cart__item__close" @click="cartDel(vo.gcno)">
                                        <span class="icon_close">x</span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    </div>
                    <div class="text-center" v-else>
                    <div style="margin:70px 0 150px ">
                    <span>장바구니에 담긴 상품이 없습니다</span>
                    </div>
                    </div>
                </div>
            </div>
            <div class="row">
            
                <div class="col-lg-6">
                    <div class="shoping__cart__btns" style="display: flex">
                        <a href="../goods/goods_main.do" class="class"><input type="button" class="form-control" style="width: 150px;" value="상품보러가기"></a>
                       <a href="#" class="class" v-if="cart_list.length>0"><input type="button" class="form-control" style="width: 150px;" value="장바구니 비우기" @click="allDel()"></a>
                    </div>
                     
                </div>
                <div class="col-lg-6" v-if="cart_list.length>0">
                <table class="table">
		<colgroup>
			<col style="width:50%;">
			<col style="width:50%;">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">주문금액</th>
				<td>W<span class="prd_prc_cart_87 ">{{totalPrice.toLocaleString()}}</span></td>
			</tr>
			<tr>
				<th scope="row">배송비 <a class="i_info p_cursor" ></a></th>
				<td>
					W<span id="dlv_prc_cart" class="dlv_prc_cart_87">3,000</span>
				</td>
			</tr>
			<tr>
				<th scope="row">결제금액</th>
				<td><strong>W<span id="total_order_price_cartlist" class="price total_order_price_cartlist_87">{{(totalPrice + 3000).toLocaleString()}}</span></strong></td>
			</tr>
		</tbody>
	</table>
                        <a href="../cart/buy_page.do"><button class="form-control"  id="moveToBuy" style="width:100%; margin-top: 10px;">결제이동하기
                        </button>
                        </a>
                        <input type="hidden" name="getTotal" id="inputTotal" value="">
                          <input type="hidden" name="getStringTotal" id="inputStringTotal" value="">
                    </div>
                </div>
            </div>
        <script>
        let cartApp=Vue.createApp({
        	data(){
        		return{
        			cart_list:[],
        			userid:'',
        			cart_count:0,
        			totalPrice:0,
        			intprice:0,
        			mPrice:0,
        			modify:false
        			
        		}
        	},
        	mounted(){
        		this.cartData()
        		
        	},
        	methods:{
        		cartData(){
        			axios.get("../cart/cart_list_vue.do",{
        				params:{
        					userid:this.userid
        				}
        			}).then(res=>{
        				console.log(this.userid)
        				console.log(res.data)
        				this.cart_list=res.data
        				this.cartcount=res.data.cart_count
        				this.TotalPrice()
        			})
        		},
        		cartDel(gcno){
        			axios.get("../cart/cart_delete_vue.do",{
        				params:{
        					gcno:gcno
        				}
        			}).then(res=>{
        				console.log(res.data)
        				this.cart_list=res.data
        				
        			})
        		},
        		allDel(){
        			axios.get("../cart/cart_alldelete_vue.do",{
        				params:{
        					userid:this.userid
        				}
        			}).then(res=>{
        				this.cart_list=res.data
        				alert("전체 삭제")
        			})
        			this.cartdata()
        		},
        		 increaseQuantity(index) {
        			this.modify=true
        	        this.cart_list[index].cart_count++
        	    },
        	    decreaseQuantity(index) {
        	    	this.modify=true
        	        if (this.cart_list[index].cart_count > 1) {
        	            this.cart_list[index].cart_count--
        	        }
        	    },
        	    TotalPrice() {
        	    	if(this.modify===false){
        	    		let totalPrice = 0;
            	        for (let i = 0; i < this.cart_list.length; i++) {
            	            totalPrice += parseFloat(this.cart_list[i].cart_price);
            	        }
            	        this.totalPrice = totalPrice;
            	        console.log("tp:" + this.totalPrice);
            	        return this.totalPrice;
        	    	}
        	    	
        	        
        	    }
        	}
        }).mount("#cartApp")
        </script>
</body>
</html>