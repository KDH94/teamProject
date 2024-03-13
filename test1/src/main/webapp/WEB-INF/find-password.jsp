<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>비밀번호 찾기</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<div>아이디 입력:
			<input type="text" v-model="inputId" :disabled="checkIdFlg" @keyup.enter="fnSearchId">
			<button @click="fnSearchId">확인</button>
		</div>
		<div v-if="checkIdFlg">
			<input type="text" v-model="inputNumber" :disabled="inputFlg" @input="validateInput" @keydown.enter="fnSms" placeholder="폰번호 입력">
			<button v-if="!phoneAuthFlg" @click="fnSms">인증번호받기</button>
			<button v-if="phoneAuthFlg" @click="fnRePhone">핸드폰번호 다시 입력하기</button>
			<!-- <input type="text" v-model="inputNumber" :disabled="checkArthFlg" placeholder="폰번호 입력"> -->
			<!-- <button @click="fnSms">전송</button> -->
		</div>
		<div v-if="phoneAuthFlg">
			<h3>인증번호</h3>
			<input type="text" v-model="inputNumber1" placeholder="숫자 6자리 입력"
				@input="validateInput1" @keydown.enter="fnAuth()">
				<span>{{timer}}</span>
			<div>
				<a href="javascript:;" @click="fnSms()">재전송</a>
			</div>
			<button @click="fnClose()">닫기</button>
			<button @click="fnAuth()">확인</button>
		</div>
		<button v-if="!phoneAuthFlg" @click="fnClose()">닫기</button>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
    	checkIdFlg: false,
    	checkArthFlg: false,
    	inputId: "",
    	phoneNum: "",
   		phoneAuthFlg : false,
		inputFlg : false,
		inputNumber : "",	// 핸드폰 번호 입력
		inputNumber1 : "",	// 인증번호 입력
		timer : "",			// 인증시간 표시
		count : 180, // 인증시간을 3분(180초)으로 설정
		number : ""	// 인증번호 비교
    }
    , methods: {
		validateInput : function() {
			// 정규식을 사용하여 숫자만 허용
			this.inputNumber = this.inputNumber.replace(/\D/g, '');
			//숫자11자리만 사용 가능
			if (this.inputNumber.length > 11) {
				this.inputNumber = this.inputNumber.slice(0, 11);
			}
		},
		//인증번호 정규식
		validateInput1 : function(){
			// 정규식을 사용하여 숫자만 허용
			this.inputNumber1 = this.inputNumber1.replace(/\D/g, '');
			//숫자6자리만 사용 가능
			if(this.inputNumber1.length > 6){
				this.inputNumber1 =  this.inputNumber1.slice(0, 6);
			}
		},
        fnSearchId: function() {
            var self = this;
	        var nparmap = {userId : self.inputId};
	        $.ajax({
	            url:"check.dox",
	            dataType:"json",
	            type: "POST", 
	            data: nparmap,
	            success: function(data) {
	            	if(data.result == "success") {
	            		alert("없는 아이디입니다!");
	            		self.checkIdFlg = false;
	            	} else {
	            		alert("있는 아이디입니다!");
	            		self.checkIdFlg = true;
	            		console.log(data);
	            		//self.phoneNum = data.phone;
	            	}
	            }
	        });
		},
		//문자 인증받기 
		fnSms : function() {
			var self = this;
			if(self.inputNumber == ""){
				alert("핸드폰 번호를 입력해주세요");
				return;
			}else if (self.inputNumber.length !== 11) {
		        alert("핸드폰번호 11자리여야 합니다.");
		        return;
		    }
			var nparmap = {
				phoneNumber : self.inputNumber
			};
			$.ajax({
				url : "send-one",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					console.log(data);
					if (data.response.statusCode == "2000") {
						alert("문자전송했습니다");
						self.number = data.number;	//인증번호를 가져와서 저장
						self.inputFlg = true;
						self.phoneAuthFlg = true;
						setInterval(self.fnTimer, 1000);	//함수호출하여 시간표시
					} else {
						alert("문자전송실패했습니다");
						self.inputFlg = false;
						self.phoneAuthFlg = false;
					}
				}
			});
		},
		/* 핸드폰번호 다시 입력 */
		fnRePhone : function() {
			var self = this;
			self.inputFlg = false;
			self.phoneAuthFlg = false;
			self.inputNumber = "";
			
		},
		/* 인증번호 시간설정 */
		fnTimer : function() {
		    var self = this;  // Vue 인스턴스에 대한 참조를 변수에 저장
		    // 분, 초 계산
		    var minutes, seconds;
		    minutes = parseInt(self.count / 60, 10);  // 전체 초를 60으로 나누어 분 계산
		    seconds = parseInt(self.count % 60, 10);  // 전체 초를 60으로 나눈 나머지가 초
		
		    // 분과 초를 10진수로 표현
		    minutes = "0" + minutes;  // 분이 10 미만일 경우 앞에 0을 추가
		    seconds = seconds < 10 ? "0" + seconds : seconds;  // 초가 10 미만일 경우 앞에 0을 추가
		    // 화면에 표시될 타이머 문자열을 생성
		    self.timer = minutes + " : " + seconds;
		    // 타이머 카운트 다운
		    if (--self.count < 0) {
		        // 시간 초과 시 처리
		        alert("시간초과했습니다 다시 인증해주세요.");
		        self.count = 180;  // 초기값으로 시간을 재설정 (3분, 180초)
		        // 화면을 갱신하는 부분 (페이지 새로고침)
		        location.reload(true);
		    }
		},
		//인증완료시 실행
		fnAuth : async function () {
		    var self = this;
		    if (self.inputNumber1 === "") {
		        alert("인증번호를 입력해주세요.");
		        return;
		    } else if (self.inputNumber1.length !== 6) {
		        alert("인증번호는 6자리여야 합니다.");
		        return;
		    }
		    if (self.number == self.inputNumber1) {
		        alert("인증되었습니다.");
		       
		        if (window.opener && !window.opener.closed) {
		            try {
		                await new Promise(resolve => setTimeout(resolve, 500)); // 예시: 500ms 동안 대기
		                window.opener.location.href = "/user-join.do";	// 메인 페이지 URL로 변경
		                window.close();
		            } catch (error) {                
		                console.error("부모 창을 열 수 없습니다:", error);
		            }
		        } else {
		            alert("부모 창이 닫혀있거나 유효하지 않습니다.");
		        }
		    } else {
		        alert("인증번호 다시 확인 부탁드립니다.");
		    }
		},
		//팝업창 닫기
		fnClose : function() {
			var self = this;
			window.close();
		}
    }
    , created: function() {
    	var self = this;
	}
});
</script>