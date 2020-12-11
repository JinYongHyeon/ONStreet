<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<h1>공지사항 수정</h1>
<form action="updateNotice.do" method="post" id="noticeUpdate">
<table>
<tr>
<td><h3>제목 수정&nbsp;&nbsp;</h3>
<sec:csrfInput/>
<input type="text" name="noticeTitle" placeholder="수정할 제목을 입력하세요" required="required" id="updateTitle"> 
</td>
</tr>
<tr>
<td><h3>공지사항내용 수정&nbsp;&nbsp;</h3>
<textarea rows="13" cols="131" name="noticeContent" required="required" placeholder="수정할 공지사항의 내용을 입력하세요" id="updateContent">
</textarea>
</table>
<input type="hidden" name="noticeNo" value="${requestScope.nvo}">
<button type="submit" class="btn" id="updateButton">수정</button>
<button type="reset" class="btn" id="backButton">취소</button>
</form>
<script type="text/javascript">
$(document).ready(function() {
	$("#noticeUpdate").submit(function() {
		return confirm("공지사항을 수정하시겠습니까?");
	});
});
</script>