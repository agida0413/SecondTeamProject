<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 주소검색창 나오게하는 js -->
<!-- <script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->

<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
.mainmain{
   margin: 100px auto;
   width: 800px;
}
table{
   color: #333 !important;
}
#last_tr{
   padding-top: 100px;
   border-bottom: none !important;
}
.sectiontitle{
    margin-bottom: 50px;
}
.inputbutton{
   width : 100px;
   color: #fff;
   background-color: #93a0a8;
   font-size: 15px;
   border-radius: 20px;
}
</style>
</head>
<body>
<div class="wrapper row3" id="updateApp">
    <main class="container mainmain"> 
      <h2 class="sectiontitle text-center">회원정보 수정</h2>

      <table class="table">
       <tr>
        <th width=15% class="text-center">ID</th>
        <td width=85% class="inline">
          <input type=text ref=userId size=15 class="input-sm" v-model="userId"
            readonly="isReadOnly" name="userId"
          >
        </td>
       </tr>
       <tr>
        <th width=15% class="text-center">이름</th>
        <td width=85% class="inline">
          <input type=text ref=userName size=15 class="input-sm" v-model="userName"
           name="userName"
          >
        </td>
       </tr>
       <tr>
        <th width=15% class="text-center">성별</th>
        <td width=85% class="inline">
          <%-- radio => group name --%>
          <input type="radio" ref="sex" value="남자" checked v-model="sex" name="sex">남자
          <input type="radio" ref="sex" value="여자" v-model="sex" name="sex">여자
        </td>
       </tr>
       <tr>
        <th width=15% class="text-center">생년월일</th>
        <td width=85% class="inline">
          <input type=date ref="birth" size=25 v-model="birth" name="birth">
        </td>
       </tr>
       <tr>
        <th width=15% class="text-center">이메일</th>
        <td width=85% class="inline">
          <input type=text ref=email size=50 class="input-sm" v-model="email" name="email">
          <p></p>
        </td>
       </tr>
       <tr>
        <th width=15% class="text-center">주소</th>
        <td width=85% class="inline">
          <input type=text ref=addr1 size=50 readonly class="input-sm" v-model="addr1" name="addr1">
        </td>
       </tr>
       <tr>
        <th width=15% class="text-center">상세주소</th>
        <td width=85% class="inline">
          <input type=text ref=addr2 size=50 class="input-sm" v-model="addr2" name="addr2">
        </td>
       </tr>
       <tr>
        <th width=15% class="text-center">소개</th>
        <td width=85% class="inline">
          <textarea rows="3" cols="52" ref="content" v-model="content" name="content"></textarea>
        </td>
       </tr>
       <tr>
         <td colspan="2" class="text-center inline">
           <input type=button value="수정" class="btn-sm btn-primary" @click="update()">
           <input type=button value="취소" class="btn-sm btn-primary" @click="goback()">
           <input type=button value="탈퇴" class="btn-sm btn-danger" @click="withdraw()">
         </td>
       </tr>
       <tr>
         <td colspan="2" class="text-center inline" v-show="wShow">
           비밀번호 : <input type="password" class="input-sm" v-model="withpwd" ref="withpwd">
           <input type=button value="탈퇴" class="btn-sm btn-danger" @click="withdrawOk()">
           <input type=button value="취소" class="btn-sm btn-primary" @click="withdrawNo()">
         </td>
       </tr>
      </table>
    </main>
</div>
  <script>
   let memberApp=Vue.createApp({
      data(){
         return{
            user_info:{},
               userId:'${id}',
               userName:'',
               sex:'',
               birth:'',
               email:'',
               addr1:'',
               addr2:'',
               content:'',
               wShow:false,
               withpwd:''
         }
      },
      mounted(){
         axios.get('../member/update_vue.do',{
            params:{
               userId:this.userId
            }
         })
         .then(response=>{
        	console.log(response)
            console.log(response.data)
            this.user_info=response.data
            this.userName=response.data.userName
            this.sex=response.data.sex
            this.birth=response.data.birth
            this.email=response.data.email
            this.addr1=response.data.addr1
            this.addr2=response.data.addr2
            this.content=response.data.content
         })
      },
      methods:{
    	 withdrawOk(){
    		 console.log(this.withpwd)
    		 axios.post('../member/delete_ok_vue.do',null,{
    			 params:{
    				 pwd:this.withpwd
    			 }
    		 }).then(res=>{
    			 if(res.data==='yes'){
    				 alert('회원 탈퇴되었습니다.')
    				 location.href="../main/main.do";
    			 } else {
    				alert('비밀번호가 일치하지 않습니다!!')
    				this.$refs.withpwd=''
    				this.$refs.withpwd.focus()
    			 }
    		 })
    	 },
    	 withdraw(){
    		 this.wShow=true;
    	 },
    	 withdrawNo(){
    		 this.wShow=false;
    	 },
         goback(){
            window.history.back()
         },
         update(){
            axios.post('../member/update_ok_vue.do',null,{
               params:{
                  userId:this.userId,
                  userName:this.userName,
                     sex:this.sex,
                     birth:this.birth,
                     email:this.email,
                     addr1:this.addr1,
                     addr2:this.addr2,
                     content:this.content 
               }
            }).then(response=>{
               if(response.data==="yes")
               {
                  
                  location.href="../myAndAdpage/mypage.do";
               }
               else
               {
                  alert("비밀번호가 틀립니다!!")
               }
            }).catch(error => {
               alert("에러가 발생했습니다: " + error.message);
               });
         }
      }
   }).mount("#updateApp")
  </script>
</body>
</html>














