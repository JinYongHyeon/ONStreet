<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<form action="addNotice.do" method="post" id="noticeRegister">
<input type="hidden" name="noticeNo" value="${requestScope.nvo.noticeNo}">
<br><span id="register">NOTICE</span>
<div class="container">
<sec:csrfInput/>
<input type="text" name="noticeTitle" placeholder="제목을 입력하세요" required="required" id="registerNoticeTitle">
<textarea rows="10" cols="70"  name="noticeContent" required="required" id="content" placeholder="공지사항의 내용을 입력하세요">
</textarea>
<input type="button" id="resetButton" value="취소 ">
<button type="submit" class="btn" id="submitButton">확인</button>
</div>
</form>
<script type="text/javascript">
$(document).ready(function() {
	$("#noticeRegister").submit(function() {
		return confirm("공지사항을 등록하시겠습니까?");
	});
	$("#resetButton").click(function() {
		alert("공지사항등록을 취소했습니다.");
		location.href="home.do";
	});
});
</script>