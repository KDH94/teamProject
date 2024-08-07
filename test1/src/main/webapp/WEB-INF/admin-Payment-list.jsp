<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>


<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Dashboard - SB Admin</title>

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

<link rel="stylesheet"
	href="https://cdn.datatables.net/2.0.5/css/dataTables.bootstrap.css" />


<script src="https://cdn.datatables.net/2.0.5/js/dataTables.js"></script>




<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.datatables.net/2.0.5/css/dataTables.dataTables.css" />

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

.dt-search {
	text-align: right;
}

.paymentDetailModal {
	position: fixed;
	background-color: rgba(0, 0, 0, 0.5);
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	z-index: 9998;
}
.postDetailModal{
position: fixed;
	background-color: rgba(0, 0, 0, 0.5);
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	z-index: 9999;
}

.paymentDetailModal-contents {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	width: 70%;
	height: 800px;
	padding: 20px;
	border-radius: 5px;
	z-index: 9999;
	font-family: 'KOTRA_GOTHIC';
}
.postDetailModal-contents{
position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	width: 30%;
	height: 500px;
	padding: 20px;
	border-radius: 5px;
	z-index: 10000;
	text-align: center;
	font-family: 'KOTRA_GOTHIC';
	
}

.exitBtn{
	cursor: pointer;
	display: inline-block;
	font-size: 25px;
}
.psotInfoBtn{
	border-radius: 15px;
	font-size: 20px;
	
}
.psotInfoBtn:hover{
	 
	
}
</style>
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
					<input @keyup.enter="fnMoveUserDetail" class="form-control"
						type="text" placeholder="유저 아이디로 검색..." aria-label="유저 아이디로 검색..."
						aria-describedby="btnNavbarSearch" v-model="keywordId" autofocus />
					<button class="btn btn-primary" id="btnNavbarSearch" type="button"
						@click="fnMoveUserDetail">
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
									<a class="nav-link" href="#"
										@click="fnMoveProductList('gluten')">글루텐프리</a> <a
										class="nav-link" href="#" @click="fnMoveProductList('local')">로컬</a>
									<a class="nav-link" href="#"
										@click="fnMoveProductList('vegan')">비건</a> <a class="nav-link"
										href="#" @click="fnMoveProductList('org')">유기농</a>

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
											<a class="nav-link" href="#"
												@click="handleAddProduct('gluten')">글루텐프리</a> <a
												class="nav-link" href="#" @click="handleAddProduct('local')">로컬</a>
											<a class="nav-link" href="#"
												@click="handleAddProduct('vegan')">비건</a> <a
												class="nav-link" href="#" @click="handleAddProduct('org')">유기농</a>
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
											<a class="nav-link" href="javascript:;"
												@click="fnMoveBoardList(1)">공지게시판 이동</a> <a class="nav-link"
												href="javascript:;" @click="fnMoveBoardList(2)">레시피게시판
												이동</a>

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
							<a class="nav-link" href="/AdminProductChart.do">
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
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 결제로그
					</div>
					<div class="card-body">
						<table id="payment_table" class="table table-bordered table-hover"
							style="width: 100%">
							<thead>
								<tr>
									<th width="5%">paymentNo</th>
									<th width="20%">사용자 아이디</th>
									<th width="20%">총 결제금액</th>
									<th width="20%">결제에 사용한 포인트</th>
									<th width="20%">적립된 포인트</th>
									<th width="15%">결제일</th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="item in list"
									@click="fnPaymentDetail(item.paymentNo,item.addrNo)"
									style="cursor: pointer;">
									<td>{{item.paymentNo}}</td>
									<td>{{item.userId}}</td>
									<td>{{item.sumPrice.toLocaleString('ko-KR')}}</td>
									<td>{{item.usePoint.toLocaleString('ko-KR')}}</td>
									<td>{{item.rewardPoint.toLocaleString('ko-KR')}}</td>
									<td>{{item.payTime}}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

		<div class="paymentDetailModal" @click="togglePaymentModal"
			:style="{ display: paymentModalVisible ? 'block' : 'none' }"></div>
		<div class="paymentDetailModal-contents"
			:style="{ display: paymentModalVisible ? 'block' : 'none' }">
			<div @click="togglePaymentModal" class="exitBtn">&times;</div>
			<span><h4>상세정보 <button @click="fnPostInfo" class="psotInfoBtn">배송정보</button></h4> </span>

			<table id="paymentList_table"
				class="table table-bordered  table-hover" style="width: 100%">
				<thead>
					<tr>
						<th width="25%">구매한 상품</th>
						<th width="10%">구매 가격</th>
						<th width="15%">할인받은 금액</th>
						<th width="20%">적립금</th>
						<th width="20%">상품 개수</th>
						<th width="25%">결제일</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="item in detailList" @click="fnDetailView(item.itemNo)" style="cursor: pointer;" >
						<td>{{item.itemName}}</td>
						<td>{{(item.price-(item.price*item.sRate/100)).toLocaleString('ko-KR')}} 원</td>
						<td>{{(item.price*item.sRate/100*item.sellCnt).toLocaleString('ko-KR')}} 원 /{{item.sRate}}%</td>
						<td>{{(item.price*item.pRate/100*item.sellCnt).toLocaleString('ko-KR')}} 포인트 /{{item.pRate}}%</td>
						<td>{{item.sellCnt}}개</td>
						<td>{{item.paytime}}</td>
					</tr>
				</tbody>
			</table>

		</div>
		<div class="postDetailModal" @click="togglePostModal"
			:style="{ display: postModalVisible ? 'block' : 'none' }"></div>
			
			<div class="postDetailModal-contents"
			:style="{ display: postModalVisible ? 'block' : 'none' }">
			<div @click="togglePostModal" class="exitBtn">&times;</div>
			<span><h4>배송정보</h4></span>
			<div>{{selectPost.name}}<span style="color: red;">({{selectPost.addrName}})</span></div>
			<div>{{selectPost.phone}}</div>
			<div>{{selectPost.addr}} / {{selectPost.addrDetail}}</div>
			
		</div>



	</div>
