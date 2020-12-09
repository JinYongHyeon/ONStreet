<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
	<sec:authentication property="principal.memberVO" var="member" />

<sec:csrfMetaTags/>
<div id="passwordUpdate">
	<div class="passwordUpdateTitle">
		<h1>
			비밀번호 변경 
		</h1>
	</div>
	<form action="${pageContext.request.contextPath}" method="post" id="passwordUpdateForm">
	<sec:csrfInput/>
		<table>
			<tr>
				<th>현재 비밀번호</th>
				<td><input type="password" name="password" required="required"></td>
			</tr>
			<tr>
				<th>변경 비밀번호</th>
				<td><input type="password" name="passwordChange" required="required"></td>
			</tr>
			<tr>
				<th>변경 비밀번호 재확인</th>
				<td><input type="password" name="passwordCheck" required="required"></td>
			</tr>
		</table>	
		<button>비밀번호 변경</button>	
	</form>
</div>
<script type="text/javascript">

 

</script>