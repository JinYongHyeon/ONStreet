<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 
<div class="col-sm-12">
<sec:csrfInput/>
<br><span id="logoNotice">NOTICE</span>
<div id="noticeDetail">
<div id="DetailTitle">${requestScope.nvo.noticeTitle}</div><hr>
<div id="noticeDtailProFile">
<img class="noticeImg" src="${pageContext.request.contextPath}/resources/img/profile/${nvo.memberVO.profile}" width="35px"height="30px">
</div>
&nbsp;&nbsp;&nbsp;
<span id="noticeWrite">${requestScope.nvo.memberVO.nickName}</span>
<br>
<span id="noticeDate">${requestScope.nvo.noticeWriteDate}</span>
<hr>
<div id="noticeContent"  style="text-align: left;">
&nbsp;&nbsp;${requestScope.nvo.noticeContent}
</div>
</div>
<sec:authorize access="hasRole('ROLE_ADMIN')">
<button form="nopdateNoticeForm" type="submit" id="noticeDetailButton">수정</button>
<form action="updateNoticeForm.do" id="nopdateNoticeForm" method="get">
<input type="hidden" name="noticeNo" value="${requestScope.nvo.noticeNo}">
</form>
</sec:authorize>
</div>