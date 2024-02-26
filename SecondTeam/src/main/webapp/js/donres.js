const DonRes={
		props:['donStore_list','dno'],
	   template:
		    `<table class="table">
     <tr>
       <td class="text-center" width="80%">
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
                          <td v-for="(day, index2) in row" :key="index2" style="padding:20px;" :class="(day>=realDay &&  sysMonth===currentMonth) || (sysMonth<currentMonth)?'link':''">
                            <span v-if="(day>=realDay &&  sysMonth===currentMonth) || (sysMonth<currentMonth)" @click="change(day)" style="color:black; font-weight:bold;">
                               <span v-if="day===currentDay &&  sysMonth<= currentMonth" class="rounded">
                                 {{day}}
                               </span>
                               <span v-else>
                                 {{day}}
                               </span>
                            </span>
                            <span v-else style="color:gray;">
                               {{day}}
                            </span>
                          </td>
                        </tr>
                      </tbody>
                  </table>    
              </div>
             </td>
             <td>
             <img src="../Projectimages/donres.png">
           </td>
           </tr>          
       </td>
     </tr>
     <tr>
      <td class="text-center" width=60%>
       
          <tead><h3 class="text-center"><i class="far fa-clock"></i><br>방문 시간<br></h3></caption>
          <tr v-show="tShow">
            <td class="text-center" style="display: flex;">
            <button class="form-control selected" v-for="time in time_list" style="margin-left:2px; width: 100px; height: 40px;" @click="timeSelect(time)">{{time}}</button>
            </td>
          </tr>
 
      </td>
     </tr>
     <tr>
      <td class="text-center" width=60%>
      <tead><h3 class="text-center"><i class="fas fa-walking"></i><br>방문 인원<br></h3></caption>
      <tr v-show="iShow" >
        <td class="text-center" style="display: flex; heigth:100px;">
        <button class="form-control selected" v-for="inwon in inwon_list" style="margin-left:2px; width: 70px; height: 40px;" @click="inwonSelect(inwon)">{{inwon}}</button>
        </td>
      </tr>
      </td>
     </tr>
     <tr v-show="rShow">
     <td class="text-center" width="60%">
         <div style="display: flex; justify-content: center;">
             <button class="form-control" style="width: 120px; height: 50px;" @click="reserveOk(dno)">예약하기</button>
         </div>
     </td>
 	</tr>
   </table>`,
   data(){
           return {
              weekNames: ["월", "화", "수","목", "금", "토", "일"],
                 rootYear: 1904,
                 rootDayOfWeekIndex: 4, // 2000년 1월 1일은 토요일
                 currentYear: new Date().getFullYear(),
                 currentMonth: new Date().getMonth()+1,
                 sysMonth:new Date().getMonth()+1,
                 currentDay: new Date().getDate(),
                 currentMonthStartWeekIndex: null,
                 currentCalendarMatrix: [],
                 endOfDay: null,
                 memoDatas: [],
                 realDay:new Date().getDate(),
                 Show:false,
                 time_list:['12:00','13:00','14:00','15:00','16:00','17:00','18:00'],
                 tShow:false,
                 time:'',
                 inwon_list:['1명','2명','3명','4명','5명','6명','단체'],
                 iShow:false,
                 inwon:'',
                 rShow:false
           }
        },
   mounted(){
          this.init()
        },
        methods:{
            reserveOk(dno){
                let form=new FormData()
                form.append("dno",dno),
                form.append("don_resdate",this.currentYear+"년도"+this.currentMonth+"월"+this.currentDay+"일"),
                form.append("don_restime",this.time),
                form.append("don_resinwon",this.inwon)
                axios.post("../main/donres_ok_vue.do",form,{
                   headers:{
                      'Content-Type': 'multipart/form-data' 
                   }
                }).then(res=>{
                   console.log("res:"+dno)
                   alert("방문 예약이 접수되었습니다")
                })
             },
           init(){
               this.currentMonthStartWeekIndex = this.getStartWeek(this.currentYear, this.currentMonth);
               this.endOfDay = this.getEndOfDay(this.currentYear, this.currentMonth);
               this.initCalendar();
             },
           inwonSelect(inwon){
                 this.inwon=inwon
                 this.rShow=true
                 console.log(this.rShow)
              },
              timeSelect(time){
                 this.time=time;
               this.iShow=true;  
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
                 this.currentDay=1;
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
              change(day){
                this.currentDay=day;
                this.tShow=true;
                //this.isToday(this.currentYear,.this.currentMonth,this.currentDay)
              }
          }
   }