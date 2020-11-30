<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

	
	<table>
		<tr>
		<td>아이디</td>
		<td><sec:authentication property="principal.memberVO.id"/></td>
		</tr>
		<tr>
		<td>이름</td>
		<td><sec:authentication property="principal.memberVO.name"/></td>
		</tr>
		<tr>
		<td>닉네임</td>
		<td><sec:authentication property="principal.memberVO.nickName"/></td>
		</tr>
		<tr>
		<td>휴대폰 번호</td>
		<td><sec:authentication property="principal.memberVO.phone"/></td>
		</tr>
		<tr>
		<td>주소</td>
		<td><sec:authentication property="principal.memberVO.address"/></td>
		</tr>
		<tr>
		<td>이메일</td>
		<td><sec:authentication property="principal.memberVO.email"/></td>
		</tr>
	</table>
	<a href="${pageContext.request.contextPath}/removeMemberForm.do">회원탈퇴</a>
	<a href="${pageContext.request.contextPath}/updateMemberForm.do">회원정보수정</a>
	<a href="">이벤트신청현황</a>