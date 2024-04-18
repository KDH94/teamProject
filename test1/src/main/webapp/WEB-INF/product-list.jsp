<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<link rel="stylesheet" href="css/product.css" type="text/css">
	<link rel="stylesheet" href="css/teamProj_style.css" type="text/css">
	<title>상품 페이지</title>
</head>
<style>
</style>
<body>
<!-- Header Section -->
<%@ include file="layout/header.jsp" %>
	<div id="app">
		<div class="prodcut-container">
			<div class="searchArea" style="margin-top: 0px;">
				<div class="logo_search">
		           <div class="logo_search__form">
		               <form action="javascript:;">
		                   <div class="logo_search__categories">
		                       <img src="img/logo/mainLogo.png">
		                   </div>
		                   <div class="search-input-btn">
			                   <input type="text" placeholder="검색할 상품명을 입력해 주세요" v-model="keyword" @keyup.enter="fnList(code)">
			                   <button type="submit" class="site-btn" @click="fnList(code)">검색</button>
		                   </div>
		               </form>
		           </div>
		        </div>
			</div>
			
            <div class="control-wrapper">
			    <!-- 제품 카테고리 버튼 -->
			    <div class="buttonArea">
			        <a :class="[selected == '' ? 'button-selected' : 'buttons-container']" @click="fnList('')"><img src="img/categories/cat-5.png"></a>
					<a :class="[selected == 'org' ? 'button-selected' : 'buttons-container']" @click="fnList('org')"><img src="img/categories/cat-1.png"></a>
					<a :class="[selected == 'vegan' ? 'button-selected' : 'buttons-container']" @click="fnList('vegan')"><img src="img/categories/cat-2.png"></a>
					<a :class="[selected == 'gluten' ? 'button-selected' : 'buttons-container']" @click="fnList('gluten')"><img src="img/categories/cat-3.png"></a>
					<a :class="[selected == 'local' ? 'button-selected' : 'buttons-container']" @click="fnList('local')"><img src="img/categories/cat-4.png"></a>
			    </div>
			</div>
		</div>
		<div class="prodcut-container">
			<div class="order-options">
			    <label>
			        <input type="radio" name="order-option" value="new" v-model="selectedOption" @change="updateSelected">
			        <span>신상품 순</span>
			    </label>
			    <label>
			        <input type="radio" name="order-option" value="old" v-model="selectedOption" @change="updateSelected">
			        <span>구상품 순</span>
			    </label>
			    <label>
			        <input type="radio" name="order-option" value="high" v-model="selectedOption" @change="updateSelected">
			        <span>높은 가격순</span>
			    </label>
			    <label>
			        <input type="radio" name="order-option" value="low" v-model="selectedOption" @change="updateSelected">
			        <span>낮은 가격순</span>
			    </label>
			</div>
		</div>
        <div class="prodcut-container" style="clear: both;">    
		    <div class="product-list">
		        <div class="product-item" v-for="item in list" :key="item.id">
		            <template v-for="item2 in fileList" v-if="item.itemNo == item2.itemNo">
		                <img class="product-img" :src="item2.filePath+item2.fileName" alt="" @click="fnDetailView(item.itemNo, userId)">
		                <div class="product-info" @click="fnDetailView(item.itemNo)">
		                    <div class="product-name">{{item.itemName}}</div>
		                    <div class="product-price">
		                        <template v-if="item.sRate > 0">
		                            <del>{{item.price.toLocaleString('ko-KR')}}원</del>
		                            <br>{{item.sRate}}% {{DiscountPrice(item.price, item.sRate)}}원		        		
		                        </template>
		                        <template v-else>
		                            <br>{{item.price.toLocaleString('ko-KR')}}원
		                        </template>
		                    </div>
		                </div>
		                <button class="add-to-cart-btn" @click="fnAddCart(item.itemNo)">장바구니에 담기</button>
		            </template>
		        </div>
		        <div class="message-container" v-if="list.length === 0">
		            <div class="no-results-message">
		                등록된 상품이 없습니다. 다시 검색해 주세요.
		            </div>
		        </div>
		    </div>
		</div>

	</div>
<!-- Footer Section -->
<%@ include file="layout/footer.jsp" %>	
</body>
</html>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
    	list : [],
    	fileList : [],
    	userId : "${userId}",
		userType : "${userType}",
    	code : "${map.code}",
    	keyword : "${map.keyword}",
    	selected : "",
    	type: "CDATE",
    	order: "DESC",
    	selectedOption: 'new'
    	
    }
    , methods: {
    	fnList: function(code) {
            var self = this;
            self.selected = code;
            if(self.code != code){
            	self.keyword = "";
            }
            self.code = code;
            var nparmap = {
            	code: code,
            	keyword : self.keyword,
            	type : self.type,
            	order : self.order,
            	kind : 1
            };
            $.ajax({
                url:"codeList.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success: function(data) {
                	console.log(data);
                	self.list = data.list;
                	self.fileList = data.fileList;
                }
            });
        },
        fnRemove: function(itemNo) {
            var self = this;
            if(confirm("정말 삭제할까요?")) {
	            var nparmap = {
	            		itemNo : itemNo
	            };
	            $.ajax({
	                url:"productRemove.dox",
	                dataType:"json",
	                type: "POST",
	                data: nparmap,
	                success: function(data) {
	                	if(data.result == "success") {
	                		alert("삭제되었습니다!");
	                		self.fnList('');
	                	} else {
	                		alert("삭제 실패 오류 발생!");
	                	}
	                }
	            });            	
            } else {
            	return;
            }
        },
        /* 제품 상세 페이지  */
        fnDetailView: function(itemNo, userId) {
			var self = this;
			$.pageChange("/productView.do", {itemNo: itemNo, userId: self.userId});
		},
		/* 상품 추가 페이지 */
		fnAdd: function(){
			$.pageChange("/productAddFarmer.do", {});
		},
		/* 상품 수정 페이지  */
		fnEdit : function(itemNo){
        	$.pageChange("/ProductUpdate.do", {itemNo : itemNo});
        },
        /* 상품 장바구니 추가  */
		fnAddCart: function(itemNo) {
            var self = this;
            if(self.userId == ""){
            	alert("로그인 후 이용 가능합니다.");
            	return;
            }
            var nparmap = {
				itemNo: itemNo,
				userId: self.userId
            };
            $.ajax({
                url:"addCart.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success: function(data) {
                	
                	if(data.result=="success"){
                		alert("장바구니에 담았습니다.");
                		appHeader.fnLogin();
                	}else{
                		alert("예기치 못한 오류가 발생했습니다. 다시 시도해 주세요.");
                	}
                }
            });
        },
        /* 정렬 기능  */
        updateSelected: function() {
        	var self = this;
            switch (self.selectedOption) {
                case 'new':
                	self.type = 'CDATE';
                	self.order = 'DESC';
                    break;
                case 'old':
                	self.type = 'CDATE';
                	self.order = 'ASC';
                    break;
                case 'high':
                	self.type = 'PRICE';
                	self.order = 'DESC';
                    break;
                case 'low':
                	self.type = 'PRICE';
                	self.order = 'ASC';
                    break;
            }
            self.fnList(self.code);
        },
        /* kr통화 표시 */
        DiscountPrice: function(price, sRate) {
            const disPrice = price * ((100 - sRate) / 100);
            return disPrice.toLocaleString('ko-KR');
        }
       
        
    }
    , created: function() {
    	var self = this;
    	self.fnList(self.code);
	}
});
</script>