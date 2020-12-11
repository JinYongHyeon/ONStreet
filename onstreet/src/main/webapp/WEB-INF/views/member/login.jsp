<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<sec:authorize access="hasRole('ROLE_MEMBER')">
	<script type="text/javascript">
		location.href="${pageContext.request.contextPath}/home.do";
	</script>
</sec:authorize>

<%-- 로그인 폼 [용현] --%>
<sec:authorize access="!hasRole('ROLE_MEMBER')">
	<div id="login" style="opacity: 1; display: block; border:3px solid #d03535">
		<div class="loginTitle">
			<h3>LOGIN</h3>
		</div>
		<div class="loginMain">
			<form action="${pageContext.request.contextPath}/login.do" method="post" class="loginForm">
				<sec:csrfInput />
				<div class="login-label-group">
					<svg width="50px" height="50px" viewBox="0 0 16 16" class="bi bi-person-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
</svg>
					<input type="text" name="id" id="loginFormId" placeholder="아이디" required="required">
					<label for="loginFormId">아이디</label>
				</div>
				<div class="login-label-group">
					<svg width="50px" height="50px" viewBox="0 0 16 16" class="bi bi-key-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M3.5 11.5a3.5 3.5 0 1 1 3.163-5H14L15.5 8 14 9.5l-1-1-1 1-1-1-1 1-1-1-1 1H6.663a3.5 3.5 0 0 1-3.163 2zM2.5 9a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" />
</svg>
					<input type="password" name="password" id="loginFormPass" placeholder="패스워드" required="required">
					<label for="loginFormPass">패스워드</label>
				</div>
				<input type="submit" value="로그인">
			</form>
		</div>
	</div>
</sec:authorize>
