<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="conatiner" id="gWishApp">
<div class="row my_res">
<div class="row">
<h4 class="text-center">&nbsp;상품 위시리스트</h4>
 <table class="myres_table" style="margin-top: 20px;" v-for="vo in gWish_List">
   <tr>
    <th class="text-center"></th>
    <th class="text-center">상품명</th>
    <th class="text-center">가격</th>
   </tr>
	<tr>
    <td class="text-center" style="margin: 0px auto;">
     <a href="#"><img :src="vo.g_img" style="width: 170px; height: 150px"></a>
    </td>
    <td>{{vo.g_name}}</td>
    <td class="text-center" width="80px;">{{vo.g_price}}</td>
   </tr>
 
 </table>
 </div>
 </div>
 </div>
 <script>
 let gWishList=Vue.createApp({
	 data(){
		 return{
			gWish_List:[],
			id:''
		 }
	 },
	 mounted(){
		this.gWish() 
	 },
	 methods:{
		 gWish(){
			 axios.get("../myAndAdpage/wishgoodslist_vue.do",{
				 params:{
					 id:this.id
				 }
			 }).then(res=>{
				 console.log(res.data)
				 this.gWish_List=res.data
			 })
		 }
	 }
 }).mount("#gWishApp")
 </script>
</body>
</html>