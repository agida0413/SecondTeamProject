<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="conatainer" id="applyList">
		<div class="row appList" v-for="vo in applyList">
  				
	  			<div class="col-10">
	  				<div class="programName">
							<span style="font-size:20px; font-weight:bold;">{{vo.pvo.title}}</span>
						</div>
					<!-- 봉사프로그램정보 -->
					<div class="col-6" >
						
						
						<div style="margin-top:7px;">
						<div>
						<span class="programSubinformAll"><span style="font-weight:bold;">[이름]</span><span class="programSubinform">{{vo.mvo.name}}</span></span>
						 <span class="programSubinformAll"><span style="font-weight:bold;">[생년월일]</span><span class="programSubinform">{{vo.mvo.dbBirthday}}</span></span> 
						 </div>
						 <div>
						  <span class="programSubinformAll"><span style="font-weight:bold;">[성별]</span><span class="programSubinform">{{vo.mvo.sex}}</span></span>
						<span class="programSubinformAll"><span style="font-weight:bold;">[전화번호]</span><span class="programSubinform"> {{vo.mvo.phone}}</span></span> 
						</div> 
						
						<div>
						<span class="programSubinformAll"><span style="font-weight:bold;">[신청일시]</span><span class="programSubinform">{{vo.vdbStateTime}}</span></span>
						</div>
					</div>
					
					</div>
					
					
					<div class="col-6" >
						
						
						<div style="margin-top:7px;">
						<div>
						<span class="programSubinformAll"><span style="font-weight:bold;">[이메일]</span><span class="programSubinform">{{vo.mvo.email}}</span></span>
						</div>
						<div>
						<span class="programSubinformAll"><span style="font-weight:bold;">[주소]</span><span class="programSubinform">{{vo.mvo.addr1}}&nbsp;{{vo.mvo.addr2}}</span></span>
						</div>
						
					</div>
					
										
				</div>
				</div>
				<div class="col-2">
					<!-- 모집상태 -->
					<div style="margin:30px;">
						<div class="closeBox" style="height:60px; width:60px; border:1px black solid;">
						<div style="padding:5px;" class="text-center">금일<br> 마감</div>
						</div>
							<div style="margin-top:5px;">모집완료</div>
					</div>
					
				</div>				
				
  		   </div>
</div>
<script>
let applyList=Vue.createApp({
	data(){
		return{
			applyList:[],
			curpage:1,
			totalpage:0,
			startpage:0,
			endpage:0,
			type:'WAIT'
		}
	},
	mounted(){
		this.getList()
	},
	methods:{
		getList(){
			axios.get('../program/applyList_vue.do',{
				params:{
					page:this.curpage
				}
			})
					
			
			.then(res=>{
				this.applyList=res.data
				console.log(this.applyList)
			})
		}
	}
}).mount('#applyList')
</script>
</body>
</html>