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
<script src="https://code.jquery.com/jquery.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script>
    // Tabs 초기화
    $(function () {
        $("#tabs").tabs();
    });

    function findPwd(tab) {
        if (tab === 'email') {
            let id = $("#findbyid").val();
            let email=$("#findbyemail").val();
            if(id.trim()===""){
            	$('#findbyid').focus();
            	return;
            }
            if(email.trim()===""){
            	$('#findbyemail').focus();
            	return;
            }
            $.ajax({
            	type:'post',
            	url:'../member/pwdfind_ok.do',
            	data:{"id":id,"email":email},
            	success:function(result){
            		let res=result.trim();
            		if(res==="IDNO"){
            			// 찾으려는 id가 db에 없음
            			$("#emailResult").html('<span style="color:red">ID가 존재하지 않습니다!</span>');
            		}
            		else if(res=="EMAILNO"){
            			// email이 db에 없음
            			$('#emailResult').html('<span style="color:red">이메일이 존재하지 않습니다!</span>');
            		}else if(res=="SEND"){
            			// id, email 일치
            			$("#emailResult").html('<span style="color:blue">전송 완료</span>')
            			alert("등록된 이메일로 임시 비밀번호를 전송했습니다!");
            		}
            	}
            })
            
            
        } 
    }
	</script>
</head>

<body>
<div class="container" id="loginApp">
    <main> 
      <h2 class="sectiontitle text-center"><i class="xi-command"></i></h2>
      <h2 class="sectiontitle text-center">비밀번호 찾기</h2>
      <div class="row row1 rowrow">
         <div class="find-id-form">
        
        <!-- 이메일 탭 -->
        <div id="emailPwdTab">
            <form>
                <label for="id">ID:</label>
                <input type="text" name="id" id="findbyid" class="inputinput"><br>
                <label for="email">이메일:</label>
                <input type="email" name="email" id="findbyemail" class="inputinput"><br>
                <button type="button" onclick="findPwd('email')" class="inputbutton">PW 찾기</button>
            </form>
            <p id="emailResult"></p>
        	</div>
        	
        	
		</div>
      </div>
    </main>
</div>
</body>
</html>