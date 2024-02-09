<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>

<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
  
   <div class="container" id="dataoboardDetail">
     <div class=""><span style="font-weight:bold; font-size:30px; color:black;">자료실(양식다운)</span></div>
  <hr>
     <div class="row">
       <table class="table" >
         <tr style="border-top:2px black solid;">
           <th width=20% class="text-center success" style="background-color:#f2f2f2;">번호</th>
           <td width=30% class="text-center">{{detail_data.dno}}</td>
           <th width=20% class="text-center success" style="background-color:#f2f2f2;">작성일</th>
           <td width=30% class="text-center">{{detail_data.dbday}}</td>
         </tr>
         <tr>
           <th width=20% class="text-center success" style="background-color:#f2f2f2;">이름</th>
           <td width=30% class="text-center">{{detail_data.name}}</td>
           <th width=20% class="text-center success" style="background-color:#f2f2f2;">조회수</th>
           <td width=30% class="text-center">{{detail_data.hit}}</td>
         </tr>
         <tr>
           <th width=20% class="text-center success" style="background-color:#f2f2f2;">제목</th>
           <td colspan="3">{{detail_data.subject}}</td>
         </tr>
         <tr v-if="v_filecount!=0">
           <th width=20% class="text-center success" style="background-color:#f2f2f2; vertical-align:middle;">첨부파일</th>
           <td colspan="3">
             <ul style="list-style-type: none;   padding-left: 0; /* 왼쪽 패딩 없애기 */
  			    margin-left: 0; /* 왼쪽 마진 없애기 */">
               <li v-for="(fn,index) in filenames" style="list-style-type: none;   padding-left: 0; /* 왼쪽 패딩 없애기 */
    			margin-left: 0; /* 왼쪽 마진 없애기 */">
               	<img src="../Projectimages/file.png" width="20px" >
                 <a :href="'../program/download.do?fn='+fn" style="margin-left:5px;">{{fn}}</a>&nbsp;({{filesizes[index]}}Bytes)
               </li>
             </ul>
           </td>
         </tr>
         <tr>
           <td colspan="4" class="text-left" valign="top" height="200">
             <pre style="white-space: pre-wrap;background-color: white;border:none">{{detail_data.content}}</pre>
           </td>
         </tr>
         <tr > 
           <td colspan="4" class="align-right">
           <span style="margin-left:700px;  float: right;">
         	 <c:if test="${sessionScope.admin==1 }">
             <button class="btn btn-small btn-danger" style="margin-right:10px;" @click="dataDelete()">삭제</button>
             </c:if>
             <button class="btn btn-small btn-success"  @click="dataList()">목록</button>
             </span>
           </td>
         </tr>
       </table>
     </div>
   </div>
    <script>
    let dataDetailApp=Vue.createApp({
       	// View에 전송할 데이터를 저장 
       	data(){
       		return {
       			detail_data:{}, // {} = vo , [] = list
       			dno:${dno},
       			filenames:[],
       			filesizes:[],
       			v_filecount:0
       		}
       	},
       	// ViewModel => 데이터값 변경 
       	methods:{
       		// 사용자 행위 => 사용자 정의 함수 
       		dataList(){
       			location.href="../program/databoardList.do"
       		},
       		dataDelete(){
       			
       			axios.get('../program/databoardDelete_vue.do',{
           			params:{
           				dno:this.dno
           			}
           		}).then(response=>{
           		
           			let res=response.data
           			if(res==='yes'){
           				location.href="../program/databoardList.do"
           			}
           			else{
           				alert('실패')
           			}
           		})
       			
       			}
       		
       		},
       	
       	mounted(){
       		// window.onload => 브라우저에 화면이 완성  ==> $(function(){})
       		axios.get('../program/databoardDetail_vue.do',{
       			params:{
       				dno:this.dno
       			}
       		}).then(response=>{
       			console.log(response.data.filename)
       			this.detail_data=response.data;
       			let leng=response.data.v_filecount;
       			if(leng>0)
       			{
       				this.filenames=response.data.filename.split(",")
       			    this.filesizes=response.data.filesize.split(",")
       			}
       			
       			this.v_filecount=leng;
       			
       		})
       	},
       	updated(){
       		
       	}
       }).mount('#dataoboardDetail')
    </script>
</body>
</html>


