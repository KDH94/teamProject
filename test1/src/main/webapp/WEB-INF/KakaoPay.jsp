<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>주문/결제 페이지</title>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap-min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome-min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui-min.css" type="text/css">
<link rel="stylesheet" href="css/owl-carousel-min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav-min.css" type="text/css">
<link rel="stylesheet" href="css/style2.css" type="text/css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

</head>
<style>
@font-face {
	font-family: 'KOTRA_GOTHIC';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/KOTRA_GOTHIC.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: 'KOTRA_GOTHIC';
}

.checkout__input__checkbox {
	text-align: left;
	background-color: #f5f5f5;
}

.postUserName {
	font-weight: bold;
	width: 700px;
	position: relative;
}

.modal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 9998;
}

.postModal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 9998;
}

.modal-content {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	width: 40%;
	height: 500px;
	padding: 20px;
	border-radius: 5px;
	z-index: 9999;
}

.postModal-content {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	width: 40%;
	height: 500px;
	padding: 20px;
	border-radius: 5px;
	z-index: 9999;
}

.modal-content button {
	text-align: left;
	border: none;
}

.exitBtn {
	display: inline-block;
	cursor: pointer;
	font-size: 35px;
	position: absolute;
	right: 25px;
}

.exitBtn:hover {
	color: gray;
}

.btnIcon {
	position: absolute;
	right: 15px;
}

.PostIcon {
	position: absolute;
	right: 15px;
}

.request button {
	position: relative;
	border: 1px solid;
	background-color: #fff;
	box-sizing: border-box;
}

.request input {
	width: 100%;
	height: 50px;
	box-sizing: border-box;
}

.CheckedBtn {
	color: green;
}

.CheckedBtn i {
	position: absolute;
	right: 25px;
}

.postChangeBtn {
	display: inline-block;
	right: 0;
	top: 0;
	position: absolute;
}

.postChangeBtn button {
	margin-top: 0;
	border-radius: 10px;
}

