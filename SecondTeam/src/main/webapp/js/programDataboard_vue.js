  
  //리스트
  let vDataboard=Vue.createApp({
    	// 멤버변수 
    	data(){
    		return {
    			// 변수 선언 
    			board_list:[],
    			curpage:1,
    			totalpage:0
    		}
    	},
    	// Callback
    	mounted(){
    		this.dataSend()
    	},
    	// 멤버메소드
    	methods:{
    		dataSend(){
    			axios.get('../program/databoardList_vue.do',{
    				params:{
    					page:this.curpage
    				}
    			}).then(response=>{
    				console.log(response.data)
    				this.board_list=response.data
    			})
    			
    			// 페이지 
    			axios.get("../program/databoardPage_vue.do",{
    				params:{
    					page:this.curpage
    				}
    			}).then(response=>{
    				console.log(response.data)
    				this.curpage=response.data.curpage
    				this.totalpage=response.data.totalpage
    			})
    		},
    		prev(){
    			this.curpage=this.curpage>1?this.curpage-1:this.curpage
    			this.dataSend();
    		},
    		next(){
    			this.curpage=this.curpage<this.totalpage?this.curpage+1:this.curpage
    		    this.dataSend()
    		}
    	}
    }).mount('#vDataboard')
    
    
    
    //인서트
    
      let databoardInsert=Vue.createApp({
    	// 멤버변수 설정
    	data(){
    		return {
    			name:'',
    			subject:'',
    			content:'',
    			upfiles:'',
    			Jcheck:'',
    			check:2
    		}
    	},
    	// 멤버함수 설정
    	methods:{
    		// submit버튼 호출시에 => 데이터전송이 없이 submitForm()를 호출 
    		// @submit.prevent
    		// submit / a => defaultPrevent => 이벤트 동작을 중지 
    		submitForm(){
    			// NOT NULL => 유효성 검사 
    			if(this.name==="")
    			{
    				this.$refs.name.focus(); // ref는 태그를 제어 
    				return;
    			}
    			if(this.subject==="")
    			{
    				this.$refs.subject.focus(); // ref는 태그를 제어 
    				return;
    			}
    			if(this.content==="")
    			{
    				this.$refs.content.focus(); // ref는 태그를 제어 
    				return;
    			}
    			
    			
    			
    			if(this.Jcheck===true){
    				this.check=1	
    			}
    			if(this.Jcheck===false || this.Jcheck===''){
    				this.check=2
    			}
    			let formData=new FormData();
    			formData.append("name",this.name);
    			formData.append("subject",this.subject);
    			formData.append("content",this.content);	
    			formData.append("v_check",this.check);
    			let leng=this.$refs.upfiles.files.length;
    			//alert("leng="+leng)
    			// List => [0]
    			if(leng>0)
    			{
    			    for(let i=0;i<leng;i++)
    			    {
    			    	formData.append("files["+i+"]",this.$refs.upfiles.files[i])
    			    }
    		    }
    		
    		
    		// 서버로 전송 
	    		axios.post('../program/databoardInsert_vue.do',formData,{
	    			header:{
	    				'Content-Type':'multipart/form-data'
	    			}
	    		})
	    		.then(response=>{
	    			if(response.data==='yes')
	    			{
	    				location.href="../program/databoardList.do"
	    			}
	    			else
	    			{
	    			    alert(response.data)	
	    			}
	    		}).catch(error=>{
	    			console.log(error.response)
	    		})
    		
    		}//submitForm() end
    	},
    	// CallBack => Vue에 의해 호출되는 함수
    	mounted(){
    		// 시작과 동시에 처리 
    	},
    	updated(){
    		// 데이터를 갱신 => component를 만든 경우 ****
    	}
    }).mount('#databoardInsert')
    