<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/bootstrap-min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>게시판 목록 페이지</title>
<style>
.temp div {
	text-align: center;
}

.temp table {
	border-collapse: collapse;
	width: 80%;
	margin: 10px auto;
}

.temp th, td {
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

.temp tr:hover {
	background-color: #f5f5f5;
}

.temp tr {
	border: top 1px solid black;
	border-bottom: 1px solid black;
}

.temp th {
	background-color: #f2f2f2;
}

.temp button {
	margin-top: 10px;
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 4px;
	transition: background-color 0.3s;
	display: inline-block;
}

.temp button:hover {
	background-color: #45a049;
}

.temp li {
	display: inline-block;
}

.temp ul {
	padding: 5px 10px;
	cursor: default;
	color: black;
	border-radius: 4px;
	display: inline-block;
	margin-right: 10px;
	font-size: 30px;
	transition: font-size 0.3s;
}

.temp ul:hover {
	font-size: 40px;
}

.temp ul:active {
	font-size: 35px;
}

.temp td {
	height: 70px;
}

.temp a {
	text-decoration: none;
}

.pagination {
	display: flex;
	justify-content: center;
	align-items: center;
}

.pagination a {
	margin: 0 5px; /* 페이지 링크 간격 조절 */
}

.page-num {
	font-weight: bold;
	font-size: 30px;
}

.write-button {
	float: right;
	margin-right: 190px;
	font-size: 20px;
}

.clear-both {
	clear: both;
	margin-bottom: 10px;
}

.blog__item-box {
	/* background-color: lightgrey; */
	padding: 10px;
	border: 1px solid rgb(179, 211, 179);
	width: 400px; /* 원하는 너비 값으로 조정 */
	margin: 60px; /* 원하는 마진 값으로 조정 */
	border-radius: 10px;
	color: #02662A;
}

.tab-button:focus, .tab-button:hover {
	color: green;
}

.box {
	width: 100%;
	height: 40%;
	/* background-color: #cccccc; */
	text-align: center;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

.box .horizontal-list {
	display: inline-block;
	list-style: none;
	padding: 0;
}

.box .horizontal-list li {
	display: inline-block;
	margin: 0 100px;
}

.point {
	font-size: 20px;
}

.select-tab {
	color: green;
	font-weight: bold;
}

.horizontal-list {
	cursor: default;
}

.dateHits{
   text-align: center;
   /*  margin-left: 150px  */
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
						class="tab-button">{{item.name}}
					</ul>
				</li>
			</div>
			<div>
				<select v-model="keywordType">
					<option value="title">제목</option>
					<option value="user">작성자</option>
				</select> 검색: <input type="text" v-model="keyword"
					@keyup.enter="fnList(kind)">
				<button @click="fnList(kind)">검색</button>
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
				<div v-if="list.length == 0" class="box"
					style="font-weight: bold; margin-top: 10px;">검색 결과가 없습니다.</div>
				<div class="col-lg-3 col-md-3 col-sm-3 blog__item-box"
					v-for="item in list" style="color: #02662A;">
					<div class="blog__item">
						<div class="blog__item__pic">
							<template v-for="item2 in fileList"
								v-if="item.boardNo == item2.boardNo">
								<template v-if="item2.kind == 1">
									<img :src="item2.path" alt="" width="350px" height="250px">
								</template>
							</template>
						</div>
						<div class="blog__item__text">
							<div class="dateHits">
								<div>
									<i class="fa fa-calendar"></i> {{item.cDate}}
								</div>
								<div>
									<i class="fa fa-eye"></i> {{item.hits}}
								</div>
							</div>
							<h5>
								<a @click="fnView(item.boardNo, kind)" href="javascript:;"
									style="font-size: 35px; color: #2C9D59; font-family: 'Orbit', sans-serif;">
									{{truncateText(item.title, 10)}}</a>
							</h5>
							<p>
								<span v-html="truncateText(item.contents, 50)"
									style="color: #02662A;"></span>
							</p>
							<div>
								<i class="fa fa-user"></i> <a href="javascript:;"
									@click="fnUser(item.userId)"
									style="color: #2C9D59; font-size: 20px; font-weight: bold;">
									{{item.userId}}</a>
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
			limit: 9, 
        },
      
        methods: {
			fnList : function(kind) {
				var self = this;
				self.kind = kind;
				var nparmap = {
						keyword : self.keyword,
						keywordType : self.keywordType,
						kind : kind,
						startNum : 1,
						lastNum : 10,
						type : self.type,
						order : self.order,
						offset : 0,
						limit : 9
				};
				$.ajax({
					url : "boardList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						self.list = data.list;
						self.pageCount = Math.ceil(data.cnt/10);//self.pageCount최대값
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
                var offset = (num - 1) * self.limit; // 오프셋 계산
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
                        self.pageCount = Math.ceil(data.cnt / self.limit); // 전체 페이지 수 계산
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
            self.fnFileList();
        },
        updated: function () {
            window.scrollTo(0, 0); // 페이지 상단으로 스크롤
        },
        
    });
</script>
</html>