.postList {
	cursor: pointer;
	border: 1px solid;
	margin: 10px;
}
</style>
<body>
	<div id="app">
		<!-- Breadcrumb Section Begin -->
		<section class="breadcrumb-section set-bg"
			data-setbg="img/breadcrumb.jpg">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<div class="breadcrumb__text">
							<h2>주문/결제</h2>
							<div class="breadcrumb__option">
								<a href="javascript:;" @click="fnHome">Home</a> <span>결제하기</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Breadcrumb Section End -->

		<!-- Checkout Section Begin -->
		<section class="checkout spad">

			<div class="checkout__form">
				<div class="container">

					<div class="checkout__order" style="display: inline-block;">
						<div>
							<h4>배송지</h4>
						</div>
						<div class="postUserName">
							{{selectAddr.name}}<span style="color: red;">({{selectAddr.addrName}})</span>
							<span class="postChangeBtn"><button
									@click="togglePostModal">변경</button></span>
							<div class="postModal"
								:style="{ display: postModalVisible ? 'block' : 'none' }"
								@click="togglePostModal"></div>
							<div class="postModal-content"
								:style="{ display: postModalVisible ? 'block' : 'none' }">
								<div @click="togglePostModal" class="exitBtn">&times;</div>
								<span><h4>주소지 변경</h4></span>
								<template v-for="item in addrList">
									<div class="postList"
										:class="{'CheckedBtn': selectAddrNum===item.addrNo }"
										@click="SelectPostId(item.addrNo)">
										<div>
											{{item.name}}<span style="color: red;">({{item.addrName}})</span><span
												class="PostIcon"><i
												v-if="selectAddrNum===item.addrNo"
												class="bi bi-chevron-down"></i></span>
										</div>
										<div>{{item.phone}}</div>
										<div>{{item.addr}}/{{item.addrDetail}}</div>
									</div>
								</template>
							</div>
						</div>
						<div>{{selectAddr.phone}}</div>
						<div>
							<span>{{selectAddr.addr}} / {{selectAddr.addrDetail}}</span>
						</div>
						<div class="request">
							<button @click="toggleModal"
								style="border-radius: 0 15px 0 0; text-align: left;">
								{{selectRequest}}<span class="btnIcon"><i
									class="bi bi-chevron-down"></i></span>
							</button>
							<input v-if="requestInputOpen" type="text" v-model="addrRequest">
						</div>
						<div class="modal"
							:style="{ display: modalVisible ? 'block' : 'none' }"
							@click="toggleModal"></div>
						<div class="modal-content"
							:style="{ display: modalVisible ? 'block' : 'none' }">
							<div @click="toggleModal" class="exitBtn">&times;</div>
							<span><h4>배송 메모 선택하기</h4></span>
							<p>
								<button :class="{'CheckedBtn': selectNum === 1 }"
									@click="selectedReqestBtn(1)">
									선택 안 함<i v-if="selectNum===1" class="bi bi-chevron-down"></i>
								</button>
							</p>
							<p>
								<button :class="{'CheckedBtn': selectNum === 2 }"
									@click="selectedReqestBtn(2)">
									직접 입력하기<i v-if="selectNum===2" class="bi bi-chevron-down"></i>
								</button>
							</p>
							<p>
								<button :class="{'CheckedBtn': selectNum === 3 }"
									@click="selectedReqestBtn(3)">
									문앞에 놓아 주세요<i v-if="selectNum===3" class="bi bi-chevron-down"></i>
								</button>
							</p>
							<p>
								<button :class="{'CheckedBtn': selectNum === 4 }"
									@click="selectedReqestBtn(4)">
									부재시 연락 부탁드려요<i v-if="selectNum===4" class="bi bi-chevron-down"></i>
								</button>
							</p>
							<p>
								<button :class="{'CheckedBtn': selectNum === 5 }"
									@click="selectedReqestBtn(5)">
									배송전 미리 연락 부탁드려요<i v-if="selectNum===5"
										class="bi bi-chevron-down"></i>
								</button>
							</p>
							<p>
								<button :class="{'CheckedBtn': selectNum === 6 }"
									@click="selectedReqestBtn(6)">
									(저장됨){{selectAddr.addrRequest}}<i v-if="selectNum===6"
										class="bi bi-chevron-down"></i>
								</button>
							</p>
						</div>
					</div>

				</div>
			</div>
		</section>
		<section class="checkout spad">
			<div class="container">
				<div class="checkout__order">
					<h4>주문정보</h4>


					<div class="checkout__order__subtotal">
						금액 <span>{{noRatePrice}}원</span>
					</div>
					<div class="checkout__order__subtotal">
						적립금 <span>{{pRatePrice}} Point</span>
					</div>
					<div class="checkout__order__subtotal">
						총 할인된 금액 <span>{{ratePrice}}원({{Math.round(paymentRatePrice/paymentNoRatePrice*100)}}%)</span>
					</div>
					<div class="checkout__order__subtotal">
						적립금 사용<span>사용가능포인트({{user.point}} Point) <input
							type="text" v-model="usePoint" @keyup="totalPrice"
							placeholder="5000원 이상부터 사용 가능"
							style="font-size: 15px; width: 200px; text-align: center;">
							Point
						</span>
					</div>
					<div class="checkout__order__subtotal">
						배송비 <span v-if="paymentNoRatePrice > 10000"> 0원 (10,000원 이상
							배송비 무료)</span> <span v-if="paymentNoRatePrice < 10000"> 3000원
							(10,000원 이상 배송비 무료)</span>
					</div>
					<div class="checkout__order__total">
						총 금액 <span>{{totalPay}}원</span>
					</div>

					<button @click="requestPay" class="site-btn">
						<img src="../img/logo/kakaoPay.png" alt="카카오페이"> 카카오페이
					</button>
					

				</div>
			</div>
	</div>
	</div>
	</section>
	<!-- Checkout Section End -->
	</div>


	<!-- Js Plugins -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>

