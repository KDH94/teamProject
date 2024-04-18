<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/bootstrap-min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="css/board.css" type="text/css">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>게시판 목록 페이지</title>

<style>
.temp {
    margin: 0 auto; 
    padding: 20px; 
    max-width: 1200px; 
    border-style: none;
    background-color: #ffffff;
    text-align: center; /* 가운데 정렬 추가 */
}

.prodcut-container {
    margin: 20px auto; 
    padding: 20px; 
    max-width: 80%; /* 이미지의 크기를 60%로 조정 */
    border-style: none;
    background-color: #fbfbfb;
    border-radius: 15px;
    box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
}

.searchArea {
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 20px; 
    margin-bottom: 20px; 
}

.logo_search {
    overflow: hidden;
    /* margin-bottom: 20px;  */
}

.logo_search__form {
    width: 100%; 
    height: 100px;
    position: relative;
}


.logo_search__categories {
    width: 30%;
    float: left;
    font-size: 16px;
    color: #1c1c1c;
    font-weight: 700;
    padding-left: 18px;
    padding-top: 11px;
    position: relative;
    margin-left : 50px;
}

.search-input-btn {
    display: inline-block;
    margin-left: 10px;
    position: absolute;
    left: 310px;
}
/* 선택 옵션 컨테이너 스타일 */
.order-options {
    display: flex;
    flex-direction: row; /* 좌우로 정렬 */
    gap: 10px; /* 라디오 버튼 사이의 간격 설정 */
    margin-right: 15px;
    margin-left: 135px;
    margin-top : 5px;
    margin-bottom: -5px;
}

/* 라디오 버튼 컨테이너 스타일 */
.order-options label {
    display: flex;
    align-items: center;
    cursor: pointer;
    transition: transform 0.2s ease-in-out;
}

/* 라디오 버튼 스타일 */
.order-options input[type="radio"] {
    opacity: 0; /* 기본 라디오 버튼 숨기기 */
    position: absolute;
    width: 0;
    height: 0;
}

/* 라디오 버튼 커스텀 디자인 */
.order-options input[type="radio"]+span {
    position: relative;
    padding-left: 25px; /* 라디오 버튼 옆에 여백 추가 */
}

/* 선택된 라디오 버튼 스타일 */
.order-options input[type="radio"]:checked+span::before {
    content: "";
    position: absolute;
    left: 0;
    top: 50%;
    transform: translateY(-50%);
    width: 15px;
    height: 15px;
    border-radius: 50%;
    background-color: #ff673d; /* 선택된 상태일 때 배경색 변경 */
}

/* 선택된 라디오 버튼의 텍스트 스타일 */
.order-options input[type="radio"]:checked+span {
    font-weight: bold; /* 굵은 글꼴 적용 */
}
/* 호버 시 효과 */
.order-options label:hover input[type="radio"]+span {
    transform: translateY(-2px);
}

/* 수정 */

.box {
    width: 100%;
    text-align: center;
    margin-top: 20px;
}

.box .horizontal-list {
    display: flex;
    justify-content: center;
    align-items: center;
    list-style: none;
    padding: 0;
}

.box .horizontal-list li {
    margin: 0 10px; /* 간격 조정 */
}

.point {
    font-size: 18px;
    color: #2C9D59; /* 포인트 텍스트 색상 */
    font-weight: bold; /* 텍스트 굵게 */
    margin-bottom: 5px; /* 포인트 텍스트와 탭 간격 조정 */
}

.select-tab {
    color: #ff673d; /* 선택된 탭 색상 */
    font-weight: bold; /* 텍스트 굵게 */
    border-bottom: 2px solid #ff673d; /* 선택된 탭 하단 경계선 추가 */
    padding-bottom: 3px; /* 선택된 탭 하단 간격 추가 */
}

.temp a{color : black;}
.temp a:focus .temp a:hover #HeaderAllTab a:focus{color : black;}

.temp table {
    border-collapse: collapse;
    width: 100%;
    margin: 10px auto; /* 중앙 정렬 */
}

.temp th, .temp td {
    border-top: none;
    border-bottom: 1px solid #ddd;
    border-right: none;
    padding: 8px;
    text-align: center;
    font-size: 14px;
    font-weight: 400;
    font-style: normal;
    cursor: default;
}

.temp th {
    background-color: #f2f2f2;
    color: #333; /* 헤더의 글자색 변경 */
}

.temp tr:hover {
    background-color: #f5f5f5;
}

.temp tr {
    border: top 1px solid black;
    border-bottom: 1px solid black;
}

.temp td {
    height: 70px;
}

.temp a {
    text-decoration: none;
    color: #02662A;
}
.temp th:first-child,
.temp td:first-child {
    width: 10%; /* 번호 열의 너비 조정 */
}

.temp th {
    font-weight: bold; /* 사용자 이름과 제목 열에 글자 굵게 적용 */
    font-style: italic; /* 사용자 이름과 제목 열에 이탤릭체 적용 */
}

