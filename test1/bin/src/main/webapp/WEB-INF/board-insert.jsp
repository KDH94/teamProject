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
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
	rel="stylesheet">
<script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.3/vue.min.js"></script>
<script src="https://unpkg.com/vue2-editor@2.3.11/dist/index.js"></script>
<title>boardInsert 페이지</title>
<style>
button {
	margin: 100px;
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

.board-con {
	width: 800px;
	margin-left: auto;
	margin-right: auto;
	padding: 30px;
	background-color: #f9f9f9;
	color: #333;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

#inputBox, #inputBox1 {
	padding: 8px;
	border-radius: 4px;
	border: 1px solid #ccc;
	box-sizing: border-box;
	margin-top: 10px;
}

input {
	padding: 0px;
}

.img-box {
	margin-bottom: 10px;
}

.title-box {
	margin-top: 10px;
	width: 720px;
	height: 40px;
	padding-left: 15px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.title-box:focus {
	border: 1px solid #777;
}

.sel-box {
	border: none;
	border-bottom: 1px solid #ccc;
	background-color: rgba(0, 0, 0, 0);
	width: 300px;
	height: 40px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	margin-left: 5px;
	font-weight: bold;
}

.img-con {
	margin-bottom: 10px;
}
</style>
</head>

<body>
	<%@ include file="layout/header.jsp"%>
	<div id="app">
		<div class="board-con">
			<div id="inputBox">
				<div>
					<select class="sel-box" v-model="kind">
						<option value="1" v-if="userType == 'A'">공지사항</option>
						<option value="2">레시피게시판</option>
					</select>
				</div>
				<input class="title-box" type="text" v-model="title"
					placeholder="제목을 입력하세요">
			</div>
			<div v-if="kind == 2" id="inputBox1">
				<div class="img-con">
					<div class="img-box">
						메인 이미지: <input type="file" class="file-box" id="file1"
							name="file1" accept=".jpg,.png,.gif">
					</div>
					<div>
						내용 이미지: <input type="file" class="file-box" id="file2"
							name="file2" accept=".jpg,.png,.gif" multiple>
					</div>
				</div>
			</div>
			<div style="margin-top: 10px;">
				<div id="editor" v-model="contents" style="height: 300px;"></div>
			</div>
			<div class="writeButton" style="text-align: center; margin: 20px;">
				<button @click="fnWrite">작성완료</button>
			</div>
		</div>
	</div>
	<%@ include file="layout/footer.jsp"%>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			info : {},
			userId : "${userId}",//변수선언
			kind : "${map.kind}",//컨트롤러에서 가져온 map꺼내서 위에서 사용
			title : "${title}",
			contents : "${contents}",
			userType : "${userType}"
		}
		
		,
		methods : {
			fnWrite : function() {
				var self = this;
	            if(self.title == "") {
	            	alert("제목이 빈칸입니다");
	            	return;
	            }else if (self.contents == "") {
	                alert("내용이 빈칸입니다");
	                return;
	            }else if (self.kind == 2 && $("#file1")[0].files.length === 0) {
	                alert("메인 이미지를 선택해주세요");
	                return;
	            }
				var nparmap = {
					userId : self.userId,
					title : self.title,
					contents : self.contents,
					kind : self.kind
				};
				$.ajax({
					url : "boardInsert.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if (data.result == "success") {
							alert("작성되었습니다");
							if(self.kind == 2) {
	                		var files = $("#file1")[0].files;
                			var formMain = new FormData();
                			formMain.append( "file1",  files[0]);
                            formMain.append("boardNo", data.boardNo);
                            self.uploadMain(formMain);
	                		
	                		var files2 = $("#file2")[0].files;
	                        for(var y =0 ; y<files2.length;y++){
	                        	var formContents = new FormData();
	                        	 formContents.append("file2",files2[y]);
	                        	 formContents.append("boardNo", data.boardNo);
	                             self.uploadContents(formContents);
	                        		}
								}
	                        
	                        setTimeout(() => {
	                        	$.pageChange("/boardList.do", {kind: self.kind});
	                        }, 1000);
							
	                        
							
						} else {
							alert("다시 시도해주세요");
						}
					}
				});
				
			},
			uploadMain : function(form){
		    	var self = this;
		         $.ajax({
		             url : "/boardFileUploadMain.dox"
		           , type : "POST"
		           , processData : false
		           , contentType : false
		           , data : form
		           , success:function(response) { 
		        	   
		           }	           
		       });
			},
			
			uploadContents : function(form){
		    	var self = this;
		         $.ajax({
		             url : "/boardFileUploadContents.dox"
		           , type : "POST"
		           , processData : false
		           , contentType : false
		           , data : form
		           , success:function(response) { 
		        	   
		           }	           
		       });
			}
		},
		mounted: function () {
	        // Quill 에디터 초기화
	        var quill = new Quill('#editor', {
	            theme: 'snow',
	            modules: {
	                toolbar: [
	                    [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
	                    ['bold', 'italic', 'underline'],
	                    [{ 'list': 'ordered'}, { 'list': 'bullet' }],
	                    ['link', 'image'],
	                    ['clean']
	                ]
	            }
	        });

	        // 에디터 내용이 변경될 때마다 Vue 데이터를 업데이트
	        quill.on('text-change', function() {
	            app.contents = quill.root.innerHTML;
	        });
	    },
		created : function() {
			var self = this;
		}
	});
</script>