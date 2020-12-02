<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="registerMember">
	<sec:authentication property="principal" var="artist" />
	<c:set var="address" value="${fn:split(artist.memberVO.address,',')}"></c:set>
	<div id="registerTitle">
		<h1>회원수정</h1>
	</div>
	<form action="${pageContext.request.contextPath}/updateArtist.do"
		method="post" enctype="multipart/form-data" id="updateForm">
		<sec:csrfInput />
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" id="registerId" name="id"
					value="${artist.memberVO.id}" readonly="readonly" placeholder="아이디 입력해주세요"></td>
			</tr>
			
			<tr>
				<th>닉네임</th>
				<td><input type="text" name="nickName" required="required"
					value="${artist.memberVO.nickName}" placeholder="닉네임 입력해주세요"><span
					id="nickNameCheck"></span></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="address" readonly="readonly"
					required="required" id="registerAddress"  value="${address[0]}" placeholder="주소 입력해주세요">
					<button type="button" onclick="execDaumPostcode()">주소찾기</button></td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td><input type="text" name="address" value="${address[1]}" required="required"
					placeholder="상세주소 입력해주세요"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone" required="required"
					value="${artist.memberVO.phone}" placeholder="전화번호 입력해주세요"><span
					id="registerTelCheck"></span></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" name="email" required="required"
					value="${artist.memberVO.email}" placeholder="이메일 입력해주세요"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" required="required"
					value="${artist.memberVO.name}" placeholder="이름 입력해주세요"></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="date" name="age" required="required" readonly="readonly"
					value="${artist.memberVO.age}"></td>
			</tr>
			<tr>
				<th>SNS</th>
				<td><input type="text" name="sns" value="${artist.sns}" placeholder="SNS 입력해주세요"></td>
			</tr>
			<tr>
				<th>계좌번호</th>
				<td><input type="text" name="account" value="${artist.account}" placeholder="계좌번호 입력해주세요"></td>
			</tr>
			<tr>
				<th>소개글</th>
				<td><textarea name="artistInfo" placeholder="소개글 입력해주세요" required="required">${artist.artistInfo}</textarea></td>
			</tr>
			<tr>
				<th rowspan="2">프로필</th>
				<td class="defaultprofile"><c:choose>
						<c:when test="${artist.memberVO.profile == null}">
							<img
								src="${pageContext.request.contextPath}/resources/img/profile/default.png">
						</c:when>
						<c:otherwise>
							<img
								src="${pageContext.request.contextPath}/resources/img/profile/${artist.memberVO.profile}">
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<td><input type="file" name="profileFile"></td>
			</tr>
		</table>
		<input type="submit" value="회원수정">
	</form>
</div>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
