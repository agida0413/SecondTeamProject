<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
#reserveApp {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
 .rounded {
      -moz-border-radius:20px 20px 20px 20px; 
      border-radius:20px 20px 20px 20px;
      border:solid 1px #ffffff;
      background-color:#2b6bd1;
      padding:10px;
      color:#ffffff;
    }
  td.link:hover{
    cursor: pointer;
  }
 .tr_link:hover{
    cursor: pointer;
 }
</style>
</head>
<body>
<div class="wrapper row3" id="reserveApp">
  <main class="container clear"> 
   <h2 class="sectiontitle">소모임 예약</h2>
   <table class="table">
     <tr>
       <td class="text-center" rowspan="3" width=40%>
         <table class="table">
           <caption><h3 class="text-center">소모임 리스트</h3></caption>
            <tr>
              <td colspan="2" class="text-center inline">
                 <input type="button" class="btn btn-xs" value="운영중" 
                 @click="moimSelect('운영중')">&nbsp;
                 <input type="button" class="btn btn-xs" value="부분운영" 
                 @click="moimSelect('부분운영')">&nbsp;
                 <input type="button" class="btn btn-xs" value="임시중단"
                 @click="moimSelect('임시중단')">&nbsp;
              </td>
           </tr>
         </table>
         <div style="overflow-y:auto; height: 700px;">
            <table class="table">
               <tr v-for="vo in moim_list" class="tr_link"
               @click="moimNumber(vo.rno)">
                  <td>
                     <img :src="vo.img" 
                     style="width: 50px; height: 30px;">
                     </td>
                  <td>{{vo.loc}}</td>
               </tr>
            </table>
         </div>
       </td>
       <td class="text-center" width="60%">
         <table class="table">
           <caption><h3 class="text-center">예약일 정보</h3></caption>
           <tr>
             <td>
                <div class="calendar">
				      <h2>
				        <a href="#" v-on:click="onClickPrev(currentMonth)">◀</a>
				        {{currentYear}}년 {{currentMonth}}월
				        <a href="#" v-on:click="onClickNext(currentMonth)">▶</a>
				      </h2>
				      <table class="table table-hover">
				          <thead>
				            <tr>
				              <td v-for="(weekName, index) in weekNames" v-bind:key="index">
				                {{weekName}}
				              </td>
				            </tr>
				          </thead>
				          <tbody>
				            <tr v-for="(row, index) in currentCalendarMatrix" :key="index">
				              <td v-for="(day, index2) in row" :key="index2" style="padding:20px;" :class="day>=realDay?'link':''">
				                <span v-if="day>=realDay" @click="change(day)" style="color:black">
					                <span v-if="day===currentDay" class="rounded">
					                  {{day}}
					                </span>
					                <span v-else>
					                  {{day}}
					                </span>
				                </span>
				                <span v-else style="color:gray">
				                   {{day}}
				                </span>
				              </td>
				            </tr>
				          </tbody>
				      </table>    
				  </div>
             </td>
           </tr>
         </table>
       </td>
     </tr>
     <tr>
      <td class="text-center" width=60%>
        <table class="table">
          <caption><h3 class="text-center">시간 정보</h3></caption>
          <tr v-show="tShow">
            <td class="text-center">
               <span class="btn btn-xs" v-for="time in time_list"
               @click="timeSelect(time)">{{time}}</span>
            </td>
          </tr>
        </table>
      </td>
     </tr>
     <tr>
      <td class="text-center" width=60%>
        <table class="table">
          <caption><h3 class="text-center">인원 정보</h3></caption>
          <tr v-show="iShow">
            <td class="text-center">
               <span class="btn btn-xs" v-for="inwon in inwon_list"
               @click="inwonSelect(inwon)"
               >{{inwon}}</span>
            </td>
          </tr>
        </table>
      </td>
     </tr>
     <tr v-show="rShow">
        <td class="text-center" width="60%" colspan="2">
           <input type="button" class="btn-lg btn" value="예약하기"
           @click="reserveOk()">
        </td>
     </tr>
   </table>
  </main>
