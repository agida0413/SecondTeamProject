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
<style type="text/css">
#cartApp{
	margin-top: 50px;
}
</style>
</head>
<body>
<div class="container" id="cartApp">
            <div class="row">
                <div class="col-lg-12">
                    
                    <div style="text-align:center;"><img src="../Projectimages/shoppingcart.png" style="width:200px;"></div>
                       <div class="cartShow" v-if="cart_list.length>0">
                        <div class="shoping__cart__table" v-for="vo in cart_list">
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
								            <button class="kyj_shoppingDecreseBtn" >-</button>
								
								
								            <input type="text" :value="vo.cart_count" class="kyj_shoppingCal" readonly>
								            <button class="kyj_shoppingIncreseBtn">+</button>
								        </div>
            						 </div>
                                    </td>
                                    <td class="shoping__cart__total" >
                                    {{vo.cart_price}}
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
                    <div style="margin:50px 0 150px ">
                    <span>장바구니에 담긴 상품이 없습니다</span>
                    </div>
                    </div>
                </div>
            </div>
            <div class="row">
            
                <div class="col-lg-12">
                    <div class="shoping__cart__btns" style="display: flex">
                        <a href="../goods/goods_main.do" class="class"><input type="button" class="form-control" style="width: 150px;" value="상품보러가기"></a>
                       <a href="#" class="class"><input type="button" class="form-control" style="width: 150px;" value="장바구니 비우기" @click="allDel()"></a>
                    </div>
                     
                </div>
                <div class="col-lg-6">
                    <div class="shoping__continue">
                        <div class="shoping__discount">
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                            
                            <li>총액<span class="allTotalPrice" data-allTotalPrice=""></span></li>
                        </ul>
                        <form action="#" method="post" id="sendBuy"> 
                        <button class="form-control"  id="moveToBuy" style="width:500px;">결제이동하기</button>
                        <input type="hidden" name="getTotal" id="inputTotal" value="">
                          <input type="hidden" name="getStringTotal" id="inputStringTotal" value="">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script>
        let cartApp=Vue.createApp({
        	data(){
        		return{
        			cart_list:[],
        			userid:''
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
        		}
        	}
        }).mount("#cartApp")
        </script>
</body>
</html>