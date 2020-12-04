<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<br>
<span id="artistTitle">ARITST</span>
<br><br><br>

<div class="col-sm-4 artistProfileImg">
	<img
		src="${pageContext.request.contextPath}/resources/img/profile/${requestScope.artistVO.memberVO.profile}">
	<br>
</div>
<div class="col-sm-1"></div>
<div class="col-sm-5 artistProfile">
    <span id="artistName">${requestScope.artistVO.memberVO.nickName}</span>
    <form id="follow">
	<input type="button" value="팔로우">
</form>
    <hr>
    <br>
	${requestScope.artistVO.artistInfo}
	<c:if test="${requestScope.artistVO.sns!=null}">
	<hr>
	<img src="${pageContext.request.contextPath}/resources/img/content/social-media.png">
	<b>공식계정</b> 
		${requestScope.artistVO.sns}<hr>
	</c:if>
	<c:if test="${requestScope.artistVO.account!=null}">
	<img src="${pageContext.request.contextPath}/resources/img/content/money.png">
	<b>후원계좌</b> 
		${requestScope.artistVO.account} <hr>
	</c:if>
	<br>
	<br>
</div>
<div class="col-sm-1"></div>

<script type="text/javascript">
	$(document).ready(function() {
		$("#follow input[type=button]").click(function() {
		if(confirm("팔로우 하시겠습니까?")) {
			
		$.ajax({
			type: "post",
			url: "${pageContext.request.contextPath}/registerFollowing.do",
			dataType: "text",
			data: "followingId=${requestScope.artistVO.memberVO.id}",
			beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
			success: function(data) {
				if(data==="0") {
					alert("이미 팔로우한 아티스트입니다!");
					return;
				} else {
					if(confirm("팔로우 리스트로 이동하시겠습니까?"))
						location.href="mypageForm.do";
				}
			}
			});//ajax
		}
		});
	});//ready
</script>