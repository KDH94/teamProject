<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script src="js/jquery.js"></script>
<title>푸터</title>
<style type="text/css">
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

.upArrow {
	width: 50px;
	position: fixed;
	bottom: 30px;
	right: 60px;
	cursor: pointer;
	display: none;
}
</style>
</head>
<body>
	<!-- Footer Section Begin -->
	<footer class="footer spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-6 col-sm-6"
					style="border-right: 1px solid #ccc;">
					<div class="footer__about">
						<ul>
							<li style="font-weight: bold; font-size: 18px;">에코마켓 고객센터<span
								style="margin-left: 5px; color: rgb(44, 157, 89);">1644-1107</span></li>
							<li>화-목요일 11:00 ~ 18:00 (점심시간 12:00 ~ 13:00)</li>
							<li>월·금요일 09:00 ~ 18:00 (점심시간 12:00 ~ 13:00)</li>
							<li>토·일·공휴일 휴무</li>
							<li>
								<div class="footer__widget">
									<div class="footer__widget__social">
										<div style="margin-top: 50px;">
											<a href="https://www.facebook.com/"><i class="fa fa-facebook"></i></a>
											<a href="https://www.instagram.com/"><i class="fa fa-instagram"></i></a>
											<a href="https://twitter.com/"><i class="fa fa-twitter"></i></a>
											<a href="https://www.pinterest.co.kr/"><i class="fa fa-pinterest"></i></a>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6 offset-lg-1"
					style="border-right: 1px solid #ccc;">
					<div class="footer__widget"
						style="margin-right: auto; margin-left: auto;">
						<div style="font-size: 18px; font-weight: bold;">사이트 정보</div>
						<ul>
							<li><a href="/Terms-Conditions.do" target="_blank"
								onclick="window.open('/Terms-Conditions.do', 'TermsPopup', 'width=500, height=900'); return false;">이용약관</a></li>
							<li><a href="/Privacy-Policy.do" target="_blank"
								onclick="window.open('/Privacy-Policy.do', 'TermsPopup', 'width=500, height=900'); return false;">개인정보처리방침</a></li>
							<li><a href="javascript:;">이용안내</a></li>
							<li><a href="javascript:;">회사정보</a></li>
							<li><a href="javascript:;">사업자등록번호</a></li>
							<li><a href="javascript:;">입점문의</a></li>
							<li><a href="javascript:;">채용문의</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div style="margin-left: 20px;">
						<div class="footer__about__logo">
							<a href="/main.do"><img src="img/logo/mainLogo.png" alt="메인 로고" style="width: 150px;"></a>
						</div>
						<p>상호명: ㈜에코마켓 | 대표: 김임시 | <br>사업자등록번호: 123-45-67890 | <br>소재지: 인천광역시 부평구 경원대로 1366, 7층(상록스테이션탸워)</p>
						<p>통신판매업 신고번호: 2024-테스트부-0101 | 제휴 및 납품 문의: admin@ecomarket.co.kr</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="footer__copyright">
						<div class="footer__copyright__text">
							<p>
								Copyright &copy;
								<!-- <script>document.write(new Date().getFullYear());</script> -->
								<%=new java.util.Date().toLocaleString().substring(0, 4)%>
								All rights reserved | <i class="fa fa-heart" aria-hidden="true"></i>
								by <a href="javascript:;">에코마켓</a>
							</p>
						</div>
						<div class="footer__copyright__payment">
							<img src="img/payment-item.png" alt="">
						</div>
					</div>
					<div></div>
				</div>
			</div>
		</div>
		<div><img src="img/logo/upArrow.png" alt="to up scroll" class="upArrow" id="scrollToTop"></div>
	</footer>
</body>
<script type="text/javascript">
$(document).ready(function() {
    $(window).scroll(function() {
        if ($(this).scrollTop() === 0) {
            $('.upArrow').fadeOut('fast');
        } else {
            $('.upArrow').fadeIn('fast');
        }
    });

    $('#scrollToTop').click(function() {
        $('html, body').css('scroll-behavior', 'auto');
        $('html, body').animate({scrollTop: 0}, 'slow');
    });
});
</script>
</html>
