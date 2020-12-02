<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<form action="updateNotice.do" method="post" id="noticeUpdate">
<table border="1">
<tr>
<td>제목 수정&nbsp;&nbsp;
<sec:csrfInput/>
<input type="text" name="noticeTitle" placeholder="수정할 제목을 입력하세요" required="required"> 
</td>
</tr>
<tr>
<td>공지사항내용 수정&nbsp;&nbsp;
<textarea rows="5" cols="15" name="noticeContent" required="required" placeholder="수정할 공지사항의 내용을 입력하세요">
</textarea>
</table>
<input type="hidden" name="noticeNo" value="${requestScope.nvo}">
<button type="submit" class="btn">수정</button>
<button type="reset" class="btn">취소</button>
</form>
<script type="text/javascript">
$(document).ready(function() {
	$("#noticeUpdate").submit(function() {
		return confirm("공지사항을 수정하시겠습니까?");
	});
});
</script>