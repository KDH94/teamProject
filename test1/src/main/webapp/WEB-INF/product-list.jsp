<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<link rel="stylesheet" href="css/product.css" type="text/css">
	<title>상품 페이지</title>
</head>
<style>
.searchArea {
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center; 
    margin: 20px 0;
}

/* 제품 카테고리 및 정렬 옵션 스타일 */
.control-wrapper {
    display: flex;
    justify-content: center; 
    align-items: center;
    width: 100%;
    margin-top: 20px; 
    margin-bottom: 20px; 
    background-color: #f8f9fa; 
    padding: 15px;
    border-radius: 40px;
    box-shadow: 0 10px 10px rgba(0, 0, 0, 0.1);
}


.buttonArea {
    display: flex;
    align-items: center;
}

.buttons-container {
    display: flex;
    align-items: center;
    padding: 10px;
    margin-right: 5px; 
    background-color: #ffffff; 
    border: 1px solid #dee2e6;
    border-radius: 100%; 
    transition: background-color 0.3s, border-color 0.3s, margin-right 0.3s; 
}

.buttons-container.active {
    background-color: #f1f1f1; 
    border-color: #6c757d; 
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.3); 
}


.buttons-container:hover {
    background-color: #e9ecef; 
}

.order-container select {
    padding: 8px;
    border: 1px solid #adb5bd;
    border-radius: 5px; 
    transition: border-color 0.3s; 
}

.order-container select:hover {
    border-color: #868e96; 
}

.product-item:focus {
    box-shadow: 0 2px 4px rgba(0,0,0,0.5);
    background-color: #f0f0f0; 
}

.product-item img {
    width: 100%;
    height: auto;
    object-fit: cover;
    aspect-ratio: 1 / 1;
    transition: transform 0.2s ease-in-out, filter 0.2s ease; 
}

.product-item:focus img {
    transform: scale(1.05);
    filter: brightness(90%); 
}
.order-options {
    float : right;
}

/* img */

/* 장바구니에 담기 버튼 스타일 */
.add-to-cart-btn {
    display: block;
    width: 100%;
    padding: 10px 0;
    margin-top: 15px;
    background-color: #5cb85c; /* 기본 배경색 */
    color: white;
    border: none;
    border-radius: 5px; /* 둥근 테두리 */
    cursor: pointer;
    transition: background-color 0.3s;
}

.add-to-cart-btn:hover {
    background-color: #3e993e; /* 호버 시 배경색 변경 */
}

/* 상품 정보 영역 스타일 */
.product-info {
    padding: 15px;
    text-align: center;
    margin-top: auto; 
    background-color: #f9f9f9; 
    border: 1px solid #ddd; 
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    min-height : 142px;
    border-bottom-left-radius: 10px;
    border-bottom-right-radius: 10px;
}

.product-name {
    margin: 10px 0; 
    font-weight: bold;
    font-size: 16px;
}

.product-price {
    color: #E44D26;
    font-weight: bold;
    font-size: 14px;
}

.product-price del {
    font-size: 12px;
}

/* 등록된 상품이 없는 경우 메시지 영역 스타일 */
.message-container {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 100px; /* 메시지 영역의 높이. 필요에 따라 조절합니다. */
}

.no-results-message {
    text-align: center;
    margin-top: 20px;
    font-size: 20px;
    color: #888;
}

/* 선택 옵션 컨테이너 스타일 */
.order-options {
    display: flex;
    flex-direction: row; /* 좌우로 정렬 */
    gap: 10px; /* 라디오 버튼 사이의 간격 설정 */
    margin-right: 15px;
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

.logo_search {
	overflow: hidden;
	margin-bottom: 30px;
}

.logo_search__form {
	width: 730px;
	height: 100px;
	position: relative;
	margin-right: 10px;
	float: left;
}

.logo_search__form form .logo_search__categories {
	width: 30%;
	float: left;
	font-size: 16px;
	color: #1c1c1c;
	font-weight: 700;
	padding-left: 18px;
	padding-top: 11px;
	position: relative;
}

.search-input-btn {
    display: inline-block;
    margin-top: 35px;
    margin-left: 10px;
}
.site-btn {
	border-radius : 10px;
}
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