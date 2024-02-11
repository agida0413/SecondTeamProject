	let search=Vue.createApp({
		data(){
			return{
				donStore_list:[],
				ss:'',
				curpage:1,
				totalpage:0,
				startpage:0,
				endpage:0,
				dno:0,
				address:'',
				name:'',
				state:'N'
				
			}
		},
		mounted(){
			
		},
		methods:{
			send() {
	            axios.get("../donstore/search_vue.do", {
	                params: {
	                    ss: this.ss,
	                    page: this.curpage
	                }
	            }).then(res => {
	            
	                this.donStore_list = res.data
	                if (this.donStore_list.length > 0) {
	                    this.dno = this.donStore_list[0].dno
	                    console.log('샌드'+this.dno)
	                }
	                this.donMap()
	                
	            }).catch(error => {
	                console.error("error:", error);
	            })
	            axios.get("../donstore/page_vue.do",{
	            	params:{
	            		ss:this.ss,
	            		page:this.curpage
	            	}
	            }).then(res=>{
	            	this.curpage=res.data.curpage
	            	this.startpage=res.data.startpage
	            	this.endpage=res.data.endpage
	            	this.totalpage=res.data.totalpage
	            })
	         
	        },
	        search(){
	        	   console.log('서치'+this.dno)
	        	this.state='Y'
				let sss=this.$refs.ss.value;
				if(sss=="")
				{
					alert("검색어를 입력하세요")		
					return
				}
				this.send()	
	        	this.donMap()
				
	        	
	        	this.count=this.count+1;
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
				this.send()
			},
			change(page){
				this.curpage=page
				this.send()
			},
			next(){
				this.curpage=this.endpage+1
				this.send()
			},
			dnoSend(dno){
				this.state='N'
				this.dno = dno;
		       
		        this.donMap();
		  },
		  donMap(){
			
			  console.log('돈맵'+this.dno)
			 
			  axios.get("../donstore/detail_vue.do", {
			        params: {
			            dno: this.dno
			        }
			    }).then(res => {
			    
			        this.vo = res.data;
			        this.address = res.data.address;
			        this.name = res.data.name;
			        if (window.kakao && window.kakao.maps) {
			            this.initMap();
			        } else {
			            this.addScript();
			        }
			    });
			},
			addScript(){
				const script=document.createElement("script") // <script>
				/* global kakao */
				script.onload=()=>kakao.maps.load(this.initMap)
				script.src="https://dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=23e8040d553778eeeb77f0900cb92322&libraries=services"
				document.head.appendChild(script)
			},
			initMap(){
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();

			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(this.address, (result, status)=> {

			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {

			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });

			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+this.name+'</div>'
			        });
			        infowindow.open(map, marker);

			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			})
		  }
			
		}
	}).mount("#donSearch")