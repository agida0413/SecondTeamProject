<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- 주소검색창 나오게하는 js -->
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
   padding-top: 50px;
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
   padding:10px;
}
</style>
</head>
<body>
<div class="wrapper row3" id="memberApp">
    <main class="container mainmain"> 
      <h2 class="sectiontitle text-center">일반 회원가입</h2>
      <form method="post" action="../member/join_ok.do" @submit="submitForm()">
      <table class="table">
       <tr>
        <th width=15% class="text-center">ID</th>
        <td width=85% class="inline">
          <input type=text ref=userId size=15 class="input-sm" v-model="userId"
            v-bind:readonly="isReadOnly" name="userId"
          >
          &nbsp;
          <input type=button value="아이디중복체크" class="btn-sm"
           @click="idCheck"
          >
          <p>{{idOk}}</p>
        </td>
       </tr>
       <th width=15% class="text-center">비밀번호</th>
        <td width=85% class="inline">
          <input type=password ref=userPwd size=15 class="input-sm" v-model="userPwd"
            @keyup="pwdValidate" name="userPwd"
          >
          &nbsp;
          <input type=password ref=userPwd1 size=15 class="input-sm" placeholder="비밀번호재입력" v-model="userPwd1"
           @keyup="pwdValidate2" 
          >
          <p>{{pwdOk}}</p>
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
        <th width=15% class="text-center">우편번호</th>
        <td width=85% class="inline">
          <input type=text ref=post size=15 readonly class="input-sm" v-model="post" name="post">
          <input type=button value="우편번호검색" class="btn-sm btn" @click="postFind()">
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
        <th width=15% class="text-center">전화번호</th>
        <td width=85% class="inline">
          <select ref="phone1" class="input-sm" v-model="phone1" name="phone1">
            <option>010</option>
            <option>02</option>
          </select>
          &nbsp;
          <input type=text ref=phone2 size=15 class="input-sm" v-model="phone2" name="phone2">
        </td>
       </tr>
       <tr>
        <th width=15% class="text-center">소개</th>
        <td width=85% class="inline">
          <textarea rows="3" cols="52" ref="content" v-model="content" name="content"></textarea>
        </td>
       </tr>
       <tr>
         <td colspan="2" class="text-center inline" id="last_tr">
           <input type="submit" value="회원가입" class="btn-sm btn inputbutton" >
           &nbsp;&nbsp;&nbsp;&nbsp;
           <input type=button value="취소" class="btn-sm btn inputbutton"
             onclick="javascript:history.back()">
         </td>
       </tr>
      </table>
      </form>
    </main>
</div>
<script>
  let memberApp=Vue.createApp({
	  data(){
		  return {
			  sex:'',
			  addr2:'',
			  post:'',
			  addr1:'',
			  userPwd:'',
			  userPwd1:'',
			  pwdOk:'',
			  userName:'',
			  phone1:'',
			  phone2:'',
			  email:'',
			  content:'',
			  birth:'',
			  userId:'',
			  idOk:'',
			  isReadOnly:false
		  }
	  },
	  methods:{
		  submitForm(e){
			if(this.userId && this.userName && this.userPwd && this.sex
			   && this.birth && this.email && this.post && this.addr1
			   && this.content && this.phone1 && this.phone2 && !this.idOk
			   && !this.pwdOk
			) 
			{
				return true
			}
			
			if(this.userId==='' || this.idOk!='')
			{
				this.$refs.userId.focus()
			}
			else if(this.userName==='')
			{
				this.$refs.userName.focus()
			}
			else if(this.userPwd==='')
			{
				this.$refs.userPwd.focus()
			}
			else if(this.userPwd1==='')
			{
				this.$refs.userPwd1.focus()
			}
			else if(this.userPwd!=this.userPwd1)
			{
				this.userPwd1='';
				this.userPwd=''
			}
			else if(this.phone2=='')
			{
				this.$refs.phone2.focus()
			}
			e.preventDefault()
		  },
		  idCheck(){
			  if(this.userId==='')
			  {
				  this.$refs.userId.focus()
				  return
			  }
			  axios.get('../member/idcheck_vue.do',{
				  params:{
					  userId:this.userId
				  }
			  }).then(response=>{
				 if(response.data=="0")  
			     {
					 this.idOk='사용가능한 아이디입니다.'
					 this.isReadOnly=true
			     }
				 else
				 {
					 this.idOk='이미 사용중인 아이디입니다' 
				 }
			  })
		  },
		  postFind(){
			  let _this=this
			  //Vue
			  new daum.Postcode({
				 oncomplete:function(data)
				 {
					 _this.post=data.zonecode;
					 _this.addr1=data.address;
				 }
			  }).open()
		  },
		  pwdValidate(){
			  let pwd=String(this.userPwd)
			  let num=pwd.search(/[0-9]/g)
			  let eng=pwd.search(/[a-z]/ig)
			  // 알파벳 / 숫자가 존재 
			  // 8자리 이상  20이하 
			  if(pwd==='')
			  {
				  this.pwdok='';
				  return
			  }
			  if(pwd.length<8 || pwd.length>20)
			  {
				  this.pwdOk='비밀번호는  8자리~20자리 이내로 입력하세요'
				  return
			  }
			  else if(pwd.search(/\s/)!=-1)
			  {
				  // \s => 공백 
				  this.pwdOk='비밀번호는 공백없이 입력하세요'
				  return
			  }
			  else if(num<0 || eng>0)
			  {
				  this.pwdOk="비밀번호는 영문,숫자를 혼합해서 입력히세요"
				  return
			  }
			  else
			  {
				  this.pwdOk=''
				  return
			  }
			  
		  },
		  pwdValidate2(){
			  if(this.userPwd!==this.userPwd1)
			  {
				  this.pwdOk="비밀번호가 일치하지 않습니다!!"
			  }
			  else
			  {
				  this.pwdOk=''
			  }
		  }
	  }
  }).mount("#memberApp")
</script>
</body>
</html>