</body>

<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			list : [],
			userId : "${userId}",
			keywordId : "",
			userType : "${userType}",
			paymentModalVisible : false,
			detailList :[],
			postModalVisible : false,
			addrNo : "",
			selectPost : []
		},
		methods : {
			togglePaymentModal :  function() {
				var self = this;
				this.paymentModalVisible = !this.paymentModalVisible;
				console.log(this.paymentModalVisible);
				if (this.paymentModalVisible) {
					document.body.style.overflow = 'hidden';
					
				} else {
					document.body.style.overflow = ''; // 기본값으로 되돌리기
					self.detailList = [];
					setTimeout(()=>{
                		new DataTable('#paymentList_table');
		            }  , 10);
				}
			},
			togglePostModal :  function() {
				var self = this;
				this.postModalVisible = !this.postModalVisible;
				console.log(this.postModalVisible);
				if (this.postModalVisible) {
					document.body.style.overflow = 'hidden';
					
				} else {
					document.body.style.overflow = ''; // 기본값으로 되돌리기
					
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
			fnMoveUserDetail : function() {
				var self = this;
				var url = "adminUserDetail.do?userId=" + self.keywordId;

				var width = 500;
				var height = 550;
				var left = (screen.width - width) / 2;
				var top = (screen.height - height) / 2;

				window.open(url, "", "width=" + width + ", height=" + height
						+ ", left=" + left + ", top=" + top);
			},
			fnList :  function() {
				var self = this;
				if (self.userType != "A") {
					alert("관리자만 접근 가능한 페이지입니다.");
					location.href = "main.do";
				}
				 self.fnPaymentData();

			}
		    ,fnPaymentData : function() {
				var self = this;
		        $.ajax({
		                url: "PaymentList.dox",
		                dataType: "json",
		                type: "POST",
		                data: {},
		                success: function(data) {
		                	console.log(data);
				            self.list = data.paymentList;
				           
				            setTimeout(()=>{
				            	/* new DataTable('#payment_table'); */
				            	new DataTable('#payment_table', {
				            	    order: [[0, 'desc']]
				            	});
				            }  , 10); 
		                }
		            });
		    },
			fnPaymentDetail : function(paymentNo,addrNo) {
       		var self = this;
       		self.addrNo = addrNo;
       		var nparmap = {
       			 paymentNo: paymentNo
	            };
				$.ajax({
                url: "PaymentDetailList.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function(data) {
                	 console.log(data);
                     self.detailList = data.paymentDetailList;
                     self.togglePaymentModal();
                     
                     setTimeout(()=>{
                    		new DataTable('#paymentList_table');
                    		
			            }  , 10);
                }
            });  
        },
        fnPostInfo : function() {
       		var self = this;
       		var nparmap = {
       			 addrNo: self.addrNo
	            };
				$.ajax({
                url: "PaymentPost.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function(data) {
                	 console.log(data);
                	 self.togglePostModal();
                	 self.selectPost = data.post;
                }
            });  
        },
		fnDetailView: function(itemNo) {
			var self = this;
			$.pageChange("/productView.do", {itemNo: itemNo, userId: self.userId});
		},
			fnMoveProductList : function(code) {
				var self = this;
				$.pageChange("/AdminProductList.do", {
					code : code
				});
			},
			fnMoveBoardList : function(code) {
				var self = this;
				$.pageChange("/boardList.do", {
					code : code
				});
			},

			handleFormSubmit : function() {
				var self = this;
				// 팝업 창을 열고자 하는 페이지 URL
				var url = "adminUserDetail.do";

				// POST 방식으로 전송할 데이터
				var postData = {
					userId : self.keywordId,
					popupFlg : "yes"
				};

				// form 엘리먼트를 동적으로 생성
				var form = document.createElement("form");
				form.setAttribute("method", "post");
				form.setAttribute("action", url);
				form.setAttribute("target", "_blank"); // 새 창으로 열기

				// 데이터를 form에 추가
				for ( var key in postData) {
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
				var options = "width=" + width + ", height=" + height
						+ ", left=" + left + ", top=" + top;
				// 새로운 창에 대한 참조 저장
				var popupWindow = window.open("", "popup", options);

				// form을 제출하면서 팝업 창에 대한 참조를 반환하도록 수정
				form.target = "popup";
				form.submit();

				// form 제거
				document.body.removeChild(form);
			},
			handleAddProduct : function(code) {
				var self = this;
				// 팝업 창을 열고자 하는 페이지 URL
				var url = "productAdd.do";

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
				for ( var key in postData) {
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
				var options = "width=" + width + ", height=" + height
						+ ", left=" + left + ", top=" + top;
				// 새로운 창에 대한 참조 저장
				var popupWindow = window.open("", "popup", options);

				// form을 제출하면서 팝업 창에 대한 참조를 반환하도록 수정
				form.target = "popup";
				form.submit();

				// form 제거
				document.body.removeChild(form);
			},

			fnMoveAdminPage : function() {
				location.href = "/admin-main.do"
			}
		},
		created : function() {
			var self = this;
			self.fnList();
		}
	})
</script>

<script
	src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
	crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>
<script src="js/datatables-simple-demo.js"></script>

</html>
