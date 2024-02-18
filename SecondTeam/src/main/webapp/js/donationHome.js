let donateCamapp=Vue.createApp({
	 data(){
		return{
			donatecam_list:[]
		} 
	 },
	 mounted(){
		 this.dataRecv()
	 },
	 methods:{
		 dataRecv(){
			 axios.get('../donation/donationHomeList.do',null).then(response=>{
				console.log(response.data) 
				this.donatecam_list=response.data
			 })
		 }
	 }
 }).mount('#donateCamApp')