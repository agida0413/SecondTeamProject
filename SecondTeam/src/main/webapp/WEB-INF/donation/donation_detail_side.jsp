<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.collect_side{
    float: left;
    width: 282px;
    font-size: 15px;
    border: 1px solid #ccc;
}
.section_status {
    margin: 0 1px;
    padding: 23px 29px 27px;
    border-bottom: 0;
}
.collect_side .section_status .term_area p {
    padding: 13px 0 11px;
    font-size: 18px;
    color: #888;
    letter-spacing: -.04em;
}
.collect_side .section_status .term_area p strong {
    display: inline-block;
    font-size: 18px;
    font-weight: 400;
    vertical-align: text-top;
}
.collect_side .section_status .term_area p span {
    display: inline-block;
    margin: -1px 0 0 2px;
    vertical-align: text-top;
}
.collect_side .section_status .term_area div {
    min-height: 21px;
    padding-left: 2px;
}
.collect_side .section_status .term_area div span {
    display: inline-block;
    height: 40px;
    padding: 1px 10px 0;
    margin-right: 5px;
    border-radius: 2px;
    background: #f86f46;
    font-size: 30px;
    font-weight: 700;
    color: #fff;
    line-height: 30px;
    text-align: center;
    vertical-align: middle;
}
.collect_side .section_status .num_area {
    padding-top: 24px;
}
.section_status .num_area .status_num {
    padding-bottom: 0;
    font-size: 18px;
    color: #444;
}
.section_status .num_area .status_num strong {
    display: inline-block;
    font-size: 25px;
    font-weight: 400;
    color: #444;
    letter-spacing: -0.3px;
    vertical-align: text-top;
}
.section_status .num_area .status_num span {
    display: inline-block;
    margin: 8px 0 0 4px;
    vertical-align: text-top;
}
.num_area .detail_num.v2 {
    margin: 6px 0 0 0;
    color: #888;
}
.num_area .detail_num strong {
    font-weight: 400;
    vertical-align: middle;
}
.num_area .detail_num span {
    font-size: 16px;
    vertical-align: middle;
}
.graph_status .per {
    float: left;
    font-size: 24px;
    color: #00ab33;
}
.graph_status .per strong {
    font-size: 53px;
    font-weight: 700;
    line-height: 70px;
    letter-spacing: -2px;
}
.collect_side .section_btn {
    line-height: 0;
    font-size: 0;
    vertical-align: top;
}
.collect_side .btn {
    display: inline-block;
    width: 282px;
    height: 60px;
    padding-top: 17px;
    border: 1px solid rgba(0,0,0,.1);
    background: #10c838;
    font-size: 22px;
    font-weight: 700;
    color: #fff;
    text-decoration: none;
    text-shadow: 0 0 1px #086a1e;
    text-align: center;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    border-radius: 0px;
}
</style>
</head>
<body>
	<div class="collect_side">
                <!-- 후원상태 -->
                <!-- [D]진행기간 마감일 경우 end 추가 -->
                <div class="section_status">
                            <div class="graph_status" style="padding-bottom: 75px;">
                                <span class="per"><strong class="num">10</strong>%</span>
                            </div>
                            <div class="card_bar">
		                      <span class="card_bar_collection" style="width: 50%;"></span>
		                    </div>
                    

                    <div class="term_area">
                        <p>
                            <strong>
                                2024.02.15 ~
                                2024.03.31
                            </strong><span>까지</span>
                        </p>
                         <div>
                            <span class="d_day">D<em class="bar">-</em>40</span>
                         </div>
                          
                    </div>
                    <div class="num_area">
                        <p class="status_num"><span>현재 모금:&nbsp;</span><strong>264,700</strong><span>원</span></p>
                        <p class="status_num"><span>목표 :&nbsp;</span><strong>264,700</strong><span>원</span></p>
                        
                    </div>
                    
                </div>
                <!-- //후원상태 -->

                <!-- 버튼 -->
                <div class="section_btn">
                    <a href="#" class="btn donate jq_donate" data-google="모금함_View" data-stat="기부하기_상단_BTN_CLK">모금함 기부하기</a>
                </div>
  </div>
</body>
</html>