<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<div class="registerMember">
	<sec:authentication property="principal.memberVO" var="member" />

	<div id="registerTitle">
		<h1>회원수정</h1>
	</div>
	<form action="${pageContext.request.contextPath}/registerMember.do"
		method="post" enctype="multipart/form-data" id="registerForm">
		<sec:csrfInput />
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" id="registerId" name="id"
					value="${member.id}" readonly="readonly" placeholder="아이디 입력해주세요"><span
					id="idCheck"></span></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" name="nickName" required="required"
					value="${member.nickName}" placeholder="닉네임 입력해주세요"><span
					id="nickNameCheck"></span></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="address" readonly="readonly"
					required="required" id="registerAddress" placeholder="주소 입력해주세요">
					<button type="button" onclick="execDaumPostcode()">주소찾기</button></td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td><input type="text" name="address" required="required"
					placeholder="상세주소 입력해주세요"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone" required="required"
					value="${member.phone}" placeholder="전화번호 입력해주세요"><span
					id="registerTelCheck"></span></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" name="email" required="required"
					value="${member.email}" placeholder="이메일 입력해주세요"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" required="required"
					value="${member.name}" placeholder="이름 입력해주세요"></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="date" name="age" required="required"
					value="${member.age}"></td>
			</tr>

			<tr>
				<th rowspan="2">프로필</th>
				<td class="defaultprofile"><c:choose>
						<c:when test="${member.profile == null}">
							<img
								src="${pageContext.request.contextPath}/resources/img/profile/default.png">
						</c:when>
						<c:otherwise>
							<img
								src="${pageContext.request.contextPath}/resources/img/profile/${member.profile}">
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<td><input type="file" name="profileFile"></td>
			</tr>
		</table>
		<input type="submit" value="회원가입">
	</form>
</div>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
