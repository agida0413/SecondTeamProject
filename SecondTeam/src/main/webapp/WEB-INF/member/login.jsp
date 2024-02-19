<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
.rowrow{
   margin: 0 auto;
   width: 400px;
}
</style>
</head>

<body>
<div class="wrapper row3" id="loginApp">
    <main class="container clear"> 
      <h2 class="sectiontitle">로그인111</h2>
      <h2 class="sectiontitle">${sessionScope.id }</h2>
      <h2 class="sectiontitle">{{id}}</h2>
      <div class="row row1 rowrow">
         <table class="table">
            <tr>
               <td width="20%" class="text-right">아이디</td>
               <td width="80%" class="text-right">
                  <input type="text" ref="id" class="input-sm"
                  v-model="id">
               </td>
            </tr>
            <tr>
               <td width="20%" class="text-right">비밀번호</td>
               <td width="80%" class="text-right">
                  <input type="password" ref="pwd" class="input-sm"
                  v-model="pwd">
               </td>
            </tr>
            <tr>
               <td colspan="2" class="inline">
                  <input type="checkbox" ref="ck"
                  v-model="ck">&nbsp;&nbsp;ID저장
               </td>
            </tr>
            <tr>
               <td colspan="2" class="text-center inline">
                  <input type="button" value="로그인" class="btn btn-sm" @click="login()">
                  <input type="button" value="취소" class="btn btn-sm" 
                  onclick="javascript:history.back()">
               </td>
            </tr>
         </table>
      </div>
    </main>
</div>
<script>
 let loginApp=Vue.createApp({
	 data(){
		return{
			//쿠키사용해서 로그인창 뜨기 전에 아이디값 가져오려고 이렇게 초기값 적용함
			id:'${id}',
			pwd:'',
			ck:true
		} 
	 },
	 methods:{
		 login(){
			 if(this.id==='')
			 {
				 alert("ID를 입력하세요")
				 this.$refs.id.focus()
				 return
			 }
			 if(this.pwd==='')
			 {
				 alert("비밀번호를 입력하세요")
				 this.$refs.pwd.focus()
				 return
			 }
			 axios.get('../member/login_ok_vue.do',{
				 params:{
					 userId:this.id,
					 userPwd:this.pwd,
					 ck:this.ck
				 }
			 }).then(res=>{
				 console.log(res.data)
				 //1.아이디없는경우
				 if(res.data==='NOID')
				 {
					 alert("ID가 존재하지 않습니다.")
					 this.id=''
					 this.pwd=''
					 this.ck=false
					 this.$refs.id.focus()
				 }
				 //2.비밀번호가틀린경우
				 else if(res.data==='NOPWD')
				 {
					 alert("비밀번호가 일치하지 않습니다.")
					 this.pwd=''
					 this.$refs.pwd.focus()
				 }
				 //3.로그인성공의경우
				 else
				 {
					 location.href="../main/main.do"
				 }
			 })
		 }
	 }
 }).mount('#loginApp')
</script>
</body>
</html>