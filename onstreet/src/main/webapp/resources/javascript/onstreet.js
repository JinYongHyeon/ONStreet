/**
 * 
 */
$(document).ready(function(){
	//로그아웃 진용현
	$(document).on("click","#logout",function(){
		$("#logoutForm").submit();
	});
	
	//로그인폼 열기 진용현
	$(document).on("click","#loginFormBtn",function(){
		$("#login").show();
	});
	
	//로그인폼 창닫기 진용현 
	$(document).on("click","#login .loginTitle svg",function(){
		$("#login").hide();
	});
	
		var idCoin = 0;
	var nickCoin = 0;
	var telCoin = 0;
	$(document).ready(function(){
		// 아이디 중복 진용현
		$("#registerId").keyup(function(){
			if($(this).val().length <4 || $(this).val().length >=10){
				$("#idCheck").text("4자이상 10자이하로 입력해주세요").css("color","#ff0000");
				idCoin =0;
				return;
			}
			$.ajax({
				type:"get",
				url:"idCheck.do",
				dataType:"text",
				data:"id="+$(this).val(),
				success:function(event){
					if(event === "id_ok"){
						$("#idCheck").text("사용 가능한 아이디입니다").css("color","#0000ff");
						idCoin =1;
					}else if(event === "id_fail"){
						$("#idCheck").text("사용 불가능한 아이디입니다").css("color","#ff0000");
						idCoin =0;
					}
				}
			});
		});
		// 회원가입 체크 - 진용현
		$("#registerForm").submit(function(){
			var flag = false;
			if(idCoin == 0){
				alert("아이디 중복체크를 해주십시오");
				$("#registerId").focus();
				return false;
			}
			var password = $("#registerForm input[name=password]").val();
			var passCheck = $("#registerForm input[name=passwordCheck]").val();
			if(password === passCheck){
				flag  = true;
			}
			if(flag === false){
				alert("비밀번호가 일치하지 않습니다.");
				$("#registerForm input[name=password]").focus();
				return false;
			}
			if(nickCoin == 0){
				alert("닉네임 중복체크를 해주십시오");
				$("#registerForm input[name=nickName]").focus();
				return false;
			}
			if($("#registerAddress").val()==""){
				alert("주소를 입력해주세요");
				return false;
			}
			if(telCoin == 0){
				alert("전화번호를 다시 입력해주세요.");
				$("registerForm input[name=phone]").focus();
				return false;
			}
			if($("#registerForm input[name=age]").val().length >10 || $("#registerForm input[name=age]").val().length < 10){
				alert("생년월일 다시 입력해주세요");
				return false;
			}
			
			return flag;
		});
		
		// 닉네임 중복 체크 - 진용현
		$("#registerForm input[name=nickName]").keyup(function(){
			if($(this).val().length<2 || $(this).val().length>=10){
				$("#nickNameCheck").text("2자이상 10자이하로 입력해주세요").css("color","#ff0000");
				nickCoin = 0;
				return;
			}
			$.ajax({
				type:"get",
				url:"nickNameCheck.do",
				dataType:"text",
				data:"nickName="+$(this).val(),
				success:function(event){
					if(event==="0"){
						$("#nickNameCheck").text("사용가능한 닉네임입니다").css("color","#0000ff");
						nickCoin = 1;
					}else if(event==="1"){
						$("#nickNameCheck").text("이미 존재하는 닉네임입니다").css("color","#ff0000");
						nickCoin = 0;
					}
				}
			});
		});
		//전화번호 숫자 체크 - 진용현
		$("#registerForm input[name=phone]").keyup(function(){
			var telLength = $(this).val();
			
			if(telLength.length<11 || telLength.length>11){
				$("#registerTelCheck").text("전화번호 11자리 입력해주세요").css("color","#ff0000");
					telCoin = 0; 
			}else if(isNaN(telLength)){
				$("#registerTelCheck").text("전화번호 숫자만 입력해주세요").css("color","#ff0000");
					telCoin = 0;
			}else{
				$("#registerTelCheck").text("사용 가능한 전화번호 입니다").css("color","#0000ff");
					telCoin = 1;
			}
		});
		
		//이미지 확장자 체크 - 진용현
		$(document).on("change","#registerForm input[name=profileFile]",function(){
			//확장자 체크
			var ext =  $(this).val().split(".").pop().toLowerCase();
			
			if($.inArray(ext,["gif","jpg","jpeg", ,"png"]) == -1){
				alert("gif,jpg,jpeg,png 파일만 업로드 해주세요.");
				$("#registerForm .defaultprofile img").attr("src","resources/img/profile/default.png");
				$(this).val("");
				return;
			}
			preViewProfile(); //정상적인 이미지 일경우 작동
		});
		
	});
		
});
//ready end
//이미지 미리보기 - 진용현
	function preViewProfile(){
		var reader = new FileReader();//파일읽기
		
		reader.onload = function(evnet){
			$("#registerForm .defaultprofile img").attr("src",event.target.result); //img 속성 중 src에 주소값 넣기
		}
		reader.readAsDataURL(event.target.files[0]);
	}
	
	//KAKAO 주소 API - 진용현
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
				} else {
					
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById("registerAddress").value = addr;
			}
		}).open();
		}

