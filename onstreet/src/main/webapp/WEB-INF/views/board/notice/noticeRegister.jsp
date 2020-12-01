<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<form action="addNotice.do" method="post" id="noticeRegister">
<table border="1">
<tr>
<td>제목&nbsp;&nbsp;
<sec:csrfInput/>
<input type="text" name="title" placeholder="제목을 입력하세요" required="required"> 
</td>
</tr>
<tr>
<td>공지사항&nbsp;&nbsp;
<textarea rows="5" cols="15" name="content" required="required" placeholder="공지사항의 내용을 입력하세요">
</textarea>
</td>
</tr>
</table>
<button type="submit" class="btn">확인</button>
<button type="reset" class="btn">취소</button>
</form>
<script type="text/javascript">
$(document).ready(function() {
	$("#noticeRegister").submit(function() {
		return confirm("공지사항을 등록하시겠습니까?");
	});
});
</script>