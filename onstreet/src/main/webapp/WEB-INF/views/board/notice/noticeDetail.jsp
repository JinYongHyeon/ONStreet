<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 
<div class="col-sm-12">
<sec:csrfInput/>
<table id="noticeDetail">
<tr>
<th id="DetailTitle">&nbsp;&nbsp;제목:${requestScope.nvo.noticeTitle}</th>
</tr>
<tr>
<th>&nbsp;&nbsp;작성일시:${requestScope.nvo.noticeWriteDate}</th>
</tr>
<tr>
<td colspan="5" id="noticeContent"  style="text-align: left;">
&nbsp;&nbsp;작성내용:${requestScope.nvo.noticeContent}
</td>
</tr>
<tr>
<td colspan="2" height="30px" style="text-align: left;">&nbsp;&nbsp;
작성자:${requestScope.nvo.memberVO.nickName}</td>
</tr>
</table>
<sec:authorize access="hasRole('ROLE_ADMIN')">
<button form="nopdateNoticeForm" type="submit" id="noticeDetailButton">수정</button>
<form action="updateNoticeForm.do" id="nopdateNoticeForm" method="get">
<input type="hidden" name="noticeNo" value="${requestScope.nvo.noticeNo}">
</form>
</sec:authorize>
</div>