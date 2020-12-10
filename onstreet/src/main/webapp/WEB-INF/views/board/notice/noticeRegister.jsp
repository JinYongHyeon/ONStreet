<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<form action="addNotice.do" method="post" id="noticeRegister">
<input type="hidden" name="noticeNo" value="${requestScope.nvo.noticeNo}">
<h2>공지사항 작성</h2>
<table>
<tr>
<th><h3>제목
<sec:csrfInput/>
<input type="text" name="noticeTitle" placeholder="제목을 입력하세요" required="required" id="registerNoticeTitle"> 
</h3>
</th>
</tr>
<tr>
<td><h3>공지사항</h3>&nbsp;&nbsp;
<textarea rows="14" cols="130" name="noticeContent" required="required" id="content" placeholder="공지사항의 내용을 입력하세요">
</textarea>
</td>
</tr>
</table>
<button type="reset" class="btn" id="resetButton">취소</button>
<button type="submit" class="btn" id="submitButton">확인</button>
</form>
<script type="text/javascript">
$(document).ready(function() {
	$("#noticeRegister").submit(function() {
		return confirm("공지사항을 등록하시겠습니까?");
	});
});
</script>