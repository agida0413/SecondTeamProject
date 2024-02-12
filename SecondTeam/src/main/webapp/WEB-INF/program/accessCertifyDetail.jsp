<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/button.css">
	<link rel="stylesheet" href="../css/Program.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class=""><span style="font-weight:bold; font-size:30px; color:black;">봉사활동인증 승인</span></div>
  <hr>

<div class="container" id="accressCertifyDetail">
  
     <div class="row appList" style=" border: 1px solid #999999; padding:20px; border-radius:5px;">
    <div class="col-12 applyLine" style="margin-bottom:20px;">
        <div class="programName">
            <span style="font-size:25px; font-weight:bold; color:black;">{{ vo && vo.pvo && vo.pvo.title }}<span style="color:blue;">[{{ vo && vo.mvo && vo.mvo.name }}&nbsp;님]</span></span>
        </div>
        <!-- 봉사프로그램정보 -->
        <div class="row" style="color:black; margin-top:10px;">
            <div class="col-4">
                <div style="margin-top:7px;">
                    <div>
                        <span class="programSubinformAll"><span style="font-weight:bold;">[이름]</span><span class="programSubinform">{{ vo && vo.mvo && vo.mvo.name }}</span></span>
                    </div>
                    <div>
                        <span class="programSubinformAll"><span style="font-weight:bold;">[성별]</span><span class="programSubinform">{{ vo && vo.mvo && vo.mvo.sex }}</span></span>
                    </div>
                </div>
            </div>
            <div class="col-4">
                <div style="margin-top:7px;">
                    <div>
                        <span class="programSubinformAll"><span style="font-weight:bold;">[생년월일]</span><span class="programSubinform">{{ vo && vo.mvo && vo.mvo.dbBirthday }}</span></span>
                    </div>
                    <div>
                        <span class="programSubinformAll"><span style="font-weight:bold;">[전화번호]</span><span class="programSubinform">{{ vo && vo.mvo && vo.mvo.phone }}</span></span>
                    </div>
                </div>
            </div>
            <div class="col-4">
                <div style="margin-top:7px;">
                    <div>
                        <span class="programSubinformAll"><span style="font-weight:bold;">[이메일]</span><span class="programSubinform">{{ vo && vo.mvo && vo.mvo.email }}</span></span>
                    </div>
                    <div>
                        <span class="programSubinformAll"><span style="font-weight:bold;">[주소]</span><span class="programSubinform">{{ vo && vo.mvo && vo.mvo.addr1 }}&nbsp;{{ vo && vo.mvo && vo.mvo.addr2 }}</span></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" style="color:black;">
            <div class="col-4">
                <div style="margin-top:7px;">
                    <span class="programSubinformAll"><span style="font-weight:bold;">[모집센터]</span><span class="programSubinform">{{ vo && vo.pvo && vo.pvo.centername }}</span></span>
                </div>
            </div>
          <div class="col-4">
                <div style="margin-top:7px;">
                    <span class="programSubinformAll"><span style="font-weight:bold;">[봉사기간]</span><span class="programSubinform">{{ vo && vo.pvo && vo.pvo.dbV_start }}&nbsp;~&nbsp;{{ vo && vo.pvo && vo.pvo.dbV_end }}</span></span>
                </div>
            </div>
            <div class="col-4">
                <div style="margin-top:7px;">
                    <span class="programSubinformAll"><span style="font-weight:bold;">[신청일시]</span><span class="programSubinform">{{ vo && vo.vdbStateTime }}</span></span>
                </div>
            </div>
        </div>
        <div class="row" style="color:black; margin-top:10px;">
            
         
        </div>
    </div>
  
</div>
<div style="height:20px;"></div>

<div class="row">
<span style="font-weight:bold; font-size:30px; color:black;">인증사진 목록</span>
</div>
<hr>
	<div class="row" >
			<div class="certifyImage">
			
			<div class="row" style="margin-top:10px; margin-left:50px;">
			
			<div class="col-5" style="border: 1px solid #999999; border-radius:10px; margin-right:30px; margin-bottom:20px;" v-for="(fn,index) in v_ok_filenames">
			<img :src="'../applyCertidy/'+fn" width="100%" height="100%">
			</div>
			
			
			</div>
			
			
			
			</div>
			
	</div>
	<hr>
	
	<div class="row" style="float:right;">
		<span><button  class="btn btn-xlarge btn-danger" @click="certifyAccess()">인증승인하기</button></span>
	</div>
				</div>
				<script>
				let accressCertifyDetail=Vue.createApp({
					data(){
						return{
						vo:{},
						vano:${vano},
						path:'',
						v_ok_filenames:[],
						v_ok_filesizes:[],
						v_ok_filecount:0
						}
					},
					mounted(){
						this.getDetail()
					},
					methods:{
						getDetail(){
							axios.get('../program/accessCertifyDetail_vue.do',{
								params:{
									vano:this.vano
								}
							})
							.then(res=>{
								this.vo=res.data.vo
								this.path=res.data.path
							
								
								let leng=res.data.vo.v_ok_filecount;
				       			if(leng>0)
				       			{
				       				this.v_ok_filenames=res.data.vo.v_ok_filename.split(",")
				       			    this.v_ok_filesizes=res.data.vo.v_ok_filesize.split(",")
				       			}
				       			
				       			this.v_ok_filecount=leng;
								
								
							})
						},
						certifyAccess(){
							axios.get('../program/updateCertifyAccesss_vue.do',{
								params:{
									vano:this.vano
								}
							})
							.then(res=>{
								if(res.data==='YES'){
									alert('승인이 완료되었습니다.')
									location.href="../program/accessCertify.do"
								}
								else{
									alert('승인실패(오류발생)')	
								}
								
							})
						}
					}
					
				}).mount('#accressCertifyDetail')
				
				</script>
</body>
</html>