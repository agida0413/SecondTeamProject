<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
    String json="{"
    
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
   <%-- View : data()에 설정된 데이터값에 따라 변경 (자동) --%>
   <div class="container" id="dataoboardDetail">
     <div class=""><span style="font-weight:bold; font-size:30px; color:black;">자료실(양식다운)</span></div>
  <hr>
     <div class="row">
       <table class="table">
         <tr>
           <th width=20% class="text-center success">번호</th>
           <td width=30% class="text-center">{{detail_data.dno}}</td>
           <th width=20% class="text-center success">작성일</th>
           <td width=30% class="text-center">{{detail_data.dbday}}</td>
         </tr>
         <tr>
           <th width=20% class="text-center success">이름</th>
           <td width=30% class="text-center">{{detail_data.name}}</td>
           <th width=20% class="text-center success">조회수</th>
           <td width=30% class="text-center">{{detail_data.hit}}</td>
         </tr>
         <tr>
           <th width=20% class="text-center success">제목</th>
           <td colspan="3">{{detail_data.subject}}</td>
         </tr>
         <tr v-if="v_filecount!=0">
           <th width=20% class="text-center success">첨부파일</th>
           <td colspan="3">
             <ul>
               <li v-for="(fn,index) in filenames">
                 <a :href="'../program/download.do?fn='+fn">{{fn}}</a>&nbsp;({{filesizes[index]}}Bytes)
               </li>
             </ul>
           </td>
         </tr>
         <tr>
           <td colspan="4" class="text-left" valign="top" height="200">
             <pre style="white-space: pre-wrap;background-color: white;border:none">{{detail_data.content}}</pre>
           </td>
         </tr>
         <tr>
           <td colspan="4" class="text-right">
             <button class="btn-xs btn-danger">수정</button>
             <button class="btn-xs btn-info">삭제</button>
             <button class="btn-xs btn-success" @click="dataList()">목록</button>
           </td>
         </tr>
       </table>
     </div>
   </div>
   <script>
    let app=Vue.createApp({
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


