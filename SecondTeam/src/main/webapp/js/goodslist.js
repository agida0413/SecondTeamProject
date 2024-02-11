let goodsList=Vue.createApp({
	data(){
		return{
			goods_list:[],
			find_list:[],
			curpage:1,
			totalpage:0,
			startpage:0,
			endpage:0,
			category:'전체',
			ss:''
		}
	},
	mounted(){
		this.dataRecv()
	},
	methods:{
		dataRecv(){
			axios.get("../goods/goods_list_vue.do",{
				params:{
					page:this.curpage,
					ss: this.ss
				}
			}).then(res=>{
				console.log(res.data)
				this.goods_list=res.data
			})
			axios.get("../goods/page_vue.do",{
            	params:{
            		page:this.curpage,
            		ss: this.ss
            	}
            }).then(res=>{
            	this.curpage=res.data.curpage
            	this.startpage=res.data.startpage
            	this.endpage=res.data.endpage
            	this.totalpage=res.data.totalpage
            })
         
        },
        CateListChange() {
        	this.ss=''
	        if (this.category === '전체') {
	        	this.curpage=1
	        	this.dataRecv();
	        } else {
	        	this.curpage=1
	            this.listChange();
	        }
	    },
		range(start,end){
			let arr=[]
			let leng=end-start
			for(let i=0;i<=leng;i++)
			{
				arr[i]=start
				start++
			}
			return arr;
		},
		prev(){
			this.curpage=this.startpage-1
			if (this.category === '전체') {
	            this.dataRecv();
	        } else {
	            this.listChange();
	        }
		},
		change(page){
			this.curpage=page
			if (this.category === '전체') {
	            this.dataRecv();
	        } else {
	            this.listChange();
	        }
		},
		next(){
			this.curpage=this.endpage+1
			if (this.category === '전체') {
	            this.dataRecv();
	        } else {
	            this.listChange();
	        }
		},
		listChange()  {
		    if (this.category !== '전체') {
		        axios.get("../goods/goods_category_list_vue.do", {
		            params:{
		                page: this.curpage,
		                category: this.category,
		                ss:this.ss
		            },
		            headers: {
		                'Content-Type': 'application/json;charset=UTF-8'
		            }
		        }).then(res => {
		            console.log(this.category);
		            console.log("c:", res.data); 
		            this.find_list = res.data;
		            axios.get("../goods/goods_category_page_vue.do", {
		                params: {
		                    page: this.curpage,
		                    category: this.category,
		                    ss:this.ss
		                }
		            }).then(res => {
		                this.curpage = res.data.curpage;
		                this.startpage = res.data.startpage;
		                this.endpage = res.data.endpage;
		                this.totalpage = res.data.totalpage;
		            }).catch(error => {
		                console.error('error:', error);
		            });
		        }).catch(error => {
		            console.error('error:', error);
		        });
		    } else {
		        this.dataRecv();
		    }
		},
		 search(){
				let sss=this.$refs.ss.value;
				if (this.category === '전체') {
		            this.dataRecv();
		        } else {
		            this.listChange();
		        }
			},
	  }
}).mount("#goodsList")