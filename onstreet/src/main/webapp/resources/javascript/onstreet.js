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

});

