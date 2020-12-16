<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<br><span id="logoNoticeUpdate">NOTICE</span>
<form action="updateNotice.do" method="post" id="noticeUpdate">
<div class="container">

<sec:csrfInput/>
<input type="text" name="noticeTitle" placeholder="제목을 입력하세요" required="required" id="updateTitle"> 
<textarea rows="25" cols="100" name="noticeContent" required="required" placeholder="공지사항의 내용을 입력하세요" id="updateContent">
</textarea>

<input type="hidden" name="noticeNo" value="${requestScope.nvo}">
<input type="button" class="btn"  id="backButton" value="취소">
<button type="submit" class="btn" id="updateButton">수정</button>
</div>
</form>
<script type="text/javascript">
$(document).ready(function() {
	$("#noticeUpdate").submit(function() {
		if($("#updateTitle").val().trim() == "") {
			alert("공지사항 제목을 입력하세요.");
			return false;
		}
		if($("#updateContent").val().trim() == "") {
			alert("공지사항 내용을 입력하세요.");
			return false;
		}
		return confirm("공지사항을 수정하시겠습니까?");
	});
	$("#backButton").click(function() {
		alert("공지사항수정을 취소했습니다.");
		location.href="getNoticeList.do";
	});
});
</script>