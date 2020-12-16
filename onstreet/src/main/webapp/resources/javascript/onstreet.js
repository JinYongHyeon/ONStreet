/**
 * 
 */
$(document).ready(function(){
   /*********************************************** 상단[Heeader]  ***********************************************/
  	 $(document).on("click","#asd",function(){
	if($("#header .navigation .mobileSearch").is(":animated"))return;
	if($(window).width()>480){
		$(this).css("display","none");
      $("#header .bitMainSearch form").animate({
         left:0
      },1000);
	}else{
	$("#header .navigation .mobileSearch").animate({
		right:"0"
	},1000);
      }
   });//검색 아이콘 클릭 EVENT END

  /***********************************************로그인***********************************************/
    //로그아웃 진용현
   $(document).on("click","#logout",function(){
      $("#logoutForm").submit();
   });//로그아웃 EVENT END
   
   //로그인폼 열기 진용현
   $(document).on("click","#loginFormBtn",function(){
      if($("#login").is(":animated")||$("#login").css("display")=="block")return;
      $("#login").css({"display":"block","top":"60%"});
      $("#loginBlind").css("display","block");
      //$("body").css("overflow","hidden");
      $("html").animate({scrollTop:0},1000,function(){
         $(this).css("overflow","hidden");
      });
      $("#loginBlind").animate({
         opacity:0.6
      },1000);
      $("#login").animate({
         top:"50%",
         opacity:1
      },1000);
   });//로그인버튼 클릭 EVENT END
   
   
   //로그인폼 창닫기 진용현 
   $(document).on("click","#login .loginTitle svg",function(){
      if($("#login").is(":animated"))return;
      $("#loginBlind").animate({
         opacity:0
      },1000,function(){
         $(this).hide();
      });
      $("html").css("overflow-y","scroll");
      $("#login").animate({
         top:"40%",
         opacity:0
      },1000,function(){
         $(this).hide();
      });
   });//로그인폼 닫기 클릭 EVENT END
   
	/***********************************************회원가입+회원수정***********************************************/
   var idCoin = 0;//ID중복체크 유무
   var nickCoin = 0;//NICKNAME중복체크 유무
   var telCoin = 0;//전화번호 자릿수 유무
   var passCoin = 0;//패스워드 일치 유무
      // 아이디 중복 진용현
      $("#registerId").keyup(function(){
		$(this).val($(this).val().replace(/ /gi, ''));
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
                  return;
               }else if(event === "id_fail"){
                  $("#idCheck").text("사용 불가능한 아이디입니다").css("color","#ff0000");
                  idCoin =0;
                  return;
               }
            }
         });
      });//아이디 KEYUP EVENT END

      //비밀번호 체크 - 진용현
      $(document).on("keyup","#registerForm input[name=password]",function(){
		$(this).val($(this).val().replace(/ /gi, ''));
         if($(this).val().trim().length<6 || $(this).val().trim().length>14){
            $("#passCheck").text("6자 이상 14자 이하로 입력해주세요").css("color","#ff0000");
            passCoin = 0;
         }else{
            $("#passCheck").text("사용 가능한 비밀번호입니다.").css("color","#0000ff");
            passCoin = 1;
         }
      });//비밀번호 KEYUP END

   // 닉네임 중복 체크 - 진용현
      var nickName = $("#registerForm input[name=nickName],#updateForm input[name=nickName]").val();
      $("#registerForm input[name=nickName],#updateForm input[name=nickName]").keyup(function(){
	$(this).val($(this).val().replace(/ /gi, ''));
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
                  return;
               }else if($("#updateForm input[name=nickName]").val()===nickName){
                  $("#nickNameCheck").text("기존 닉네임입니다.").css("color","#00ff00");
                  nickCoin = 1;
                  return;
               }else if(event==="1"){
                  $("#nickNameCheck").text("이미 존재하는 닉네임입니다").css("color","#ff0000");
                  nickCoin = 0;
                  return;
               }
            }
         });
      });//닉네임 KEYUP EVENT END

	  //전화번호 숫자 체크 - 진용현
      $("#registerForm input[name=phone],#updateForm input[name=phone]").keyup(function(){
		$(this).val($(this).val().replace(/ /gi, ''));
         var telLength = $(this).val();
         if(telLength.length<11 || telLength.length>11){
            $("#registerTelCheck").text("전화번호 11자리 입력해주세요").css("color","#ff0000");
               telCoin = 0; 
               return;
         }else if(isNaN(telLength)){
            $("#registerTelCheck").text("전화번호 숫자만 입력해주세요").css("color","#ff0000");
               telCoin = 0;
               return;
         }else{
            $("#registerTelCheck").text("사용 가능한 전화번호 입니다").css("color","#0000ff");
               telCoin = 1;
               return;
         }
      });//전화번호 KEYUP EVENT END

	//아티스트 소개글 빈공백 제거 
	$(document).on("keyup","#registerForm textarea[name=artistInfo]",function(){
		if($(this).val().length==1){
		$(this).val($(this).val().replace(/ /gi, ''));
		}
	});//소개글 KEYUP END
	
	//이미지 확장자 체크 - 진용현
      $(document).on("change","#registerForm input[name=profileFile],#updateForm input[name=profileFile]",function(){
         //확장자 체크
         var ext =  $(this).val().split(".").pop().toLowerCase();
         
         if($.inArray(ext,["gif","jpg","jpeg", ,"png"]) == -1){
            alert("gif,jpg,jpeg,png 파일만 업로드 해주세요.");
            $("#registerForm .defaultprofile img").attr("src","resources/img/profile/default.png");
            $(this).val("");
            return;
         }
         preViewProfile(); //정상적인 이미지 일경우 작동
      });//이미지 확장자체크 EVENT END
      
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
         
         if(passCoin == 0){
            alert("비밀번호 다시 입력해주세요.");
            $("#registerForm input[name=password]").focus();
            return false;
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
      });//회원가입 종합체크 EVENT END

