	let programDetail = Vue.createApp({
	    data() {
	        return {
	            address: '${vo.centername}',
	            sigu: '${vo.si}' + ' ' + '${vo.gu}',
	            state: 'Y'
	        }
	    },
	    mounted() {
	        if (window.kakao && window.kakao.maps) {
	            this.initMap();
	        } else {
	            this.addScript();
	        }
	    },
	    methods: {
	        addScript() {
	            const script = document.createElement("script");
	            script.onload = () => kakao.maps.load(this.initMap);
	            script.src = "https://dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=c2368186c0091fdb14d91b7b4aa613ff&libraries=services";
	            document.head.appendChild(script);
	        },
	        initMap() {
	            var mapContainer = document.getElementById('map');
	            var mapOption = {
	                center: new kakao.maps.LatLng(33.450701, 126.570667),
	                level: 3
	            };
	            var map = new kakao.maps.Map(mapContainer, mapOption);
	            var geocoder = new kakao.maps.services.Geocoder();
	            
	            geocoder.addressSearch(this.address, (result, status) => {
	                if (status === kakao.maps.services.Status.OK) {
	                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	                    this.displayMarker(map, coords);
	                    map.setCenter(coords);
	                } else {
	                    this.state = 'N';
	                    this.trySecondSearch(map, geocoder);
	                }
	            });
	        },
	        trySecondSearch(map, geocoder) {
	            if (this.state === 'N') {
	                geocoder.addressSearch(this.sigu, (result, status) => {
	                    if (status === kakao.maps.services.Status.OK) {
	                        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	                        this.displayMarker(map, coords);
	                        map.setCenter(coords);
	                    }
	                });
	            }
	        },
	        displayMarker(map, coords) {
	            var marker = new kakao.maps.Marker({
	                map: map,
	                position: coords
	            });

	            var infowindow = new kakao.maps.InfoWindow({
	            	content: '<div style="width:150px;text-align:center;padding:6px 0;">' + (this.state === 'Y' ? this.address : this.sigu) + '</div>'

	               
	            });

	            infowindow.open(map, marker);
	        }
	    }
	    
	}).mount('#programDetail');