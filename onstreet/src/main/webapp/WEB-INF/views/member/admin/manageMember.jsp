<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<h1>
	<b>MANAGE</b>
</h1>
<br>
<br>

<table border="1">
	<thead>
		<tr>
		    <th></th>
			<th>아이디</th>
			<th>닉네임</th>
			<th>주소</th>
			<th>번호</th>
			<th>이메일</th>
			<th>이름</th>
			<th>나이</th>
			<th>구분</th>
		</tr>
	</thead>

	<tbody>

		<c:forEach var="avo" items="${requestScope.authVO.memberList}">
			<tr>
			<td><input type="checkbox"></td>
				<td>지윤이 짱짱 귀요미</td>
				<td>${avo.memberVO.id}</td>
				<td>${avo.memberVO.nickName}</td>
				<td>${avo.memberVO.address}</td>
				<td>${avo.memberVO.phone}</td>
				<td>${avo.memberVO.email}</td>
				<td>${avo.memberVO.name}</td>
				<td>${avo.memberVO.age}</td>
				<td>${avo.authName}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

