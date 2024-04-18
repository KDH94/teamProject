<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<title>메인 페이지</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
<style>
.hero {
    padding: 50px 0;
}

.hero__categories ul {
    list-style: none;
    padding: 0;
}

.hero__categories ul li {
    margin-bottom: 10px;
}

.hero__categories ul li a {
    color: #333;
    text-decoration: none;
    font-size: 16px;
    transition: color 0.3s ease;
}

.hero__categories ul li a:hover {
    color: #ff7f50;
}

.hero__search__form {
    background-color: #fff;
    border-radius: 5px;
    overflow: hidden;
}

.hero__search__form input[type="text"] {
    width: 70%;
    padding: 10px;
    border: none;
    border-radius: 5px 0 0 5px;
    font-size: 16px;
}

.hero__search__form button {
    background-color: #ff7f50;
    border: none;
    padding: 10px 20px;
    color: #fff;
    border-radius: 0 5px 5px 0;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.hero__search__form button:hover {
    background-color: #ff6347;
}

.swiper-slide img {
    width: 100%;
    border-radius: 10px;
}

.swiper-pagination {
    position: absolute;
    bottom: 10px;
    left: 50%;
    transform: translateX(-50%);
}

.swiper-pagination-bullet {
    width: 10px;
    height: 10px;
    background-color: rgba(255, 255, 255, 0.5);
    border-radius: 50%;
    margin: 0 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.swiper-pagination-bullet-active {
    background-color: #ff7f50;
}

.categories {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

.swiper-container {
    width: 100%;
    max-width: 1000px;
    overflow: hidden;
}

.swiper-slide {
    text-align: center;
}

.swiper-slide img {
    max-width: 100%;
    height: auto;
    border-radius: 10px;
}

.swiper-pagination {
    margin-top: 20px;
    text-align: center;
}

.swiper-pagination-bullet {
    width: 10px;
    height: 10px;
    background-color: rgba(0, 0, 0, 0.5);
    border-radius: 50%;
    margin: 0 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.swiper-pagination-bullet-active {
    background-color: #ff7f50;
}

.featured {
    padding: 80px 0;
    background-color: #f9f9f9;
}

.section-title {
    text-align: center;
    margin-bottom: 60px;
}

.section-title h2 {
    font-size: 36px;
    color: #333;
}

.featured__controls ul {
    list-style: none;
    padding: 0;
    text-align: center;
}

.featured__controls ul li {
    display: inline-block;
    margin-right: 20px;
    font-size: 16px;
    cursor: pointer;
    color: #666;
    transition: color 0.3s ease;
}

.featured__controls ul li.active,
.featured__controls ul li:hover {
    color: #ff7f50;
}

.featured__filter {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    margin-top: 40px;
}

.featured__item {
    flex: 0 0 calc(25% - 20px);
    margin: 10px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    overflow: hidden;
}

.featured__item__pic {
    position: relative;
    overflow: hidden;
    height: 250px;
}

.featured__item__pic img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 10px 10px 0 0;
}

.featured__item__pic__hover {
    position: absolute;
    bottom: 20px;
    left: 50%;
    transform: translateX(-50%);
    opacity: 0;
    transition: opacity 0.3s ease;
}

.featured__item:hover .featured__item__pic__hover {
    opacity: 1;
}

.featured__item__pic__hover li {
    display: inline-block;
    margin: 0 5px;
}

.featured__item__text {
    padding: 25px 20px;
    height: 170px;
}

.featured__item__text h4 {
    margin-top: 0;
    margin-bottom: 10px;
    font-size: 18px;
    font-weight: bold;
}

.featured__item__text del {
    color: #999;
}

.featured__item__text h4:last-child {
    margin-top: 5px;
    color: red;
}

.from-blog {
    padding: 80px 0;
}

.from-blog__title h2 {
    font-size: 36px;
    color: #333;
    text-align: center;
    margin-bottom: 60px;
}

.banner {
    background-color: #f9f9f9;
    padding-bottom: 15px;
}

.blog__item {
    margin-bottom: 50px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}

.blog__item__pic img {
    width: 100%;
    height: auto;
    border-radius: 10px 10px 0 0;
}

.blog__item__text {
    padding: 25px;
}

.blog__item__text ul {
    list-style: none;
    padding: 0;
    margin: 0;
}

.blog__item__text ul li {
    display: inline-block;
    margin-right: 20px;
    font-size: 14px;
    color: #999;
}

.blog__item__text h5 {
    margin-top: 15px;
    margin-bottom: 10px;
    font-size: 20px;
}

.blog__item__text h5 a {
    color: #333;
    text-decoration: none;
    transition: color 0.3s ease;
}

.blog__item__text h5 a:hover {
    color: #ff7f50;
}

.blog__item__text p {
    color: #666;
    margin-top: 10px;
    font-size: 16px;
    line-height: 1.6;
}
.hero__search {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: row; /* 가로 방향으로 정렬 */
}

.hero__search__phone {
    margin-left: 20px; /* 검색 버튼과의 간격 조절 */
}
</style>
</head>
<body>
<!-- Header Section -->
<%@ include file="layout/header.jsp" %>
	<div id="appMain">
	    <!-- Hero Section Begin -->
	    <section class="hero" id="HeaderAllTab">
		    <div class="hero__search">
	           <div class="hero__search__form">
	               <form action="javascript:;">
	                   <div class="hero__search__categories">
	                       전체 검색
	                       <span class="arrow_carrot-right"></span>
	                   </div>
	                   <input type="text" placeholder="검색할 상품명을 입력해 주세요" v-model="keyword" @keyup.enter="fnSearchList('')">
	                   <button type="submit" class="site-btn" @click="fnSearchList('')">검색</button>
	               </form>
	           </div>
	        </div>
	        <div class="container">
                <div class="swiper">
					<div class="swiper-wrapper" >
						<div class="swiper-slide" style="border-radius: 10px;">
							<img src="img/hero/banner-0.png">
						</div>
						<div class="swiper-slide" style="border-radius: 10px;" >
							<img src="img/hero/banner-1.png">
						</div>
						<div class="swiper-slide" style="border-radius: 10px;" >
							<img src="/img/hero/banner-2.png">
						</div>
						<div class="swiper-slide" style="border-radius: 10px;" >
							<img src="/img/hero/banner-3.png">
						</div>
					</div>
				</div>
			</div>
	        <div class="swiper-pagination"></div>
	    </section>
	    <!-- Hero Section End -->
	    
	    <section class="categories" style="display: flex; justify-content: center;">
	        <div class="swiper-container" style="width : 1000px; overflow: hidden; ">
	            <div class="swiper-wrapper">
	                <div class="swiper-slide" >
                        <!-- Category 1 -->
                        <a href="javascript:;" @click="fnMovetoCategoty('org')"><img src="img/categories/cat-1.jpg"></a>
	                </div>
	                <div class="swiper-slide" >
                        <!-- Category 2 -->
                        <a href="javascript:;" @click="fnMovetoCategoty('vegan')"><img src="img/categories/cat-2.jpg"></a>
	                </div>
	                <div class="swiper-slide" >
                        <!-- Category 3 -->
                        <a href="javascript:;" @click="fnMovetoCategoty('gluten')"><img src="img/categories/cat-3.jpg"></a>
	                </div>
	                <div class="swiper-slide" >
                        <!-- Category 4 -->
                        <a href="javascript:;" @click="fnMovetoCategoty('local')"><img src="img/categories/cat-4.jpg"></a>
	                </div>
	                <div class="swiper-slide" >
                        <!-- Category 5 -->
                        <a href="javascript:;" @click="fnMovetoCategoty('')"><img src="img/categories/cat-5.jpg"></a>
	                </div>
	            </div>
	            <!-- Add Pagination -->
	            <div class="swiper-pagination"></div>
	        </div>
		</section>
	    <!-- Categories Section End -->
	    
	    <!-- Featured Section Begin -->
	    <section class="featured spad">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="section-title">
	                        <h2>이달의 제품</h2>
	                    </div>
	                    <div class="featured__controls">
	                        <ul>
	                            <li class="active" data-filter="*">모두</li>
	                            <li data-filter=".org">유기농</li>
	                            <li data-filter=".vegan">비건</li>
	                            <li data-filter=".gluten">글루텐프리</li>
	                            <li data-filter=".local">로컬푸드</li>
	                        </ul>
	                    </div>
	                </div>
	            </div>
	            <div class="row featured__filter">
    		        <template v-for="(item, index) in list" v-if="index < 8">
		            	<template v-for="item2 in fileList" v-if="item.itemNo == item2.itemNo">
			                <div :class="'col-lg-3 col-md-4 col-sm-6 mix ' + item.code">
			                    <div class="featured__item">
			                    	<div class="featured__item__pic">
			                    		<img :data-setbg="item2.path" :alt="item.itemName" :src="item2.path" @click="fnDetailView(item.itemNo, userId)" style="cursor: pointer;">
			                        	<ul class="featured__item__pic__hover">
			                                <li><a href="javascript:;" @click="fnAddFavorite(item.itemNo, userId)"><i class="fa fa-heart"></i></a></li>
			                                <li><a href="javascript:;" @click="fnAddCart(item.itemNo, userId)"><i class="fa fa-shopping-cart"></i></a></li>
			                            </ul>
		                        	</div>
			                        <div class="featured__item__text">
			                            <h4><a href="javascript:;" @click="fnDetailView(item.itemNo, userId)" style="color: black; font-weight: bold;">{{item.itemName}}</a></h4>
			                            <del>₩{{item.price}}</del>
			                            <h4 style="color: red;">₩{{(item.price)*((100-item.sRate)/100)}}</h4>
			                        </div>
			                    </div>
			                </div>
		            	</template>
		            </template>
	            </div>
	        </div>
	    </section>
	    <!-- Featured Section End -->
	    <!-- Banner Begin -->
	    <div class="banner">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-6 col-md-6 col-sm-6">
	                    <div class="banner__pic">
	                        <img src="img/banner/banner-1.jpg" alt="">
	                    </div>
	                </div>
	                <div class="col-lg-6 col-md-6 col-sm-6">
	                    <div class="banner__pic">
	                        <img src="img/banner/banner-2.jpg" alt="">
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <!-- Banner End -->
	    
	    <!--  -->
	   	    
	    <!-- Blog Section Begin -->
	    <section class="from-blog spad">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="section-title from-blog__title">
	                        <h2>인기 레시피</h2>
	                    </div>
	                </div>
	            </div>
	            <div class="row">
	            	<template v-for="(item, index) in listR">
	            		<template v-for="item2 in fileListR" v-if="item.boardNo == item2.boardNo">
			                <div class="col-lg-4 col-md-4 col-sm-6">
			                    <div class="blog__item">
			                        <div class="blog__item__pic">
			                            <img :src="item2.path" alt="image" @click="fnView(item.boardNo, 2)" style="cursor: pointer; max-width: 200px; height: 300px;">
			                        </div>
			                        <div class="blog__item__text">
			                            <ul>
			                                <li><i class="fa fa-calendar-o"></i> {{item.cDate}}</li>
			                                <li><i class="fa fa-eye"></i> {{item.hits}}</li>
			                            </ul>
			                            <h5><a href="javascript:;" @click="fnView(item.boardNo, 2)">{{truncateText(item.title, 10)}}</a></h5>
			                            <p><span v-html="truncateText(item.contents, 50)"></span></p>
			                        </div>
			                    </div>
			                </div>
	            		</template>
	            	</template>
	            </div>
	        </div>
	    </section>
	    <!-- Blog Section End -->
	    
	</div>
<!-- Js Plugins -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/11.0.5/swiper-bundle.min.js" integrity="sha512-Ysw1DcK1P+uYLqprEAzNQJP+J4hTx4t/3X2nbVwszao8wD+9afLjBQYjz7Uk4ADP+Er++mJoScI42ueGtQOzEA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script src="js/jquery.js"></script>
</body>
</html>
<script type="text/javascript">
	
  	var app = new Vue({
		el: '#appMain',
		data: {
			userId: "${userId}",
			isPopupOpen: true,
			list: [],
			fileList: [],
	    	listLatest: [],
	    	listMax: [],
	    	listMost: [],
	    	listR: [], 		// 레시피용
	    	fileListR: [], 	// 레시피용
	    	keyword: "",
	    	kind: 1,
	    	swiper: null
		},
		methods: {
			fnListOrderBy: function() {
				var self = this;
				var nparmap = {
				};
				$.ajax({
					url: "productListOrderBy.dox",
					dataType: "json",
					type: "POST",
					data: nparmap,
					success: function(data) {
						console.log(data);
						self.list = data.listMain;
	                	self.listLatest = data.listLatest; // 최근 등록순
	                	self.listMax = data.listMax; // 최다 판매순
	                	self.listMost = data.listMost; // 최다 리뷰순
	                	self.fileList = data.fileList; 
					}
				});
			},
			fnListRecipe: function() {
				var self = this;
				var nparmap = {
				};
				$.ajax({
					url: "boardAndFileList.dox",
					dataType: "json",
					type: "POST",
					data: nparmap,
					success: function(data) {
						if(data.result == 'success') {
							self.listR = data.listR;
							self.fileListR = data.fileListR;
						}
					}
				});				
			},
			closePopup: function() {
				this.isPopupOpen = false;
			},
			fnMoveCategory: function(kind) {
				$.pageChange("/productList.do", {code: kind});
			},
			fnAddCart: function(itemNo, userId) {
	            var self = this;
	            if(self.userId == "") {
	            	alert("로그인 후 이용 가능합니다.");
	            	location.href = "/user-login.do";
	            } else {
		            var nparmap = {
						itemNo: itemNo,
						userId: userId
		            };
		            $.ajax({
		                url:"addCart.dox",
		                dataType:"json",
		                type: "POST",
		                data: nparmap,
		                success: function(data) {
		                	if(data.result == "success") {
		                		alert("장바구니에 담았습니다.");
		                		appHeader.fnLogin();
		                	} else {
		                		alert("예기치 못한 오류가 발생했습니다. 다시 시도해 주세요.");
		                	}
		                }
		            });
	            }
			},
			fnAddFavorite: function(itemNo, userId) {
		    	var self = this;
		    	if(self.userId == ""){
		    		alert("로그인 후 이용 가능합니다.");
		    		location.href = "/user-login.do";
		    	} else {
		            var nparmap = {
		            		itemNo: itemNo,
		            		userId: userId
		            };
		            $.ajax({
		                url:"FavoriteAdd.dox",
		                dataType:"json",
		                type: "POST",
		                data: nparmap,
		                success: function(data) {
		                	console.log(data);
		                	if(data.result == "insert") {
		                		alert("찜 목록에 담았습니다.");
		                		appHeader.fnLogin();
		                	} else if(data.result == "remove") {
		                		alert("찜 목록에서 뺐습니다.");
		                		appHeader.fnLogin();
		                	} else {
		                		alert("예기치 못한 오류가 발생했습니다. 다시 시도해 주세요.");
		                	}
		                }
		            });
		    	}
			},
	        fnDetailView: function(itemNo, userId) {
				var self = this;
				$.pageChange("/productView.do", {itemNo: itemNo, userId: self.userId});
			},
			fnView: function(boardNo, kind) {
                var self = this;
                if (self.userId != "") {
                    $.pageChange("/boardView.do", {boardNo: boardNo, kind: kind});
                } else {
                    alert("로그인 후 확인 가능합니다.");
                    return;
                }
            },
            truncateText(text, maxLength) {
                if (text.length > maxLength) {
                    return text.slice(0, maxLength) + '...';
                } else {
                    return text;
                }
            },
            fnSearchList: function(code) {
            	var self = this;
            	$.pageChange("/productList.do", {keyword: self.keyword, code: code});
            },
            fnMovetoCategoty: function(code) {
            	var self = this;
            	$.pageChange("/productList.do", {code: code});
            },
            handleSlideChange() {
                // 현재 활성화된 슬라이드의 인덱스 가져오기
                if(this.swiper != null){
                	console.log("swiper", this.swiper.realIndex);
                	var activeIndex = this.swiper.realIndex;
                    // 활성화된 슬라이드의 배경색을 설정
                    var heroElement = document.querySelector('.hero');
                    heroElement.style.transition = "background-color 0.5s";
                    setTimeout(() => {
                    	switch (activeIndex) {
	                        case 0:
	                        	heroElement.style.backgroundColor = 'rgb(250 197 19)';
	                            break;
	                        case 1:
	                        	heroElement.style.backgroundColor = 'rgb(176 225 24)';
	                            break;
	                        case 2:
	                        	heroElement.style.backgroundColor = 'rgb(204 234 229)';
	                            break;
	                        case 3:
	                        	heroElement.style.backgroundColor = 'rgb(243 230 198)';
	                            break;
                    	}
                    }, 150);
                }
                
            }
		},
		mounted() {
			this.swiper = new Swiper('.swiper', {
				effect: 'cube',
	            autoplay: {
	                delay: 4000,
	                disableOnInteraction: false,
	            },
	            loop: true, // 자동 
	            slidesPerView: 1, // 보이는 슬라이드 개수
	            spaceBetween: 50, // 슬라이드 사이 gap
	            centeredSlides: true,
	            navigation: {
	                prevEl: '.swiper-prev',
	                nextEl: '.swiper-next',
	            },
	            on: {
	                slideChange: this.handleSlideChange 
	            },
	        });
			 new Swiper('.swiper-container', {
                slidesPerView: 4,
                spaceBetween: 20,
                loop: true,
                autoplay: {
                    delay: 3000, // Change slide every 3 seconds
                    disableOnInteraction: false,
                },
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                },

            }); 
	      },
		created: function() {
			var self = this;
			self.fnListOrderBy();
			self.fnListRecipe();
		}
	}); 
</script>
<%@ include file="layout/footer.jsp" %>
