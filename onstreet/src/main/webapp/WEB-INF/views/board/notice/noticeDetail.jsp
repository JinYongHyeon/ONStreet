<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 

<script type="text/javascript">
$(document).ready(function() {
	$("#noticeDetailButton").click(function() {
		if(confirm("공지사항을 수정하시겠습니까?")) {
			location.href="updateNoticeForm.do";
		} else {
			return false;	
		} 
	});
	
	$("#noticeDeleteButton").click(function() {
		if(confirm("공지사항을 삭제하시겠습니까?")) {
			location.href="getNoticeList.do";
		} else {
			return false;	
		} 
	});
});//ready
</script>

<div class="showListTitle">
<span id="showListTitle">NOTICE</span>
</div>
<c:set var="svo" value="${requestScope.svo}" />
<div class="container">
<sec:authentication property="principal.memberVO" var="member"/>
			<h1 id="noticeTitle">${nvo.noticeTitle}</h1><hr>
				<div id="showDetailProfile"><img class="user-img" id="showDetailProfileImg" src="${pageContext.request.contextPath}/resources/img/profile/${nvo.memberVO.profile}" width="35px"></div>
			&nbsp;${requestScope.nvo.memberVO.nickName}<br>
			<span id="showDetailShowWriteDate">&nbsp;${requestScope.nvo.noticeWriteDate}</span><hr>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
					<button form="nopdateNoticeForm" type="submit" id="noticeDetailButton">수정</button>
					<form action="updateNoticeForm.do" id="nopdateNoticeForm" method="get">
					<input type="hidden" name="noticeNo" value="${requestScope.nvo.noticeNo}">
					</form>

			<button form="nopdateNoticeDeleteForm" type="submit" id="noticeDeleteButton">삭제</button>
					<form action="deleteNoticeDetail.do" id="nopdateNoticeDeleteForm" method="post">
					<sec:csrfInput/>
					<input type="hidden" name="noticeNo" value="${requestScope.nvo.noticeNo}">
					</form>
					</sec:authorize>
			<div id="showDetailUpdateDeleteDiv">
			<input type="hidden" id="loginId" value="${member.id}"> 
			
			</div>
			
			<br><br>
<div id="showDetailContentSide" >
<section class="test">
						<div>
			<span>${requestScope.nvo.noticeContent}</span>
			</div>
		</section>		
</div>
			</div>
			



