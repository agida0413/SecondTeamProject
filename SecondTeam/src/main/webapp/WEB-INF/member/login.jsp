<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
#loginApp{
   color:#fff;
   margin: 200px auto;
}
main{
  background-color: rgba(41,65,80,1);
  width: 500px;
  margin: 0 auto;
  padding: 50px 0;
  border-radius: 10px;
}
.rowrow{
   margin: 50px auto 0;
   width: 400px;
}
.table{
   color:#fff !important;
}
td,th{
   padding: 15px !important;
   border-top: none !important;
   border-bottom: none !important;
}
#last_tr{
   padding-top: 30px;
   border-bottom: none !important;
}
.inputinput{
   width : 300px;
   color: #fff !important;
   border: none;
   background: none;
   border-bottom: 1px solid #fff;
   font-size: 15px;
}
input:focus {
   outline:none;
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
<div class="container" id="loginApp">
    <main> 
      <h2 class="sectiontitle text-center"><i class="xi-command"></i></h2>
      <h2 class="sectiontitle text-center">Welcome</h2>
      <div class="row row1 rowrow">
         <table class="table">
            <tr>
               <td width="30%" class="text-left">ID</td>
               <td width="70%" class="text-center">
                  <input type="text" ref="id" class="input-sm inputinput"
                  v-model="id">
               </td>
            </tr>
            <tr>
               <td width="30%" class="text-left">PW</td>
               <td width="70%" class="text-center">
                  <input type="password" ref="pwd" class="input-sm inputinput"
                  v-model="pwd">
               </td>
            </tr>
            <tr>
               <td colspan="2" class="text-center">
                  <span>
                  <input type="checkbox" ref="ck"
                  v-model="ck">&nbsp;&nbsp;ID저장
                  </span>
                  &nbsp;&nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;
                  <span><a href="../member/join_c.do" style="color: #fff !important;">
                    <i class="xi-city"></i>
                     센터회원가입</a></span>
                  &nbsp;&nbsp;&nbsp;
                  <span><a href="../member/join_u.do" style="color: #fff !important;">
                    <i class="xi-user-o"></i>
                     일반회원가입</a></span>
               </td>
            </tr>
            <tr>
               <td colspan="2" class="text-center">
                  <span><a href="#" style="color: #fff !important;">
                    <i class="xi-search"></i>
                     아이디 찾기</a></span>
                  &nbsp;&nbsp;&nbsp;
                  <span><a href="../member/login_pwdfind.do" style="color: #fff !important;">
                    <i class="xi-lock"></i>
                     비밀번호 찾기</a></span>
               </td>
            </tr>
            <tr>
               <td colspan="2" class="text-center inline" id="last_tr">
                  <input type="button" value="로그인" class="btn btn-sm inputbutton" @click="login()">
                  &nbsp;&nbsp;&nbsp;
                  <input type="button" value="취소" class="btn btn-sm inputbutton" 
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