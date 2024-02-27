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
    <th></th>
   </tr>
	<tr>
    <td class="text-center" style="margin: 0px auto;">
     <a :href="'../goods/goods_detail.do?gno='+vo.gno"><img :src="vo.g_img" style="width: 170px; height: 150px"></a>
    </td>
    <td>{{vo.g_name}}</td>
    <td class="text-center" width="80px;">{{vo.g_price}}</td>
 	<td>
 		<input type="button" class="form-control" style="width:60px; height: 30px;" value="삭제" @click="wDelBtn(vo.gno)"></span>
 	</td>
 	</tr>
 </table>
 <div class="text-center" >
                    <div style="margin:70px 0 150px" v-if="gWish_List.length==0">
                    <span>위시리스트 목록이 비어있습니다</span>
                    </div>
                    </div>
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
		 },
		 wDelBtn(gno){
			 axios.get("../goods/canclewishgoods_vue.do",{
  			   params:{
  				   objno:gno
  			   }
  		   }).then(res=>{
  			   alert("상품이 위시리스트에서 삭제되었습니다")
  			   this.gWish()
  		   })
		 }
	 }
 }).mount("#gWishApp")
 </script>
</body>
</html>