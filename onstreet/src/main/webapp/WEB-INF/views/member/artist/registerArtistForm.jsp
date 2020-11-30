<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<div class="registerMember">
	<sec:authorize access="hasRole('ROLE_MEMBER')">
		<script type="text/javascript">
		location.href="${pageContext.request.contextPath}/home.do";
	</script>
	</sec:authorize>
	<div id="registerTitle">
	<h1>회원가입</h1>
	</div>
	<form action="${pageContext.request.contextPath}/registerArtist.do" 
		method="post" enctype="multipart/form-data" id="registerForm">
		<sec:csrfInput />
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" id="registerId" name="id" required="required" placeholder="아이디 입력해주세요"><span
					id="idCheck"></span></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="password" required="required" placeholder="비밀번호 입력해주세요"></td>
			</tr>
			<tr>
				<th>비밀번호재확인</th>
				<td><input type="password" name="passwordCheck" required="required" placeholder="비밀번호 재입력해주세요"></td>
			</tr>
			<tr>
				<th>아티스트명</th>
				<td><input type="text" name="nickName" required="required" placeholder="닉네임 입력해주세요"><span
					id="nickNameCheck"></span></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="address" readonly="readonly" required="required"  id="registerAddress"  placeholder="주소 입력해주세요"><button type="button" onclick="execDaumPostcode()">주소찾기</button></td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td><input type="text" name="address" required="required" placeholder="상세주소 입력해주세요"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone" required="required" placeholder="전화번호 입력해주세요"><span id="registerTelCheck"></span></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" name="email" required="required" placeholder="이메일 입력해주세요"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" required="required" placeholder="이름 입력해주세요"></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="date" name="age" required="required"></td>
			</tr>
			<tr>
				<th>SNS</th>
				<td><input type="text" name="sns" placeholder="SNS 입력해주세요"></td>
			</tr>
			<tr>
				<th>계좌번호</th>
				<td><input type="text" name="account" placeholder="계좌번호 입력해주세요"></td>
			</tr>
			<tr>
				<th>소개글</th>
				<td><textarea name="artistInfo" placeholder="소개글 입력해주세요" required="required"></textarea></td>
			</tr>
			<tr>
				<th rowspan="2">프로필</th>
				<td class="defaultprofile"><img src="${pageContext.request.contextPath}/resources/img/profile/default.png"></td>
			</tr>
			<tr>
				<td><input type="file" name="profileFile"></td>
			</tr>
		</table>
		<input type="submit" value="회원가입">
	</form>
</div>
<script	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
