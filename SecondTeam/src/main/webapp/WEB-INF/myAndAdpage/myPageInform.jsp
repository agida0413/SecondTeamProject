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
<div class="wrapper row3" id="memberApp">
    <main class="container mainmain"> 
      <h2 class="sectiontitle text-center">회원정보 수정</h2>
      <table class="table">
       <tr>
        <th width=15% class="text-center">ID</th>
        <td width=85% class="inline">
          <input type=text ref=userId size=15 class="input-sm" v-model="userId"  name="userId" readonly="readonly"
          >
          <p>{{idOk}}</p>
        </td>
       </tr>
       <th width=15% class="text-center">비밀번호</th>
        <td width=85% class="inline">
          <input type=password ref=userPwd size=15 class="input-sm" v-model="userPwd"
            name="userPwd"
          >
          &nbsp;
          <input type=password ref=userPwd1 size=15 class="input-sm" placeholder="비밀번호재입력" v-model="userPwd1"
           
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
         <td colspan="2" class="text-center inline" id="last_tr">
           <input type="submit" value="수정" class="btn-sm btn inputbutton" @click="update()">
           &nbsp;&nbsp;&nbsp;&nbsp;
           <a href="../main/main.do" class="btn-sm btn inputbutton">취소</a>
         </td>
       </tr>
      </table>
    </main>
</div>
<script>
  let memberApp = Vue.createApp({
    data() {
      return {
        update_data: {},
        addr2: '',
        addr1: '',
        userName: '',
        phone1: '',
        phone2: '',
        email: '',
        content: '',
        birth: '',
        idOk: '', // 수정: pwdOk로 변경
        userId: '${id}'
      }
    },
    mounted() {
      axios.get('../member/update_vue.do', {
        params: {
          userId: this.userId
        }
      }).then(res => {
        this.update_data = res.data;
        this.userPwd = res.data.userPwd;
        this.userName = res.data.userName;
        this.addr1 = res.data.addr1;
        this.addr2 = res.data.addr2;
        this.email = res.data.email;
        this.content = res.data.content;
      })
    },
    methods: {
    	update() {
    	    axios.post('../member/update_ok_vue.do', {
    	    	params:{
    	    		userPwd: this.userPwd,
       	         userName: this.userName,
       	         addr1: this.addr1,
       	         addr2: this.addr2,
       	         email: this.email,
       	         content: this.content
    	    	}
    	    	 
    	    }, {
    	        headers: {
    	            'Content-Type': 'application/json'
    	        }
    	    }).then(res => {
    	    	console.log(res)
    	        console.log(res.data);
    	        this.update_data = res.data;
    	        this.userPwd = res.data.userPwd;
    	        this.userName = res.data.userName;
    	        this.addr1 = res.data.addr1;
    	        this.addr2 = res.data.addr2;
    	        this.email = res.data.email;
    	        this.content = res.data.content;
    	        alert("개인정보 수정 성공");
    	        // 페이지를 새로고침합니다.
    	        //window.location.reload();
    	    }).catch(error => {
    	        alert("개인정보 수정 실패");
    	        console.error(error);
    	    });
    	}
    }
  }).mount("#memberApp");
</script>

</body>
</html>
</body>
</html>