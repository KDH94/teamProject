<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>상품관리 페이지</title>


</head>
<link rel="stylesheet" href="css/product.css" type="text/css">
<link rel="stylesheet" href="css/style2.css" type="text/css">
<style>
.container {
	width: 100%;
	margin: 0 auto;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.title {
	background-color: rgb(13, 110, 253);
	color: white;
	padding: 10px 20px;
	text-align: center;
}

.title h1 {
	margin: 0;
}

.description {
	margin: 10px 20px;
	text-align: center;
	color: #666;
}

.nav li {
	list-style: none;
	padding: 10px 20px;
	cursor: pointer;
	background-color: white;
}

.nav li:hover {
	background: #d4d4d4;
}

.product-grid {
	display: flex;
	flex-wrap: wrap;
	padding: 20px;
	justify-content: flex-start;
}

.product {
	background: #fff;
	margin: 10px;
	width: calc(25% - 22px);
	/* 4개의 상품이 한 줄에 들어가도록 계산 (20px은 마진, 2px은 보더 고려) */
	box-sizing: border-box; /* 패딩과 보더가 너비에 포함되도록 설정 */
	text-align: center;
}

.product img {
	max-width: 100%;
	height: auto;
}

.product p {
	margin: 10px 0 0;
	color: #333;
}

.price {
	color: #2a8f2a;
	font-weight: bold;
}

.filter {
	float: right;
	margin: 20px;
}
.prodcut-container {
        margin: 0 auto; 
        padding: 20px; 
        max-width: 1200px; 
        border-style: none;
        background-color: #ffffff;
        
        flex-direction: column; /* 세로 방향으로 내부 요소 정렬 */
    	align-items: center; /* 가로 방향 중앙 정렬 */  
    }
    
.searchArea {
    width: 100%;
    display: flex;
    justify-content: right; 
    align-items: center; 
    margin: 20px 0;
}
.logo_search {
	overflow: hidden;
	margin-bottom: 30px;
}

.logo_search__form {
	width: 504px;
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
  
    margin-left: 10px;
}
.site-btn {
	border-radius : 10px;
}

.control-wrapper {
    display: flex;
    /* flex-direction: column; */ /* 아래로 정렬되도록 설정 */
    justify-content: center; /* 가로 방향 가운데 정렬 */
    align-items: center; /* 세로 방향 가운데 정렬 */
    width: 100%;
    margin-top: 20px; /* 위쪽 마진 추가 */
    margin-bottom: 20px; /* 아래쪽 마진 추가 */
    background-color: #f8f9fa; /* 배경색 추가 */
    padding: 15px; /* 내부 여백 추가 */
    border-radius: 40px; /* 모서리를 둥글게 만듦 */
    box-shadow: 0 10px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
}
.order-options {
    float : right;
}

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
 .product-list {
        display: flex;
        flex-wrap: wrap;
        justify-content: flex-start; /* flex-start로 변경하여 좌측 정렬 */
        gap: 10px;
    }
    .product-item:focus {
    box-shadow: 0 2px 4px rgba(0,0,0,0.5);
    background-color: #f0f0f0; /* 이미지 영역에 강조를 위한 배경색 */
}

.product-item img {
    width: 100%;
    height: auto;
    object-fit: cover;
    aspect-ratio: 1 / 1;
    transition: transform 0.2s ease-in-out, filter 0.2s ease; /* filter 속성 추가 */
}

.product-item:focus img {
    transform: scale(1.05);
    filter: brightness(90%); /* 포커스 시 이미지 밝기 감소 */
}
 .product-img:hover {
        box-shadow: 0 2px 4px rgba(0,0,0,0.2); 
    }
    .product-info {
    padding: 15px; /* 내부 여백 추가 */
    text-align: center;
    margin-top: auto; /* 항상 하단에 위치 */
    background-color: #f9f9f9; /* 배경색 */
    border: 1px solid #ddd; /* 테두리 추가 */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
    min-height : 142px;
    border-bottom-left-radius: 10px;
    border-bottom-right-radius: 10px;
}
.product-name {
    margin: 10px 0; /* 이름과 가격 사이의 간격 조정 */
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
.message-container {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 100px; /* 메시지 영역의 높이. 필요에 따라 조절합니다. */
}
.buttonArea {
    display: flex;
    align-items: center;
}
.buttons-container {
    display: flex;
    align-items: center;
    padding: 10px;
    margin-right: 5px; /* 버튼 사이 간격 설정 */
    background-color: #ffffff; /* 배경색 지정 */
    border: 1px solid #dee2e6; /* 테두리 추가 및 색상 변경 */
    border-radius: 100%; /* 모서리를 둥글게 만듦 */
    transition: background-color 0.3s, border-color 0.3s, margin-right 0.3s; /* 호버 효과를 위한 전환 설정 */
}

.buttons-container.active {
    background-color: #f1f1f1; /* 눌린 요소에 백그라운드 색상 추가 */
    border-color: #6c757d; /* 테두리 색상 변경 */
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.3); /* 강조 효과를 위한 그림자 추가 */
}


.buttons-container:hover {
    background-color: #e9ecef; /* 호버 시 배경색 변경 */
}
.product-item button{
 	width: 50%;
 	float: left;
 	border: 1px solid;

}
.productBtn {
	height: 50px;
}
.product-addBtn button{
  		display: block;
  		padding : 0 0 0 0;
        margin: 5px 0; 
        background-color: #68d180;
        color: white; 
        border-style: none;
        border-radius: 6px;
        cursor: pointer;
        transition: background-color 0.3s;
        float: right;
        height: 50px;
        width: 100px;
 }
.product-addBtn button:hover {
        background-color: #3e993e;
    }
 
 
</style>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="css/styles-admin.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="https://cdn.jsdelivr.net/npm/vue-apexcharts"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="js/jquery.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<body class="sb-nav-fixed">
	<div id="app">
		<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
			<!-- Navbar Brand-->
			<a class="navbar-brand ps-3" href="/admin-main.do">관리자 페이지</a>
			<!-- Sidebar Toggle-->
			<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
				id="sidebarToggle" href="#!">
				<i class="fas fa-bars"></i>
			</button>
			<!-- Navbar Search-->
			<form @submit.prevent="handleFormSubmit"
				class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
				<div class="input-group">

					<i class="fas fa-search"></i>
					</button>
				</div>
			</form>


			<!-- Navbar-->
			<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
					role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
						class="fas fa-user fa-fw"></i></a>
					<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="#">아이디 : {{userId}}</a></li>
						<li><hr class="dropdown-divider" /></li>
						<li><a class="dropdown-item" href="#" @click="fnLogout">Logout</a></li>
					</ul></li>
				<li><a href="main.do" class="nav-link dropdown"> <i
						class="bi bi-house-door-fill"></i>
				</a></li>
			</ul>

		</nav>
		<div id="layoutSidenav">
			<div id="layoutSidenav_nav">
				<nav class="sb-sidenav accordion sb-sidenav-dark"
					id="sidenavAccordion">
					<div class="sb-sidenav-menu">
						<div class="nav">
							<div class="sb-sidenav-menu-heading">링크</div>
							<a class="nav-link" href="/admin-main.do">
								<div class="sb-nav-link-icon">
									<i class="fas fa-tachometer-alt"></i>
								</div> 관리자 페이지
							</a> <a class="nav-link" href="/main.do">
								<div class="sb-nav-link-icon">
									<i class="bi bi-house-door-fill"></i>
								</div> 메인 페이지
							</a>
							<div class="sb-sidenav-menu-heading">상품관리</div>
							<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
								data-bs-target="#collapseLayouts" aria-expanded="false"
								aria-controls="collapseLayouts">
								<div class="sb-nav-link-icon">
									<i class="fas fa-columns"></i>
								</div> 상품리스트
								<div class="sb-sidenav-collapse-arrow">
									<i class="fas fa-angle-down"></i>
								</div>
							</a>

							<div class="collapse" id="collapseLayouts"
								aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
								<nav class="sb-sidenav-menu-nested nav">
									<a class="nav-link" href="#" @click="fnMoveProductList('gluten')">글루텐프리</a> <a
										class="nav-link" href="#" @click="fnMoveProductList('local')">로컬</a> <a
										class="nav-link" href="#" @click="fnMoveProductList('vegan')">비건</a> <a
										class="nav-link" href="#" @click="fnMoveProductList('org')">유기농</a>
								</nav>
							</div>

							<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
								data-bs-target="#collapsePages" aria-expanded="false"
								aria-controls="collapsePages">
								<div class="sb-nav-link-icon">
									<i class="fas fa-book-open"></i>
								</div> 작성 기능
								<div class="sb-sidenav-collapse-arrow">
									<i class="fas fa-angle-down"></i>
								</div>
							</a>

							<div class="collapse" id="collapsePages"
								aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
								<nav class="sb-sidenav-menu-nested nav accordion"
									id="sidenavAccordionPages">
									<a class="nav-link collapsed" href="#"
										data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth"
										aria-expanded="false" aria-controls="pagesCollapseAuth">
										상품등록
										<div class="sb-sidenav-collapse-arrow">
											<i class="fas fa-angle-down"></i>
										</div>
									</a>
									<div class="collapse" id="pagesCollapseAuth"
										aria-labelledby="headingOne"
										data-bs-parent="#sidenavAccordionPages">
										<nav class="sb-sidenav-menu-nested nav">
											<a class="nav-link" href="#" @click="handleAddProduct('gluten')">글루텐프리</a> 
											<a class="nav-link" href="#" @click="handleAddProduct('local')">로컬</a> 
											<a class="nav-link" href="#" @click="handleAddProduct('vegan')">비건</a> 
											<a class="nav-link" href="#" @click="handleAddProduct('org')" >유기농</a>
										</nav>
									</div>
									<a class="nav-link collapsed" href="#"
										data-bs-toggle="collapse" data-bs-target="#pagesCollapseError"
										aria-expanded="false" aria-controls="pagesCollapseError">
										게시판 컨트롤
										<div class="sb-sidenav-collapse-arrow">
											<i class="fas fa-angle-down"></i>
										</div>
									</a>
									<div class="collapse" id="pagesCollapseError"
										aria-labelledby="headingOne"
										data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
											<a class="nav-link" href="javascript:;" @click="fnMoveBoardList(1)">공지게시판 이동</a>
											 <a class="nav-link" href="javascript:;" @click="fnMoveBoardList(2)">레시피게시판 이동</a>
										</nav>
									</div>

								</nav>

							</div>
							<div>
								<a class="nav-link collapsed" href="AdminUserList.do">
									<div class="sb-nav-link-icon">
										<i class="bi bi-people-fill"></i>
									</div>유저관리

								</a>
							</div>
							<div class="sb-sidenav-menu-heading">차트분석</div>
							<a class="nav-link" href="tables.html">
								<div class="sb-nav-link-icon">
									<i class="fas fa-chart-area"></i>
								</div> 월 매출 차트
							</a>
							<div class="sb-sidenav-menu-heading">결제로그</div>
							<a class="nav-link" href="AdminPaymentList.do">
								<div class="sb-nav-link-icon">
									<i class="bi bi-credit-card"></i>
								</div> 결제로그
							</a>
						</div>
					</div>
					<div class="sb-sidenav-footer">
						<div class="small">현재 로그인된 아이디:</div>
						{{userId}}
					</div>
				</nav>
			</div>

			<div id="layoutSidenav_content">
				<main>
					<div class="prodcut-container">
            <div class="control-wrapper">
			    <!-- 제품 카테고리 버튼 -->
			    <div class="buttonArea">
			        <a :class="[selected == '' ? 'button-selected' : 'buttons-container']" @click="fnList('')"><img src="img/categories/cat-5.png"></a>
					<a :class="[selected == 'org' ? 'button-selected' : 'buttons-container']" @click="fnList('org')"><img src="img/categories/cat-1.png"></a>
					<a :class="[selected == 'vegan' ? 'button-selected' : 'buttons-container']" @click="fnList('vegan')"><img src="img/categories/cat-2.png"></a>
					<a :class="[selected == 'gluten' ? 'button-selected' : 'buttons-container']" @click="fnList('gluten')"><img src="img/categories/cat-3.png"></a>
					<a :class="[selected == 'local' ? 'button-selected' : 'buttons-container']" @click="fnList('local')"><img src="img/categories/cat-4.png"></a>
			    </div>
			    <!-- 정렬 옵션 드롭다운 -->
			</div>
			<div class="searchArea" style="margin-top: 0px;">
				<div class="logo_search">
		           <div class="logo_search__form">
		               <form action="javascript:;">
		                   <div class="search-input-btn">
			                   <input type="text" placeholder="검색할 상품명을 입력해 주세요" v-model="keyword" @keyup.enter="fnList(code)">
			                   <button type="submit" class="site-btn" @click="fnList(code)">검색</button>
			                  
		                   </div>
		                   <div class="product-addBtn">
		                    <button class="site-btn" @click="handleAddProduct(code)">*{{codeName}}*<p>신규 상품 등록</button>
		                    </div>
		               </form>
		               	
		            
		           </div>
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
		                <div class="productBtn">
		                <button class="add-to-cart-btn" @click="fnEdit(item.itemNo)">제품 수정하기</button>
		              <button class="add-to-cart-btn" @click="fnRemove(item.itemNo)">제품 제거하기</button>
		                </div>
		              
		            </template>
		        </div>
		        <div class="message-container" v-if="list.length === 0">
		            <div class="no-results-message">
		                등록된 상품이 없습니다. 다시 검색해 주세요.
		            </div>
		        </div>
		    </div>
		</div>
				</main>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			list : [],
	    	fileList : [],
	    	userId : "${userId}",
			userType : "${userType}",
	    	code : "${map.code}",
	    	keyword : "${map.keyword}",
	    	selected : "",
	    	type: "CDATE",
	    	order: "DESC",
	    	selectedOption: 'new',
	    	codeName :"----"

		},
		methods : {
			fnList: function(code) {
	            var self = this;
	            self.selected = code;
	            
	            if(code == ""){
	            	self.codeName = "----";
	            }
	            if(code == "gluten"){
	            	self.codeName = "글루텐";
	            }
	            if(code == "org"){
	            	self.codeName = "오가닉";
	            }
	            if(code == "local"){
	            	self.codeName = "로컬";
	            }
	            if(code == "vegan"){
	            	self.codeName = "비건";
	            }
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
	        fnMoveBoardList : function(code){
				var self = this;
			$.pageChange("/boardList.do", {
				code : code});
		},
			handleAddProduct : function(code){
				var self = this;
				 // 팝업 창을 열고자 하는 페이지 URL
			    var url = "productAdd.do";
				if (self.selected ==""){
					code = "All";
				}
			    // POST 방식으로 전송할 데이터
			    var postData = {
			        code : code,
			        popupFlg : "yes"
			    };

			    // form 엘리먼트를 동적으로 생성
			    var form = document.createElement("form");
			    form.setAttribute("method", "post");
			    form.setAttribute("action", url);
			    form.setAttribute("target", "_blank"); // 새 창으로 열기

			    // 데이터를 form에 추가
			    for (var key in postData) {
			        if (postData.hasOwnProperty(key)) {
			            var hiddenField = document.createElement("input");
			            hiddenField.setAttribute("type", "hidden");
			            hiddenField.setAttribute("name", key);
			            hiddenField.setAttribute("value", postData[key]);
			            form.appendChild(hiddenField);
			        }
			    }

			    // body에 form 추가하고 submit
			    document.body.appendChild(form);
			    
			    // 팝업 창 크기 설정
			    var width = 500;
			    var height = 600;
			    var left = (screen.width - width) / 2;
			    var top = (screen.height - height) / 2;
			    var options = "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top;
			    // 새로운 창에 대한 참조 저장
			    var popupWindow = window.open("", "popup", options);
			    
			    // form을 제출하면서 팝업 창에 대한 참조를 반환하도록 수정
			    form.target = "popup";
			    form.submit();
			    
			   
			    // form 제거
			    document.body.removeChild(form);
			},
			
			/* 제품 삭제 실행 */
			fnRemove : function(itemNo) {
				var self = this;
				console.log(itemNo);
				if (confirm("정말 제거 하시겠습니까?")) {
					var nparmap = {
					  itemNo : itemNo
					};
					$.ajax({
						url : "productRemove.dox",
						dataType : "json",
						type : "POST",
						data : nparmap,
						success : function(data) {
							if (data.result == "success") {
								alert("삭제되었습니다!");
								self.fnList(self.code);
							} else {
								alert("삭제 실패 오류 발생!");
							}
						}
					});
				} else {
					return;
				}
			},
			fnLogout : function() {
				var self = this;
				if (confirm("정말로 로그아웃하나요?")) {
					self.logFlg = false;
					location.href = "/user-login.do";
				} else {
					return;
				}
			},
			fnEdit : function(itemNo) {
				$.pageChange("/AdminProductUpdate.do", {
					itemNo : itemNo
				});
			},
			
			fnMoveProductList : function(code){
				$.pageChange("/AdminProductList.do", {
					code : code
				});
			},
			fnMoveAdminPage : function() {
				location.href = "/admin-main.do"
			},
			fnMoveAddPage : function() {
				var self = this;
				$.pageChange("/productAdd.do", {
					code : self.code
				});
			},
			 fnDetailView: function(itemNo, userId) {
					var self = this;
					$.pageChange("/productView.do", {itemNo: itemNo, userId: self.userId});
				},
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
		},
		created : function() {
			var self = this;
			self.fnList(self.code);
			
		}
	});
</script>