/* 레시피 */
/* 새로운 CSS 스타일 */
.blog__item-box {
    /* margin: 20px; */ /* 여백 조정 */
    padding: 20px;
    max-width: calc(25% - 40px); /* 4개의 열을 만들기 위해 너비 조정 */
    border: 0px solid rgb(179, 211, 179);
    border-radius: 10px;
    box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
    text-align: left; /* 텍스트 왼쪽 정렬 */
    color: #02662A;
    transition: transform 0.3s ease-in-out; /* 호버 효과 */
}

.blog__item-box:hover {
    transform: translateY(-5px); /* 호버 시 약간 위로 이동 */
}

.blog__item-box img {
    width: 100%;
    height: auto;
    border-radius: 8px; /* 이미지를 둥글게 만들기 */
}

.blog__item-box .blog__item__text {
    padding: 20px 0;
}

.blog__item-box .blog__item__text h5 {
    margin-bottom: 10px;
}

.blog__item-box .blog__item__text p {
    margin-bottom: 15px;
}

.blog__item-box .blog__item__text div {
    margin-bottom: 5px;
}

.blog__item-box .blog__item__text a {
    text-decoration: none;
    color: #2C9D59;
}

.blog__item-box .blog__item__text a:hover {
    color: #02662A;
    text-decoration: underline;
}
.blog__item-box .blog__item__pic img {
    width: 100%; /* 부모 요소에 맞게 이미지 크기 조절 */
    height: auto; /* 가로 세로 비율 유지 */
    border-radius: 8px; /* 이미지를 둥글게 만들기 */
}
.date-hit {
	position: absolute;
	bottom: 1px;
	margin-bottom : 15px;
	margin-left: 150px;
	margin-right: 150px;
}
</style>
</head>
<body>
	<%@ include file="layout/header.jsp"%>
	<div id="app">
		<div class="temp">
			<div class="box">
				<li>
					<ul v-if="item.code != 3" v-for="item in boardList"
						:class="[kind == item.code ? 'select-tab' : 'tab']"
						@click="fnList(item.code); fnResetPage()" style="margin: 10px;"
						class="tab-button"><a href="javascript:;">{{item.name}}</a>
					</ul>
				</li>
			</div>
			<div class="prodcut-container">
				<div class="searchArea" style="margin-top: 0px;">
					<div class="logo_search">
			           <div class="logo_search__form">
			               <form action="javascript:;">
			                   <div class="logo_search__categories">
			                       <img src="img/logo/mainLogo.png" style="max-width: 80%;">
			                   </div>
			                   <div class="search-input-btn">
			                   		<div class="order-options">
									    <label>
									        <input type="radio" name="order-option" value="title" v-model="keywordType">
									        <span>제목</span>
									    </label>
									    <label>
									        <input type="radio" name="order-option" value="user" v-model="keywordType">
									        <span>작성자</span>
									    </label>
									</div>
				                   <input type="text" placeholder="검색어를 입력해 주세요" v-model="keyword" @keyup.enter="fnList(kind)">
				                   <button type="submit" class="site-btn" @click="fnList(kind)">검색</button>
			                   </div>
			               </form>
			           </div>
			        </div>
				</div>
			</div>
			<table v-if="kind==1">
				<tr>
					<th>번호</th>
					<th style="width: 50%;">제목</th>
					<th>사용자</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
				<tr v-if="list.length == 0">
					<td colspan="5">검색 결과가 없습니다.</td>
				</tr>
				<tr v-for="(item, index) in list">
					<td>{{ item.boardNo }}</td>
					<td><a href="javascript:;" @click="fnView(item.boardNo, kind)"
						v-html="item.title" style="color: #02662A; font-weight: 600;"></a></td>
					<td><a href="javascript:;" @click="fnUser(item.userId)"
						style="color: #02662A; font-weight: bold;">{{item.userId}}</a></td>
					<td>{{ item.hits }}</td>
					<td>{{ item.cDate }}</td>
				</tr>
			</table>
			<div v-if="kind==2" style="display: flex; flex-wrap: wrap;">
			    <div v-if="list.length == 0" class="box" style="font-weight: bold; margin-top: 10px;">검색 결과가 없습니다.</div>
			    <div class="col-lg-6 col-md-6 col-sm-6 blog__item-box" v-for="(item, index) in list" style="margin-bottom : 10px;">
			        <div style="margin-bottom : 10px; border-radius: 20px;">
			            <div class="blog__item__pic">
			                <a @click="fnView(item.boardNo, kind)" href="javascript:;"><img :src="item.path" alt="Post Image" style="height: 420px;"></a>
			            </div>
			            <div class="blog__item__text">
			                <h5 style="margin-bottom : 10px;">
			                    <a @click="fnView(item.boardNo, kind)" href="javascript:;" style="font-size: 25px; color: #2C9D59; font-family: 'Orbit', sans-serif;">{{truncateText(item.title, 20)}}</a>
			                </h5>
				                <div style="margin-bottom : 10px;">
				                    <i class="fa fa-user"></i> <a href="javascript:;" @click="fnUser(item.userId)" style="color: black; font-size: 20px; font-weight: bold;">{{item.userId}}</a>
				                </div>
				                <div class="date-hit">
				                	<span ><i class="fa fa-calendar"></i> {{item.cDate}}</span>
				                    <span style="margin-left : 10px;"><i class="fa fa-eye"></i>  {{item.hits}}</span>
				                </div>
			            </div>
			        </div>
			    </div>
			</div>
			<div v-if="userId != '' && userId != undefined">
				<button class="write-button" @click="fnWrite"
					v-if="userType == 'A' || kind != 1">글쓰기</button>
			</div>
			<div class="pagination">
				<template v-for="n in pageCount">
					<a href="javascript:;" @click="fnPageList(n)"> <span
						:class="[selectPage == n ? 'page-num' : '']">{{n}}</span>
					</a>
				</template>
			</div>
		</div>
	</div>
	<div class="clear-both"></div>
	<%@ include file="layout/footer.jsp"%>
