let mgApp=Vue.createApp({
		data(){
			return{
				goods_main:[]
			}
		},
		mounted(){
			this.goodsMain()
		},
		methods:{
			goodsMain(){
				axios.get("../goods/mainGoodsList.do").then(res=>{
					console.log(res.data)
					this.goods_main=res.data
				})
			}
			
		}
	}).mount("#mgApp")