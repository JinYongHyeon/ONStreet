<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 
<div class="col-sm-12">
<sec:csrfInput/>
<table id="noticeDetail">
<tr>
<th>제목: ${requestScope.nvo.noticeTitle}</th>
</tr>
<tr>
<td colspan="2">작성일시:${requestScope.nvo.noticeWriteDate}</td>
</tr>
<tr>
<td colspan="5" class="content">
<span>작성내용:${requestScope.nvo.noticeContent}</span>
</td>
</tr>
<tr>
<td colspan="2">작성자닉네임:${requestScope.nvo.memberVO.nickName}</td>
</tr>
</table>
<sec:authorize access="hasRole('ROLE_ADMIN')">
<button form="nopdateNoticeForm" type="submit" id="noticeDetailButton">수정</button>
<form action="updateNoticeForm.do" id="nopdateNoticeForm" method="get">
<input type="hidden" name="noticeNo" value="${requestScope.nvo.noticeNo}">
</form>
</sec:authorize>
</div>