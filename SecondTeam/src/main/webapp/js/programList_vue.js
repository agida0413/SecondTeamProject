 let programList=Vue.createApp({
		data(){
			return{
				  initialState:[], 
				stateList:[],
				cityList:[],
				major_filedList:[],
				minor_fieldList:[],
				programList:[],
				curpage:1,
				totalpage:0,
				start:0,
				end:0,
				size:0,
				Option:{
				state:'',
				city:'',
				major_option:'',
				minor_option:'',
				active_type:'',
				target_type:'',
				collect_state:'모집중',
				ss:'',
				v_start: new Date().toISOString().split('T')[0], // 오늘 날짜
		        v_end: new Date(new Date().setMonth(new Date().getMonth() + 8)).toISOString().split('T')[0],// 오늘 날짜로부터 1달 후
		        collect_start: new Date().toISOString().split('T')[0], // 오늘 날짜
		        collect_end: new Date(new Date().setMonth(new Date().getMonth() + 8)).toISOString().split('T')[0]// 오늘 날짜로부터 1달 후
		       
				},
				 ssCondition: {
		                N: true,
		                C: false,
		                L: false,
		                F: false
		            },
		            volunteerCondition:{
		            	A:true,
		            	C:true
		            },
		            weekCondition:{
		            
		            	weekday:true,
		            	weekend:true
		            },
		            ssConditionString:'',
		            vtConditionString:'',
		            weekString:'',
		            recommandWordList:[]
		            
			}
			
			
		},
		mounted(){
			this.findClick()
			this.getRecData()
			
		},
		methods:{
			recList(ss){
				console.log(ss)
				this.optionReset();
				this.Option.ss=ss
				this.findClick()
				
			},
		getRecData(){
				axios.get("../program/recommandWord_vue.do").then(response=>{
				
					this.recommandWordList=response.data
					console.log(this.recommandWordList)
				})
		},
			stateChange(){
				axios.get("../program/stateChange_vue.do",{params:this.Option}).then(response=>{
					this.Option.city=''
					this.cityList=response.data
					
				})
			},
			major_fieldChange(){
				axios.get("../program/major_fieldChange_vue.do",{params:this.Option}).then(response=>{
					this.Option.minor_option=''
					this.minor_fieldList=response.data
					
				})
			},
			findClick(){
				
				
					this.curpage=1
				 
		            if (this.ssCondition.N) this.ssConditionString += 'N';
		            if (this.ssCondition.C) this.ssConditionString += 'C';
		            if (this.ssCondition.L) this.ssConditionString += 'L';
		            if (this.ssCondition.F) this.ssConditionString += 'F';
				
		         
		           if (this.volunteerCondition.A) this.vtConditionString+='A';
		            if (this.volunteerCondition.C) this.vtConditionString+='C';
		           
					
					 
					 if (this.weekCondition.weekday) this.weekString+='D';
					 if (this.weekCondition.weekend) this.weekString+='E';
				
				if(this.ssConditionString===''){
					alert('검색키워드조건을 하나이상 체크하세요')
					return;
				}
	    		
				if(this.vtConditionString===''){
					alert('봉사자 유형을 선택하세요')
					return;
				}
				
				if(this.weekString===''){
					alert('요일을 선택해주세요')
					return;
				}
				
				this.initialState = {
					    Option:{...this.Option},
					    ssCondition: {...this.ssCondition},
					    volunteerCondition: {...this.volunteerCondition},
					    weekCondition: {...this.weekCondition},
					    ssConditionString:this.ssConditionString,
			            vtConditionString:this.vtConditionString,
			            weekString:this.weekString
					    
					};
			    
			   this.callList()
				
			   this.ssConditionString=''
			   this.vtConditionString=''
			   this.weekString=''
			   
			},
			callList(){
				axios.post("../program/find_vue.do", this.initialState.Option, {
				    params: {
				        ssConditionString: this.initialState.ssConditionString,
				        vtConditionString:this.initialState.vtConditionString,
				        weekString:this.initialState.weekString,
				        page:this.curpage
				    },
				    headers: {
				        'Content-Type': 'application/json;charset=UTF-8'
				    }
				}).then(response => {
				    this.programList=response.data
				   
				   
				}).catch(error => {
				   
				});
				
				this.paging()
			},
			paging(){
				axios.post("../program/listPage_vue.do", this.initialState.Option, {
				    params: {
				        ssConditionString: this.initialState.ssConditionString,
				        vtConditionString:this.initialState.vtConditionString,
				        weekString:this.initialState.weekString,
				        page:this.curpage
				    },
				    headers: {
				        'Content-Type': 'application/json;charset=UTF-8'
				    }
				}).then(response => {
				 this.totalpage=response.data.totalpage
				 this.start=response.data.start
				 this.end=response.data.end
				 this.curpage=response.data.curpage
				 this.size=response.data.size
				 
				
				
				}).catch(error => {
				   
				});
				
			},
			
			range(start,end){
				let arr=[]
				console.log(start)
				console.log(end)
				let size=end-start;
				for(let i=0;i<=size;i++){
					arr[i]=start;
					start++;
				}
				return arr;
			},
			next(){
				this.curpage=this.end+1
				this.callList()
			},
			prev(){
				this.curpage=this.start-1
				this.callList()
			},
			move(page){
				this.curpage=page
				this.callList()
			},
			firstpage(){
				this.curpage=1
				this.callList()
			},
			lastpage(){
				this.curpage=this.totalpage
				this.callList()
			},
			optionReset(){
				this.Option.state=''
				this.Option.city=''
				this.Option.major_option=''
				this.Option.minor_option=''
				this.Option.active_type=''
				this.Option.target_type=''
				this.Option.collect_state='모집중'
				this.Option.ss=''
				this.Option.v_start= new Date().toISOString().split('T')[0] // 오늘 날짜
				this.Option.v_end= new Date(new Date().setMonth(new Date().getMonth() + 8)).toISOString().split('T')[0]// 오늘 날짜로부터 1달 후
				this.Option.collect_start= new Date().toISOString().split('T')[0] // 오늘 날짜
				this.Option.collect_end= new Date(new Date().setMonth(new Date().getMonth() + 8)).toISOString().split('T')[0]// 오늘 날짜로부터 1달 후
				
				    
				this.ssCondition.N= true
				this.ssCondition.C= false
				this.ssCondition.L= false
				this.ssCondition.F= false
				
				this.volunteerCondition.A=true
				this.volunteerCondition.C=true
				
				this.weekCondition.weekday=true
				this.weekCondition.weekend=true
				
				this.stateChange()
				this.major_fieldChange()
			}

		}
	}).mount('#optionSelect')