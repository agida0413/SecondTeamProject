<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<div class="container" id="goodsList" style="margin-top: 50px;">
    <div class="row mb-4">
        <div class="col-sm-6">
            <h2 class="posts-entry-title">전체 상품</h2>
        </div>
        <div class="col-sm-6 text-sm-end"><a href="../main/main.do" class="read-more">Main Home</a></div>
    </div>

    <div class="row">
        <div class="col-lg-4 mb-4" v-for="(vo, index) in goods_list" :key="index">
            <div class="post-entry-alt">
                <a href="#" class="img-link">
                    <img :src="vo.g_img" alt="Image" class="img-fluid">
                </a>
                <div class="excerpt">
                    <h2 style="font-weight: bold"><a href="single.html">{{vo.g_name}}</a></h2>
                    <h4>{{vo.g_price}}</h4>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<li class="page-item" v-if="startpage>1"><a class="page-link" href="#"
								aria-label="Previous" @click="prev()"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<li class="page-item" v-for="i in range(startpage,endpage)" :class="curpage===i?'active':''"><a class="page-link" href="#" @click="change(i)">{{i}}</a></li>
							<li class="page-item" v-if="endpage<totalpage"><a class="page-link" href="#"
								aria-label="Next" @click="next()"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
				</div>
</div>
<script>
let goodsList=Vue.createApp({
	data(){
		return{
			goods_list:[],
			curpage:1,
			totalpage:0,
			startpage:0,
			endpage:0
		}
	},
	mounted(){
		this.dataRecv()
	},
	methods:{
		dataRecv(){
			axios.get("../goods/goods_list_vue.do",{
				params:{
					page:this.curpage
				}
			}).then(res=>{
				console.log(res.data)
				this.goods_list=res.data
			})
			axios.get("../goods/page_vue.do",{
            	params:{
            		page:this.curpage
            	}
            }).then(res=>{
            	this.curpage=res.data.curpage
            	this.startpage=res.data.startpage
            	this.endpage=res.data.endpage
            	this.totalpage=res.data.totalpage
            })
         
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
			this.dataRecv()
		},
		change(page){
			this.curpage=page
			this.dataRecv()
		},
		next(){
			this.curpage=this.endpage+1
			this.dataRecv()
		}
	  }
}).mount("#goodsList")
</script>
</body>
</html>