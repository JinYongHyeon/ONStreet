<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<div class="registerMember">
	<form action="${pageContext.request.contextPath}/registerMember.do" method="post" enctype="multipart/form-data">
	<sec:csrfInput/>
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="password"></td>
			</tr>
			<tr>
				<th>비밀번호재확인</th>
				<td><input type="text" name="passwordCheck"></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" name="nickName"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="address"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="text" name="age"></td>
			</tr>
			<tr>
				<th>프로필</th>
				<td><input type="file" name="profile"></td>
			</tr>
		</table>
		<input type="submit" value="회원가입">
	</form>
</div>