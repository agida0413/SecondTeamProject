<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://unpkg.com/vue@3"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container" id="adminApp">
	<div class="row">
	
		<table class="table">
			<tr >
				
				<th width="10%" >아이디</th>
				<th width="15%">이름</th>
				<th width="25%">생일</th>
				<th width="10%">보유윙</th>
				<th width="20%">전화번호</th>
				<th width="20%">관리자 처리</th>
			</tr>
			
			
			<tr v-for="vo in memberList" style="vertical-align:middle;">
			
				<td>{{vo.userId}}</td>
				<td>{{vo.userName}}</td>
				<td>{{vo.dbBirthday}}</td>
				<td>{{vo.wing}}</td>
				<td>{{vo.phone}}</td>
				<td>
				<button class="btn btn-small btn-danger">탈퇴처리</button>
				<button class="btn btn-small btn-danger">권한부여</button>
				<button class="btn btn-small btn-danger">윙 몰수</button>
				<button class="btn btn-small btn-danger">권환 회수</button>
				</td>
			</tr>
		
		</table>
	
	</div>

</div>

<script>
let adminApp = Vue.createApp({
		data(){
			return{
				memberList:[],
				curpage:1,
				totalpage:0,
				startpage:0,
				endpage:0
			}
		},
		mounted(){
			this.callList()
			
		},
		methods:{
			callList(){
				axios.get("../adminPage/memberList_vue.do",{
					params:{
						page:this.curpage,
						ss:''
					}
				}).then(res=>{
					this.memberList=res.data
				      console.log(this.memberList)
				})
				
			},
			
			range(start,end){
				let arr=[]
			
				let size=end-start;
				for(let i=0;i<=size;i++){
					arr[i]=start;
					start++;
				}
				return arr;
			},
			next(){
				this.curpage=this.end+1
				
			},
			prev(){
				this.curpage=this.start-1
				
			},
			move(page){
				this.curpage=page
				
			}
			
		}
}).mount('#adminApp')

</script>
</body>
</html>