</div>
<script>
let rApp=Vue.createApp({
	data(){
		return {
			weekNames: ["월요일", "화요일", "수요일","목요일", "금요일", "토요일", "일요일"],
		      rootYear: 1904,
		      rootDayOfWeekIndex: 4, // 2000년 1월 1일은 토요일
		      currentYear: new Date().getFullYear(),
		      currentMonth: new Date().getMonth()+1,
		      currentDay: new Date().getDate(),
		      currentMonthStartWeekIndex: null,
		      currentCalendarMatrix: [],
		      endOfDay: null,
		      memoDatas: [],
		      realDay:new Date().getDate(),
		      type:'운영중',
		      moim_list:[],
		      rno:0,
		      time_list:['12:00','13:00','14:00','15:00','16:00','17:00','18:00','19:00','20:00','21:00'],
		      tShow:false,
		      inwon_list:['2명','3명','4명','5명','6명','7명','8명','9명','10명','단체'],
		      iShow:false,
		      rShow:false,
		      time:'',
		      inwon:''
		      //최종적으로 fno,time,inwon,date 이렇게 4개 보내는거임
		}
	},
	mounted(){
		this.init()
		this.dataSend()
	},
	methods:{
		  init(){
	        this.currentMonthStartWeekIndex = this.getStartWeek(this.currentYear, this.currentMonth);
	        this.endOfDay = this.getEndOfDay(this.currentYear, this.currentMonth);
	        this.initCalendar();
	      },
	      initCalendar(){
	        this.currentCalendarMatrix = [];
	        let day=1;
	        for(let i=0; i<6; i++){
	          let calendarRow = [];
	          for(let j=0; j<7; j++){
	            if(i==0 && j<this.currentMonthStartWeekIndex){
	              calendarRow.push("");
	            }
	            else if(day<=this.endOfDay){
	              calendarRow.push(day);
	              day++;
	            }
	            else{
	              calendarRow.push("");
	            }
	          }
	          this.currentCalendarMatrix.push(calendarRow);
	        }
	      },
	      getEndOfDay(year, month){
	          switch(month){
	              case 1:
	              case 3:
	              case 5:
	              case 7:
	              case 8:
	              case 10:
	              case 12:
	                return 31;
	                break;
	              case 4:
	              case 6:
	              case 9:
	              case 11:
	                return 30;
	                break;
	              case 2:
	                if( (year%4 == 0) && (year%100 != 0) || (year%400 == 0) ){
	                return 29;   
	                }
	                else{
	                    return 28;
	                }
	                break;
	              default:
	                console.log("unknown month " + month);
	                return 0;
	                break;
	          }
	      },
	      getStartWeek(targetYear, targetMonth){
	        let year = this.rootYear;
	        let month = 1;
	        let sumOfDay = this.rootDayOfWeekIndex;
	        while(true){
	          if(targetYear > year){
	            for(let i=0; i<12; i++){
	              sumOfDay += this.getEndOfDay(year, month+i);
	            }
	            year++;
	          }
	          else if(targetYear == year){
	            if(targetMonth > month){
	              sumOfDay += this.getEndOfDay(year, month);
	              month++;
	            }
	            else if(targetMonth == month){
	              return (sumOfDay)%7;
	            }
	          }
	        }
	      },
	      onClickPrev(month){
	        month--;
	        if(month<=0){
	          this.currentMonth = 12;
	          this.currentYear -= 1;
	        }
	        else{
	          this.currentMonth -= 1;
	        }
	        this.init();
	      },
	      onClickNext(month){
	        month++;
	        if(month>12){
	          this.currentMonth = 1;
	          this.currentYear += 1;
	        }
	        else{
	          this.currentMonth += 1;
	        }
	        this.init();
	      },
	      isToday: function(year, month, day){
	        let date = new Date();
	        return year == date.getFullYear() && month == date.getMonth()+1 && day == day; 
	      },
	      //현재 선택한 날짜 출력
	      change(day){
	    	 this.currentDay=day;
	    	 this.tShow=true;
	    	 //this.isToday(this.currentYear,.this.currentMonth,this.currentDay)
	      },
	      //맛집 클릭하면 해당 번호 넘어가는함수
	      moimNumber(rno){
	    	  this.rno=rno;
	      },
	      //모임리스트
	      dataSend(){
	    	  axios.get('../moim/reserve_list_vue.do',{
	    		  params:{
	    			  type:this.type
	    		  }
	    	  }).then(res=>{
	    		  console.log(res.data)
	    		  this.moim_list=res.data
	    	  })
	      },
	      //type구분
	      moimSelect(type){
	    	  this.type=type
	    	  this.dataSend()
	      },
	      //시간
	      timeSelect(time){
	    	  this.time=time
	    	  this.iShow=true
	      },
	      //인원
	      inwonSelect(inwon){
	    	  this.inwon=inwon
	    	  this.rShow=true
	      },
	      //최종데이터전송 => 예약처리 + 화면변경(mypage로)
	      //최종적으로 fno,time,inwon,date 이렇게 4개 보내는거임
	      reserveOk(){
	    	  axios.post('../moim/reserve_ok.do',null,{
	    		  params:{
	    			  //여기 보내는 변수명 rDate같은거는 VO랑 맞춰야함
	    			  rno:this.rno,
	    			  rDate:this.currentYear+"년도 "+this.currentMonth+"월 "+this.currentDay+"일",
	    			  rTime:this.time,
	    			  rInwon:this.inwon
	    		  }
	    	  }).then(res=>{
	    		  if(res.data==='yes')
	    			  location.href="../myAndAdpage/moim_res_my.do"
	    		  else
	    			  alert("소모임 예약 에 실패하셨습니다.")
	    	  }).catch(err => {
	    	        // 오류 발생 시 처리
	    	        console.error('Error occurred while making reservation:', err);
	    	        alert("예약 중 오류가 발생했습니다. 자세한 내용은 콘솔을 확인해주세요.");
	    	  });
	      }
	  }
}).mount("#reserveApp")
</script>
</body>
</html>






