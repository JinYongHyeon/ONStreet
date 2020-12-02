<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="col-sm-12">
<table border="1">
<tr>
<td>번호:${requestScope.nvo.noticeNo}</td>
<td>제목:${requestScope.nvo.noticeTitle}</td>
</tr>
<tr>
<td colspan="2">작성일시:${requestScope.nvo.noticeWriteDate}</td>
</tr>
<tr>
<td colspan="5" class="content">
<pre>작성내용:${requestScope.nvo.noticeContent}</pre>
</td>
</tr>
<tr>
<td colspan="2">작성자닉네임:${requestScope.nvo.memberVO.nickName}</td>
</tr>
</table>
<button form="nopdateNoticeForm" type="submit">수정</button>
<form action="updateNoticeForm.do" id="nopdateNoticeForm" method="get">
<input type="hidden" name="noticeNo" value="${requestScope.nvo.noticeNo}">
</form>
</div>