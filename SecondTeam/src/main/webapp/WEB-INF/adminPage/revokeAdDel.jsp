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
			<tr>
				
				<th>아이디</th>
				<th>이름</th>
				<th>생일</th>
				<th>주소</th>
				<th>전화번호</th>
				<th>관리자 처리</th>
			</tr>
			
			
			<tr>
			
				<td>아이디</td>
				<td>이름</td>
				<td>생일</td>
				<td>주소</td>
				<td>전화번호</td>
				<td>
				<button class="btn btn-small btn-danger">탈퇴처리</button>
				<button class="btn btn-small btn-danger">권한부여</button>
				<button class="btn btn-small btn-danger">윙 몰수</button>
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