<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- tiles framework 선언부 --%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- title이 null인 경우는 무시된다 -->
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/style/onstreet.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/style/onstreet-media.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/javascript/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/javascript/onstreet.js"></script>
</head>
<body>
	<div id="loginBlind"></div>
	<div id="header">
		<!-- Tiles header 영역 -->
		<tiles:insertAttribute name="header" />
	</div>
	

			<div id="main" class="col-sm-12">
				<!-- Tiles main 영역 -->
				<tiles:insertAttribute name="main" />
			</div>
			<%-- main --%>	

	<%-- container-fluid text-center  --%>
	
	<div id="footer">
		<!-- Tiles footer 영역 -->
		<tiles:insertAttribute name="footer" />
	</div>

<%-- 로그인 폼 [용현] --%>
<sec:authorize access="!hasRole('ROLE_MEMBER')">
	<div id="login">
		<div class="loginTitle">
			<h3>LOGIN</h3>
			<svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-x-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
  <path fill-rule="evenodd" d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
</svg>
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

</body>
</html>