<script>
	var app = new Vue({
		el : '#app',
		data : {
			userId : "${userId}",
			cartItems : [],
			list : [],
			totalPay : 0,
			ratePrice : 0,
			noRatePrice : 0,
			pRatePrice : 0,
			user : {},
			usePoint : "",
			paymentPRatePrice : 0,
			paymentTotalPay : 0,
			paymentNoRatePrice : 0,
			paymentRatePrice : 0,
			addrList : [],
			modalVisible : false,
			selectAddr : {},
			selectRequest : "배송 메모를 선택해 주세요",
			requestInputOpen : false,
			addrRequest : "",
			selectNum : "",
			postModalVisible : false,
			selectAddrNum : ""

		},
		computed : {
			payment : function() {
			}
		},
		methods : {
			fnCheckOut : function() {
				var self = this;
				$.ajax({
					url : "kakaoPay.dox",
					dataType : "json",
					type : "POST",
					data : {},
					success : function(data) {
						self.cartItems = data;

					},
					error : function(error) {
						console.log("Error fetching cart list:", error);
					}
				});
			},
			selectedReqestBtn : function(num) {
				var self = this;
				if (num == 1) {
					self.selectRequest = "선택 안 함";
					self.requestInputOpen = false;

				}
				if (num == 2) {
					self.selectRequest = "직접 입력하기";
					self.addrRequest = "";
					self.requestInputOpen = true;

				}
				if (num == 3) {
					self.selectRequest = "문앞에 놓아 주세요";
					self.requestInputOpen = false;

				}
				if (num == 4) {
					self.selectRequest = "부재시 연락 부탁드려요";
					self.requestInputOpen = false;

				}
				if (num == 5) {
					self.selectRequest = "배송전 미리 연락 부탁드려요";
					self.requestInputOpen = false;

				}
				if (num == 6) {
					self.selectRequest = "직접 입력하기";
					self.requestInputOpen = true;
					self.addrRequest = self.selectAddr.addrRequest;

				}
				self.selectNum = num;
				self.toggleModal();

			},
			SelectPostId : function(addrNo) {
				var self = this;
				for (var i = 0; i < self.addrList.length; i++) {
					if (self.addrList[i].addrNo == addrNo) {
						self.selectAddr = self.addrList[i];
					}
				}
				self.togglePostModal();
				self.requestInputOpen = false;
				self.selectRequest = "배송 메모를 선택해 주세요";
				self.selectNum = "";
				self.selectAddrNum = addrNo;
			},
			toggleModal : function() {
				this.modalVisible = !this.modalVisible;
				console.log(this.modalVisible);
				if (this.modalVisible) {
					document.body.style.overflow = 'hidden';
				} else {
					document.body.style.overflow = ''; // 기본값으로 되돌리기
				}
			},
			togglePostModal : function() {
				this.postModalVisible = !this.postModalVisible;
				console.log(this.postModalVisible);
				if (this.postModalVisible) {
					document.body.style.overflow = 'hidden';
				} else {
					document.body.style.overflow = ''; // 기본값으로 되돌리기
				}
			},

			fnCartList : function() {
				var self = this;
				var nparmap = {
					userId : self.userId,
					kind : 1,
					cartCheck : 1

				};
				$.ajax({
					url : "/cart/list.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						self.list = data.list;
						self.totalPrice();
						self.user = data.user;
						self.addrList = data.addrList;
						self.selectAddr = data.addrList[0];
						self.selectAddrNum = data.addrList[0].addrNo;
					}
				});
			},

			fnHome : function() {
				location.href = "main.do";
			},
			totalPrice : function() {
				var self = this
				var noRatePay = 0;
				for (var i = 0; i < self.list.length; i++) {
					noRatePay += self.list[i].price * self.list[i].selectcnt;
				}
				self.paymentNoRatePrice = noRatePay;
				self.noRatePrice = noRatePay.toLocaleString('ko-KR');

				var pay = 0;
				for (var i = 0; i < self.list.length; i++) {
					pay += self.list[i].price * self.list[i].selectcnt
							* (100 - self.list[i].sRate) / 100;
				}

				if (self.usePoint != 0) {
					if (self.user.point < self.usePoint) {
						self.usePoint = self.user.point;
					}
					if (self.usePoint > pay) {
						self.usePoint = pay;
					}
					pay = pay - self.usePoint;

				}
				;

				if (self.paymentNoRatePrice < 3000) {
					self.paymentTotalPay = pay + 3000;
					self.totalPay = (pay + 3000).toLocaleString('ko-KR');
				} else {
					self.paymentTotalPay = pay;
					self.totalPay = pay.toLocaleString('ko-KR');
				}

				var rate = 0;
				for (var i = 0; i < self.list.length; i++) {
					rate += self.list[i].price * self.list[i].selectcnt
							* (self.list[i].sRate / 100)

				}
				self.paymentRatePrice = rate;
				self.ratePrice = rate.toLocaleString('ko-KR');

				var pRate = 0;
				for (var i = 0; i < self.list.length; i++) {
					pRate += self.list[i].price * self.list[i].selectcnt
							* (self.list[i].pRate / 100);
				}
				self.paymentPRatePrice = pRate;
				self.pRatePrice = pRate.toLocaleString('ko-KR');
			},

			requestPay : function() {
				var self = this;
				if (self.usePoint != "") {
					if (self.usePoint < 5000) {
						alert("5000원 이상부터 사용 가능합니다.");
						return;
					}
				}
				if(self.selectRequest ==="배송 메모를 선택해 주세요"){
					alert("배송 메모를 선택해 주세요");
					return;
				}
				if(self.selectRequest==="직접 입력하기"){
					if(self.addrRequest===""){
						alert("배송 메모를 입력해 주세요");
						return;
					}
					
				}

				var IMP = window.IMP;

				IMP.init("imp71268227");

				var randomNum = {};
				randomNum.random = function(n1, n2) {
					return parseInt(Math.random() * (n2 - n1 + 1)) + n1;
				};
				//인증번호를 뽑을 난수 입력 n 5이면 5자리
				randomNum.authNo = function(n) {
					var value = "";
					for (var i = 0; i < n; i++) {
						value += randomNum.random(0, 9);
					}
					return value;
				};
				console.log();
				var ReceiptCode = randomNum.authNo(100)

				if (self.paymentTotalPay == 0) {
					if (confirm("포인트로 전액 결제 하시겠습니까?")) {
						self.paymentEndCart();
						self.paymentEndUser();
						self.paymentEndChart();
						self.paymentEndHistorySave(ReceiptCode);
						alert("결제완료");
						return;
					}

					return;
				}

				IMP.request_pay({
					pg : "kakaopay.TC0ONETIME", //Test는 TC0ONETIME
					pay_method : "card",
					merchant_uid : ReceiptCode, //그냥 랜덤
					name : self.list[0].itemName, // 상품명
					amount : self.totalPay, // 가격
					buyer_email : self.user.email, //유저 이메일
					buyer_name : self.user.name, // 구매자명
					buyer_tel : self.user.phone1 + self.user.phone2
							+ self.user.phone3, // 유저 번호
					buyer_addr : '서울특별시', // 주소
					buyer_postcode : '123-456', //
				}, function(rsp) {
					console.log(rsp);
					$.ajax({
						type : 'POST',
						url : '/verifyIamport/' + rsp.imp_uid
					}).done(function(data) {
						if (rsp.paid_amount === data.response.amount) {
							
							if(self.usePoint == ""){
								self.usePoint = 0;
							};

							self.paymentEndCart();
							self.paymentEndUser();
							self.paymentEndChart();
							self.paymentEndHistorySave(ReceiptCode);
							alert("결제 성공");

							/* location.href = "main.do"; */

						} else {
							alert("결제 실패");
						}
					});
				});
			},
			paymentEndCart : function() {
				var self = this;
				var nparmap = {
					userId : self.userId
				};
				$.ajax({
					url : "paymentEndCart.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {

					}
				});
			},
			paymentEndUser : function() {
				var self = this;
				var nparmap = {
					userId : self.userId,
					totalPay : self.paymentTotalPay,
					usePoint : self.usePoint,
					rewardPoint : self.paymentPRatePrice
				};
				$.ajax({
					url : "paymentEndUser.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
					}
				});
			},
			paymentEndChart : function() {
				var self = this;

				for (var i = 0; i < self.list.length; i++) {
					var itemNo = self.list[i].itemNo;
					var selectCnt = self.list[i].selectcnt;

					var nparmap = {
						itemNo : itemNo,
						selectCnt : selectCnt

					};
					$.ajax({
						url : "paymentEndChart.dox",
						dataType : "json",
						type : "POST",
						data : nparmap,
						success : function(data) {
						}
					});

				}

			},
			paymentEndHistorySave : function(paymentKey) {
				var self = this;
				console.log(self.usePoint);
				
				var nparmap = {
					userId : self.userId,
					paymentKey : paymentKey,
					usePoint : self.usePoint,
					rewardPoint : self.paymentPRatePrice,
					sumPrice : self.paymentTotalPay,
					addrNo : self.selectAddrNum
				};
				$.ajax({
					url : "paymentEndHistorySave.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						 for (var i = 0; i < self.list.length; i++) {
							console.log(self.list[i].itemNo);
							var nparmap = {
								paymentNo : data.paymentNo,
								itemNo : self.list[i].itemNo,
								selectCnt : self.list[i].selectcnt
							};
							$.ajax({
								url : "paymentEndHistoryDetailSave.dox",
								dataType : "json",
								type : "POST",
								data : nparmap,
								success : function(data) {
								}
							});
						} 

					}
				});

			}

		},

		created : function() {
			var self = this;
			self.fnCartList();
		}
	});
</script>

