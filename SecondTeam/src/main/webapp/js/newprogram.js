 let newProgram=Vue.createApp({
            		data(){
            			return{
            				 formData: {}, // 폼 데이터를 저장할 객체
            				stateList:[],
            				cityList:[],
            				major_filedList:[],
            				minor_fieldList:[],
            				Option:{
            					
            					state:'',
            					city:'',
            					major_option:'',
            					minor_option:''
            					
            				}
           				}
            			
            		},
            		mounted(){
            			
            		},
            		methods:{
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
            			submitForm() {
            				
            				
                            // 폼 제출 메소드
                            var checkboxes = document.getElementsByName("ageType");
                            var checkboxes2 = document.getElementsByName("day");
                            var isChecked = false;
                            var isChecked2 = false;
                            var checkedValues = []; // 체크된 값들을 저장할 배열
                            var checkedValues2 = []; 
                            
                            checkboxes.forEach(function(checkbox) {
                                if (checkbox.checked) {
                                    checkedValues.push(checkbox.value);
                                }
                            });
                            var selectedTypes = checkedValues.join(' '); // 선택된 값들을 쉼표와 공백으로 구분
								
                            checkboxes2.forEach(function(checkbox2) {
                                if (checkbox2.checked) {
                                    checkedValues2.push(checkbox2.value);
                                }
                            });
                            var selectedTypes2 = checkedValues2.join(','); // 선택된 값들을 쉼표와 공백으로 구분
                            
                            let formData = new FormData();
                            formData.append('v_start', this.$refs.v_start.value);
                            formData.append('v_end', this.$refs.v_end.value);
                            formData.append('collect_start', this.$refs.collect_start.value);
                            formData.append('collect_end', this.$refs.collect_end.value);
                            formData.append('si', this.$refs.si.value);
                            formData.append('gu', this.$refs.gu.value);
                            formData.append('major_field', this.$refs.mjo.value);
                            formData.append('minor_field', this.$refs.mno.value);
                            formData.append('active_type', this.$refs.activeType.value);
                            formData.append('target', this.$refs.target.value);
                            
                            formData.append('title', this.$refs.title.value);
                            formData.append('getwing', this.$refs.getwing.value);
                            formData.append('collect_num', this.$refs.collect_num.value);
                            formData.append('address', this.$refs.address.value);
                            formData.append('runtime', this.$refs.runtime.value);
                            
                            formData.append('volunteer_type', selectedTypes);
                            formData.append('rundate', selectedTypes2);
                            
                            
                            for(var i=0; i<checkboxes.length; i++) {
                                if(checkboxes[i].checked) {
                                    isChecked = true;
                                    break;
                                }
                            }
                            
                            for(var i=0; i<checkboxes2.length; i++) {
                                if(checkboxes2[i].checked) {
                                    isChecked2 = true;
                                    break;
                                }
                            }

                            if(!isChecked) {
                                alert("봉사자 유형을 선택해주세요.");
                                return;
                            }
                            
                            if(!isChecked2) {
                                alert("봉사 요일을 선택해주세요.");
                               
                                return;
                            }
                            
                            if(this.$refs.v_start.value===''){
                            	alert('봉사시작 기간을 선택해주세요.')
                            	return;
                            }
                            if(this.$refs.v_end.value===''){
                            	alert('봉사종료 기간을 선택해주세요.')
                            	return;
                            }
                            if(this.$refs.collect_start.value===''){
                            	alert('모집시작기간을 선택해주세요.')
                            	return;
                            }
                            if(this.$refs.collect_end.value===''){
                            	alert('모집종료기간을 선택해주세요.')
                            	return;
                            }
                            if(this.$refs.si.value===''){
                            	alert('지역(시)을 선택해주세요.')
                            	return;
                            }
                            if(this.$refs.gu.value===''){
                            	alert('지역(군/구)을 선택해주세요.')
                            	return;
                            }
                            if(this.$refs.mjo.value===''){
                            	alert('주분야를 선택해주세요.')
                            	return;
                            }
                            if(this.$refs.mno.value===''){
                            	alert('하위분야를 선택해주세요.')
                            	return;
                            }
                            if(this.$refs.activeType.value===''){
                            	alert('활동구분을 선택해주세요.')
                            	return;
                            }
                            if(this.$refs.target.value===''){
                            	alert('봉사분야를 선택해주세요.')
                            	return;
                            }
                            if(this.$refs.title.value===''){
                            	alert('프로그램명을 입력해주세요.')
                            	return;
                            }
                            if(this.$refs.getwing.value===''){
                            	alert('윙갯수를 입력해주세요.')
                            	return;
                            }
                            if(this.$refs.collect_num.value===''){
                            	alert('모집인원을 입력해주세요.')
                            	return;
                            }
                            if(this.$refs.address.value===''){
                            	alert('상세주소를 입력해주세요.')
                            	return;
                            }
                            if(this.$refs.runtime.value===''){
                            	alert('봉사시간을 입력해주세요.')
                            	return;
                            }
                            
                          
                         
                            	

                            // 폼이 유효하면 서버로 데이터를 전송
                            axios.post("../program/newprogramForm.do", formData).then(response => {
                            	
                            	console.log(response.data)
                            	if(response.data==='OK'){
                            		alert('등록에 성공하였습니다.')
                            		location.href="../myAndAdpage/centerProgram.do"
                            	}else{
                            		alert('등록에 실패하였습니다.문의바랍니다.')
                            	}
                                // 성공적으로 처리된 경우
                            })
            		
            		}
            		
            	 }
            	}).mount('#newProgram')