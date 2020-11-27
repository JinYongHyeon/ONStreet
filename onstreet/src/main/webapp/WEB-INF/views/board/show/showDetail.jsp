<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="svo" value="${requestScope.svo}" />
<div class="col-sm-2"></div>
<div class="col-sm-4">
<table border="1">
		<tr>
			<td>작성자</td><td>${svo.artistVO.memberVO.nickName}</td>
		</tr>
		<tr>
			<td>작성일시</td><td>${svo.showWriteDate}</td>
		</tr>
		<tr>
			<td>공연제목</td><td>${svo.showTitle}</td>
		</tr>
		<tr>
			<td>공연일정</td><td>${svo.showDate}</td>
		</tr>
		<tr>
			<td colspan="2"><pre>${svo.showContent}</pre></td>
		</tr>
</table>
</div>

<div class="col-sm-4">
댓글부분
</div>
<div class="col-sm-2"></div>