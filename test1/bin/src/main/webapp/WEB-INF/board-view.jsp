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
<link
	href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Gaegu&family=IBM+Plex+Sans+KR&family=Orbit&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>첫번째 페이지</title>
</head>
<style>
.boardViewTable {
	width: 60%;
	margin: 10px auto;
}

button {
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 4px;
	transition: background-color 0.3s;
}

button:hover {
	background-color: #45a049;
}

a {
	text-decoration: none;
}

.buttons {
	text-align: center;
	margin: 30px;
}

.titleBox {
    width: 100%;
    border-bottom: none;
    padding: 20px;
    background-color: #f0f0f0;
    border-radius: 8px 8px 0 0; /* 상단만 둥글게 */
    
}

.contentsBox {
    width: 100%;
    height: auto;
    padding: 20px;
    background-color: #ffffff;
    border-radius: 0 0 8px 8px; /* 하단만 둥글게 */
    border: 1px solid #ddd; /* 테두리 추가 */
    margin-top: -1px; /* 제목과 내용 사이 간격 조정 */
    min-height: 300px;
    text-align: center;
}

.title {
	font-size: 22px;
}

.contents {
	font-size: 22px;
}

.writerDateHits {
	font-size: 12px;
	color: #999;
}
</style>
<body>
	<%@ include file="layout/header.jsp"%>
	<div id="app">
		<div class="boardViewTable">
			<div class="titleBox">
				<div class="title">{{info.title}}</div>
				<div class="writerDateHits">
					작성자 : {{info.nickName}}
					<div>작성날짜 : {{info.cDateTime}} 조회수 : {{info.hits}}</div>
				</div>
			</div>
			<div class="contentsBox">
				<div>
					<template v-if="kind == '2'">
						<template v-for="item in fileList">
							<template v-if="item.kind == 2">
								<img :src="item.path" alt="">
							</template>
						</template>
					</template>
					<span v-html="info.contents"> {{info.contents}} </span>
				</div>
			</div>
		</div>
		<div class="buttons" v-if="info.userId == userId || userType == 'A'">
			<button @click="fnDelete">삭제</button>
			<button @click="fnEdit">수정</button>
			<button @click="fnList(kind)">목록으로 가기</button>
		</div>
	</div>
	<%@ include file="layout/footer.jsp"%>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			boardNo : "${map.boardNo}",
			info : {},
			userId : "${userId}",
			kind : "${map.kind}",
			userType : "${userType}",
			fileList : []
		},
		methods : {
			fnView : function() {
				var self = this;
				var nparmap = {
					boardNo : self.boardNo
				};
				$.ajax({
					url : "boardView.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						self.info = data.info;
						// 3. self.fileList에 data에 있는 fileList를 넣기
						self.fileList = data.fileList;
					}
				});
			},
			fnDelete : function() {
				var self = this;
				if (!confirm("삭제하겠습니까")) {
					return;
				}
				var nparmap = {
					boardNo : self.boardNo
				};
				$.ajax({
					url : "boardDelete.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						/* self.info = data.info; */
						if (data.result == "success") {
							alert("삭제되었습니다");
							$.pageChange("/boardList.do", {});
							//location.href = "/boardList.do"
						} else {
							alert("다시 시도해주세요");
						}
					}
				});
			},
			fnList : function(kind) {
				$.pageChange("/boardList.do", {
					code : kind
				});
			},
			fnEdit : function() {
				var self = this;
				$.pageChange("/boardEdit.do", {
					boardNo : self.boardNo,
					kind : self.kind
				});
			}

		},
		created : function() {
			var self = this;
			self.fnView();
		}
	});
</script>