</body>

<script type="text/javascript">
    var app = new Vue({
        el: '#app',
        data: {
            list: [],
            userId: "${userId}",
            userType : "${userType}",
			keyword : "${map.keyword}",
			keywordType : "${map.keywordType}",
			kind : "${map.code}",
            boardList: ${boardList},
			pageCount : 1,
			selectPage : 1,
            searchCnt : 10, //디폴트 10으로 설정
            fileList : [],
			type : "CDATE",
			offset: 1, // 페이지 오프셋 초기값
			limit: 6, 
        },
       
        methods: {
			fnList : function(kind) {
				var self = this;
				self.kind = kind;
				var limit = 0;
				if(self.kind == ""){
					self.kind = 1;
				}
				if(self.kind == 1){
					limit = 10;
				} else {
					limit = 6;
				}
				var nparmap = {
						keyword : self.keyword,
						keywordType : self.keywordType,
						kind : self.kind,
						startNum : 1,
						lastNum : 10,
						type : self.type,
						order : self.order,
						offset : 0,
						limit : limit
				};
				$.ajax({
					url : "boardList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log("data ==> ", data);
						self.list = data.list;
						self.pageCount = Math.ceil(data.cnt/limit);//self.pageCount최대값

					}
				});
			},
			fnResetPage: function() {
			    var self = this;
			    this.selectPage = 1;
			    this.keyword = "";
			    this.fnList(this.kind); 
			},
           
            fnFileList: function() {
            	var self = this;
            	var nparmap = {
            			kind: self.kind
                    };
                    $.ajax({
                        url: "boardFile.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function(data) {
                        	console.log(data);
                        	self.fileList= data.boardFile;
                        }
                    });
            },
            fnWrite: function() {
                var self = this;
                if (self.userId != "") {
                    $.pageChange("/boardInsert.do", {
                        kind: self.kind
                    });
                } else {
                    alert("로그인 후 이용");
                    $.pageChange("/user-login.do", {});
                }
            },
            fnView: function(boardNo, kind) {
                var self = this;
                if (self.userId != "") {
                    $.pageChange("/boardView.do", {
                        boardNo: boardNo,
                        kind: kind
                    	});
                } else {
                    alert("로그인 후 이용");
                    $.pageChange("/user-login.do", {});
                }
            },
            fnPageList: function(num) {
                var self = this;
                self.selectPage = num;
                var limit = 0;
                if(self.kind == 1){
					limit = 10;
				} else {
					limit = 6;
				}
                var offset = (num - 1) * limit; // 오프셋 계산
                var nparmap = {
                    keyword: self.keyword,
                    keywordType: self.keywordType,
                    kind: self.kind,
                    offset: offset, // 오프셋 전달
                    limit: self.limit, // 리미트 전달
                    type: self.type,
                    order: self.order
                };
                $.ajax({
                    url: "boardList.dox",
                    dataType: "json",
                    type: "POST",
                    data: nparmap,
                    success: function(data) {
                        console.log(data.cnt);
                        self.list = data.list;
                        self.pageCount = Math.ceil(data.cnt / limit); // 전체 페이지 수 계산
                    }
                });
            },
            fnUser: function(userId) {
                var url = "/boardUser.do?userId=" + userId;
                window.open(url, "_blank", "width=500,height=600");
            },
            
            
            truncateText(text, maxLength) {
                if (text.length > maxLength) {
                    return text.slice(0, maxLength) + '...';
                } else {
                    return text;
                }
            },
        },
        created: function() {
        	var self = this;
        	 if (!self.keywordType) {
        	        self.keywordType = "title";
        	    }
            self.fnList(self.kind);
        //    self.fnFileList();
        },
        updated: function () {
            window.scrollTo(0, 0); // 페이지 상단으로 스크롤
        },
        
    });
</script>
</html>
