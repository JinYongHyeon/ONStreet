<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 

<div class="showListTitle">
<span id="showListTitle">NOTICE</span>
</div>
<c:set var="svo" value="${requestScope.svo}" />
<div class="container">
<sec:authentication property="principal.memberVO" var="member"/>
			<h1>${nvo.noticeTitle}</h1><hr>
				<div id="showDetailProfile"><img class="user-img" id="showDetailProfileImg" src="${pageContext.request.contextPath}/resources/img/profile/${nvo.memberVO.profile}" width="35px"></div>
			&nbsp;${requestScope.nvo.memberVO.nickName}<br>
			<span id="showDetailShowWriteDate">&nbsp;${requestScope.nvo.noticeWriteDate}</span><hr>
			
			<div id="showDetailUpdateDeleteDiv">
			<input type="hidden" id="loginId" value="${member.id}"> 
			
			</div>
			
			<br><br>
			</div>
			

<div id="showDetailContentSide" >
<section class="test">
						<div>
			<span>${requestScope.nvo.noticeContent}</span>
			</div>
		</section>		
</div>
<sec:authorize access="hasRole('ROLE_ADMIN')">
					<button form="nopdateNoticeForm" type="submit" id="noticeDetailButton">수정</button>
					<form action="updateNoticeForm.do" id="nopdateNoticeForm" method="get">
					<input type="hidden" name="noticeNo" value="${requestScope.nvo.noticeNo}">
					</form>
						<!-- <button type="button" id="btn-update" class="btn btn-warning" >수정</button> -->
			</sec:authorize>

