<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>첫번째 페이지</title>
</head>
<style>
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.3/vue.min.js"></script>
	<script src="https://unpkg.com/vue2-editor@2.3.11/dist/index.js"></script>
<body>
	<div id="app">
		<div>
			상품 카테고리 : 
			<select v-model="code">
				<option value="gluten">글루텐프리</option>
				<option value="local">로컬푸드</option>
				<option value="org">유기농</option>
				<option value="vegan">비건</option>
			</select>
		</div>
		<div>
			상품명 : <input type="text" v-model="name">
		</div>
		<div>
			가격 : <input type="text" v-model="price">
		</div>
		<div>
			할인율 : <input type="text" v-model="Srate">
		</div>
		<div>
			적립율 : <input type="text" v-model="Prate">
		</div>
		
		<div>
		현재 리스트 썸네일 이미지 : 
		<template v-for="item in mainFile">
		<img :src="item.filePath+item.fileName" alt="썸네일">
		<button @click="fnFileDelete(item.fileNo)">◀X</button>
		</template>
		
		</div>
		<tr>
				<td width="30%">리스트 썸네일 이미지 : </td>
				<td width="70%"><input type="file" id="file1" name="file1" accept=".jpg,.png,.gif"></td>
			</tr>
		<div>
		<div>
		현재 컨텐츠 썸네일 이미지 : 
		<template v-for="item in contentsFile">
		<img :src="item.filePath+item.fileName">
		<button @click="fnFileDelete(item.fileNo)">◀X</button>
		</template>
		
		</div>
		<tr>
			<td width="30%">컨텐츠 썸네일에 들어갈 이미지 : </td>
			<td width="70%"><input type="file" id="file2" name="file2" accept=".jpg,.png,.gif"></td>
		</tr>
		</div>
		<div>
			
			내용 : <vue-editor v-model="contents"></vue-editor>
			
		</div>
		
		<div>
			배송정보 :
			<select v-model="trans">
				<option value="무료배송">무료배송</option>
				<option value="유료배송">유료배송</option>
			</select>

		</div>
		<div>
			품절 여부 : 
			<select v-model="sellYN">
				<option value="Y">재고있음</option>
				<option value="N">재고없음</option>	
			</select>
		</div>
		<div>
			재고 갯수 : <input type="text" v-model="cnt">
		</div>
	
	<button @click="ProductUpdate()">등록하기</button>
	<button @click="fnReturn">돌아가기</button>
	</div>
</body>
</html>
<script type="text/javascript">
Vue.use(Vue2Editor);
const VueEditor = Vue2Editor.VueEditor;
var app = new Vue({
    el: '#app',
    data: {
    	itemNo : "${map.itemNo}",
    	code:"",
    	name:"",
    	price:"",
    	Srate:"",
    	Prate:"",
    	contents:"",
    	trans:"",
    	sellYN:"",
    	cnt:"",
    	mainFile : [],
    	contentsFile : []
    	
    	
    }
	, components: {VueEditor}
    , methods: {
    	fnView: function() {
            var self = this;
            var nparmap = {
            		itemNo : self.itemNo
            };
            $.ajax({
                url:"AdminProductView.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success: function(data) {
                	console.log(data);
                	if(data.result=="success"){
                		self.code = data.item.code;
                		self.name = data.item.itemName;
                		self.price = data.item.price;
                		self.Srate = data.item.sRate;
                		self.Prate = data.item.pRate;
                		self.contents = data.item.contents;
                		self.trans = data.item.transInfo;
                		self.sellYN = data.item.sellYn;
                		self.cnt = data.item.cnt;
                		var mainCnt = 0;
                		var contentsCnt = 0;
                		for(var i=0 ; i<data.filelist.length;i++){
                			if(data.filelist[i].kind == "1"){
                				self.mainFile[mainCnt] = data.filelist[i];
                				mainCnt++;
                			}if(data.filelist[i].kind =="2"){
                				self.contentsFile[contentsCnt] = data.filelist[i];
                				contentsCnt++;
                			}
                		}console.log(self.mainFile);
                		console.log(self.contentsFile);
                	}
                	
                }
            });
        },
        ProductUpdate : function(){
                var self = this;
                var nparmap = {
                		code : self.code,
                		name : self.name,
                		price : self.price,
                		Srate : self.Srate,
                		Prate : self.Prate,
                		contents : self.contents,
                		trans : self.trans,
                		sellYN : self.sellYN,
                		cnt : self.cnt,
                		itemNo : self.itemNo	
                };
                $.ajax({
                    url:"AdminProductUpdate.dox",
                    dataType:"json",
                    type: "POST",
                    data: nparmap,
                    success: function(data) {
                    	if(data.result=="success"){
                    		
                    		alert("등록완료");
                    		
                    		/* 이 부분에 이미지를 수정하는 작업을 해줄것임 */
                            
                            location.href="AdminProductList.do";
                            
                    	}else{
                    		alert("등록실패");
                    	}
                    	
                    }
                });
        }
        // 파일 업로드
	    , uploadMain : function(form){
	    	var self = this;
	         $.ajax({
	             url : "/fileUploadMain.dox"
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
	             url : "/fileUploadContents.dox"
	           , type : "POST"
	           , processData : false
	           , contentType : false
	           , data : form
	           , success:function(response) { 
	        	   
	           }	           
	       });
		},
		fnFileDelete : function(fileNo){
            var self = this;
            var nparmap = {
            		
            		fileNo : fileNo	
            };
            $.ajax({
                url:"fileDelete.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success: function(data) {
                	if(data.result=="success"){
                		alert("삭제완료");
                		$.pageChange("/AdminProductUpdate.do",{itemNo : self.itemNo});
                        
                	}
                	
                }
            });
    },
    fnReturn : function(){
    	location.href="AdminProductList.do"
    	
    }
    
    }
    , created: function() {
    	var self = this;
		self.fnView();
	}
});
</script>