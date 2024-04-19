<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.3/vue.min.js"></script>
<script src="https://unpkg.com/vue2-editor@2.3.11/dist/index.js"></script>
<script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
<link rel="stylesheet" href="css/teamProj_style.css" type="text/css">
<title>게시글 작성 페이지</title>
<style>
</style>
</head>
<body>
	<%@ include file="layout/header.jsp"%>
	<div id="app">
		<div class="board-con">
			<div class="inputBox">
				<div>
					<select class="sel-box" v-model="kind">
						<option value="1" v-if="userType == 'A'">공지사항</option>
						<option value="2">레시피게시판</option>
					</select>
				</div>
				<input class="title-box" type="text" v-model="title"
					placeholder="제목을 입력하세요">
			</div>
			<div v-if="kind == 2" class="inputBox">
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
				<div id="editor" style="height: 300px;"></div>
			</div>
			<div style="text-align: center;">
				<button class="insert-btn" @click="fnWrite">작성완료</button>
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