//회원수정 체크 -- 진용현
   var nickName = $("#registerForm input[name=nickName],#updateForm input[name=nickName]").val();
   $("#updateForm").submit(function(){
      if($("#updateForm input[name=nickName]").val()!==nickName){
         if(nickCoin == 0){
            alert("닉네임 중복체크를 해주십시오");
            $("#registerForm input[name=nickName]").focus();
            return false;
         }
      }
      
      if($("#registerAddress").val()==""){
            alert("주소를 입력해주세요");
            return false;
      }
      if($("#updateForm input[name=phone]").val().length<11 || $("#updateForm input[name=phone]").val().length>11 || isNaN($("#updateForm input[name=phone]").val())){
         if(telCoin == 0){
            alert("전화번호를 다시 입력해주세요.");
            $("#updateForm input[name=phone]").focus();
            return false;
         }
      }
      if($("#updateForm input[name=age]").val().length >10 || $("#updateForm input[name=age]").val().length < 10){
            alert("생년월일 다시 입력해주세요");
            return false;
         }
   });//회원수정 종합 체크 EVENT END

//[회원수정] 비밀번호 변경 기능 - 진용현
   $("#passwordUpdateForm button").click(function(){
   var elementToken = document.querySelector('meta[name="_csrf"]');
   var token = elementToken && elementToken.getAttribute("content");
   var elementHeader = document.querySelector('meta[name="_csrf_header"]');
   var header = elementHeader && elementHeader.getAttribute("content");
   
   if($("#passwordUpdateForm input[name=passwordChange]").val() !== $("#passwordUpdateForm input[name=passwordCheck]").val()){
      $("#passwordUpdateForm input[name=passwordChange]"). focus();
      alert("변경될 비밀번호가 일치하지 않습니다.");
      return;
   }else if($("#passwordUpdateForm input[name=passwordChange]").val().length<6){
		alert("변경될 비밀번호를 6자 이상 입력해주세요");
	    $("#passwordUpdateForm input[name=passwordChange]"). focus();
		return;
	}
   $.ajax({
      type:"post",
         url:"updatePassword.do",
         dataType:"text",
         data:"password="+$("#passwordUpdateForm input[name=password]").val()+"&passwordChange="+$("#passwordUpdateForm input[name=passwordChange]").val(),
         beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
          xhr.setRequestHeader(header, token);
         },
         success:function(event){
         // 0 : 현 비밀번호 불일치  1 : 정상 2 : 현 비밀번호와 변경 비밀번호와 일치
         if(event === "0"){
            alert("현 비밀번호가 일치하지 않습니다.");
            $("#passwordUpdateForm input[name=password]").focus();
         }else if(event === "1"){
            alert("비밀번호 수정완료");
            location.href="home.do";
         }else if(event === "2"){
            alert("현 비밀번호와 동일한 비밀번호입니다. 다시 입력해주세요");
            $("#passwordUpdateForm input[name=passwordChange]").focus();
         }
      }
   });
});//비밀번호 변경 EVENT END
	  
   /***********************************************이용약관***********************************************/
   //이용약관 동의확인 - 진용현
   $("#checkDocument .checkDocumentBtn input[value=확인]").click(function(){
      if(!$("#checkDocumentForm input[name=checkDocument]").is(":checked")){
         alert("이용약관 동의해주십시오.");   
         return;
      }
      $("#checkDocumentForm").submit();
   });//동의유무 확인 EVENT END
   
   //이용약관 취소 - 진용현
   $("#checkDocument .checkDocumentBtn input[value=취소]").click(function(){
      location.href="home.do";
   });//이용약관 취소 EVENT END
   
   /***********************************************사진업로드***********************************************/

      //멀티 파일 이미지 보기
      $("#multipartPreViewForm input[type=file]").change(multipartPreView)
      function multipartPreView(e) {
         $("#multipartPreView .preViewImg ul").html("");
         var files = e.target.files;
         var fileArr = Array.prototype.slice.call(files);
         var index = 0;
         var flag = true
         
         fileArr.forEach(function(f) {
                  if (!f.type.match("image/.*")) {
                     flag= false;
                     return;
                  }
                  
                  if (files.length < 11) {
                     //sel_files.push(f);
                     var reader = new FileReader();
                     reader.onload = function(e) {
                        var html = "<li><img src=\""+e.target.result+"\"/></li>";
                        $("#multipartPreView .preViewImg ul").append(
                              html);
                     }
                     reader.readAsDataURL(f);
                     }
               })
                  if (files.length > 10) {
                        alert("최대 10장까지 업로드 할 수 있습니다.");
                        $(this).val("");
                        return;
                     }
         $("#multipartPreView .preViewImg .preViewDefault").hide();
         if(flag===false){
         alert("이미지 확장자만 업로드 가능합니다.");
         $("#multipartPreViewForm input[type=file]").val("");
         $("#multipartPreView .preViewImg ul *").remove();
         $("#multipartPreView .preViewImg .preViewDefault").show();
         }
         
      }//파일 업로드 EVENT END
	  
	  //멀티파일 업로드 폼 보기
      $(".preView").click(function(){
         if($("#multipartPreView").is(":animated"))return;
         $("#multipartPreView").css({"top":"60%"});
         $("#multipartPreView").css({"display":"block"});
         $("#multipartPreView .preViewImg .preViewDefault").show();
         $("#multipartPreView").animate({
               top:"50%",
               opacity: 1
         },1000);
            
         });//멀티파일 업로드 폼 보기 EVENT END
      
	  //멀티파일 업로드 취소 
      $("#multipartPreViewForm input[value=취소]").click(function(){
      if($("#multipartPreView").is(":animated"))return;
      $("#multipartPreView").animate({
            top:"40%",
            opacity: 0
      },1000,function(){
         $(this).css({"display":"none"},
         $("#multipartPreViewForm")[0].reset(),
         $("#multipartPreView .preViewImg ul").html(""),
         $("#multipartPreView .preViewImg .preViewDefault").show()
         );
      });
   });//멀티파일 업로드 취소 EVEBT END
      
});//ready end

//이미지 미리보기 - 진용현
   function preViewProfile(){
      var reader = new FileReader();//파일읽기
      
      reader.onload = function(evnet){
         $("#registerForm .defaultprofile img,#updateForm .defaultprofile img").attr("src",event.target.result); //img 속성 중 src에 주소값 넣기
      }
      reader.readAsDataURL(event.target.files[0]);
   }//이미지 미리보기 EVENT END

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
      