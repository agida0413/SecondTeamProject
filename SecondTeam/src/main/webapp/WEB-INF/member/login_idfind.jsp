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
.inputinput{
   width : 300px;
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
#emailTab{
   position: relative; 
   height: 100px;
   margin-bottom: 50px;
   padding:10px;
}
#emailTab form button{
    position: absolute;
    bottom: 0;
    right: 38%;
    padding: 10px;
}
</style>
<!-- jQuery 및 jQuery UI 로드 -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script>
    function findId(tab) {
            let email = $("#findemail").val();
            //alert(email);
            if(email.trim()===""){
            	$('#findemail').focus();
            	return;
            }
            $.ajax({
            	type:'post',
            	url:'../member/idfindemail_ok.do',
            	data:{"email":email},
            	success:function(result){
            		//alert(result);
            		let res=result.trim();
            		if(res==="NO"){
            			// 찾으려는 email이 db에 없음
            			$("#emailResult").html('<span style="color:red">이메일이 존재하지 않습니다!</span>');
            		}
            		else{
            			// email이 db에 있음
            			$('#emailResult').html('<span>요청한 이메일에 등록된 ID는 '+res+' 입니다</span>')
            		}
            	}
            })
    }
	</script>
</head>

<body>
<div class="container" id="loginApp">
    <main> 
      <h2 class="sectiontitle text-center"><i class="xi-command"></i></h2>
      <h2 class="sectiontitle text-center">ID 찾기</h2>
      <div class="row row1 rowrow">
        
        <div class="find-id-form">
        
          <!-- 이메일 탭 -->
          <div id="emailTab">
            <form>
                <label for="email">이메일:</label>
                <input type="email" name="email" id="findemail" class="inputinput"><br>
                <button type="button" onclick="findId('email')" class="inputbutton">ID 찾기</button>
            </form>
            <p id="emailResult"></p>
          </div>
        </div>
        <div class="text-center ">
         <span><a href="../member/login_pwdfind.do" style="color: #fff !important;">
                    <i class="xi-user-o"></i>
                     비밀번호 찾기</a></span>
         &nbsp;&nbsp;&nbsp;
         <span><a href="../member/login.do" style="color: #fff !important;">
                    <i class="xi-user-o"></i>
                     로그인하기</a></span>
        </div>
      </div>
    </main>
</div>

</body>
</html>