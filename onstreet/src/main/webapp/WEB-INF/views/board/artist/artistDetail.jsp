<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<br>
<h1>
	<b>${requestScope.artistVO.memberVO.nickName}</b>
</h1>
<br>
<div class="artistProfileImg">
	<img
		src="${pageContext.request.contextPath}/resources/img/profile/${requestScope.artistVO.memberVO.profile}">
	<br>
</div>
<div class="artistProfile">
	${requestScope.artistVO.artistInfo} <br>
	<c:if test="${requestScope.artistVO.sns!=null}">
		SNS : ${requestScope.artistVO.sns} <br>
	</c:if>
	<c:if test="${requestScope.artistVO.account!=null}">
		후원계좌 : ${requestScope.artistVO.account} <br>
	</c:if>
	<br>
	<br>
</div>

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

<form id="follow">
	<input type="button" value="팔로우">
</form>