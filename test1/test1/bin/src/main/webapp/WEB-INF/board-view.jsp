<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/team_project_style.css">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>첫번째 페이지</title>
</head>
<style>
body {
	font-family: Arial, sans-serif;
}

table {
	margin: 10px;
	border-collapse: collapse;
	width: 100%;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
	font-size: 14px;
	font-family: Arial, sans-serif;
}

th {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #f5f5f5;
}

button {
	margin-top: 10px;
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 4px;
	transition: background-color 0.3s;
	font-family: Arial, sans-serif;
}

button:hover {
	background-color: #45a049;
}
</style>
<body>
	<div id="app">
		<table>
			<tr>
				<th width="20%">제목</th>
				<td width="80%">{{info.title}}</td> 
			</tr>
			<tr>
				<th>작성자</th>
				<td>{{info.nickName}}</td>
			</tr>
			<tr>
				<th>내용</th> 
				<td>
					<template v-if="kind == '2'">
<<<<<<< HEAD
						<img alt="adasdasda" src="../img/recipe1.jpg" width="150px">
=======
						<template  v-for="item in fileList" v-if="boardNo == item.boardNo">
							<template v-if="item.kind == 2">
					    		<img :src="item.path" alt="" width="150px">
							</template>
						</template>
>>>>>>> branch 'main' of https://github.com/KDH94/teamProject.git
					</template>
					<span v-html="info.contents">
						{{info.contents}}
					</span>
				</td>
			</tr>
		</table>
<<<<<<< HEAD
=======
		<div v-if="info.userId == userId || userType == 'A'">
			<button @click="fnDelete">삭제</button>
			<button @click="fnEdit">수정</button>
		</div> 
>>>>>>> branch 'main' of https://github.com/KDH94/teamProject.git
	<!-- <div v-if="info.userId == sessionId || sessionStatus == 'A'">
			<button @click="fnRemove">삭제</button>
		</div> -->
		<div>
			<button @click="fnEdit">수정</button>
			<button @click="fnDelete">삭제</button>
			<button @click="fnList">목록으로 가기</button>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	boardNo : "${map.boardNo}",
    	info : {},
<<<<<<< HEAD
=======
    	userId : "${userId}",
    	kind: "${map.kind}",
    	userType : "${userType}",
    	fileList : []
>>>>>>> branch 'main' of https://github.com/KDH94/teamProject.git
    	userId : "${userId}"
    	
    }   
    , methods: {
    	fnView : function(){
            var self = this;
            var nparmap = {boardNo : self.boardNo};
            $.ajax({
                url:"boardView.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.info = data.info;
	                }
	            }); 
    	    },
			fnDelete : function(){
				var self = this;
				if (!confirm("삭제하실")) {
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
			fnList : function(){
				location.href = "/boardList.do";
			},
			fnEdit : function(){
				var self = this;
<<<<<<< HEAD
=======
				$.pageChange("/boardEdit.do", { boardNo : self.boardNo, kind : self.kind });
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
>>>>>>> branch 'main' of https://github.com/KDH94/teamProject.git
				$.pageChange("/boardEdit.do", { boardNo : self.boardNo });
			}

        },
		created : function() {
			var self = this;
			self.fnView();
			self.fnFileList();
		}
	});	
</script>