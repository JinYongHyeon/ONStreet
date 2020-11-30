<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<br>
<h1><b>${requestScope.artistVO.memberVO.nickName}</b></h1>
<br>
<div class="artistProfileImg">
<img src="${pageContext.request.contextPath}/resources/img/profile/${requestScope.artistVO.memberVO.profile}"> <br>
</div>
<div class="artistProfile">
	${requestScope.artistVO.artistInfo} <br>
	<c:if test="${requestScope.artistVO.sns!=null}">
		SNS : ${requestScope.artistVO.sns} <br>
		후원계좌 : ${requestScope.artistVO.account} <br>
	</c:if>
</div>