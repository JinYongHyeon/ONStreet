<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
		<tr>
		<td>아티스트명</td>
		<td><sec:authentication property="principal.memberVO.nickName"/></td>
		</tr>
		<tr>
		<td>공연온도</td>
		<td></td>
		</tr>
		<tr>
		<td>팔로워</td>
		<td></td>
		</tr>
		<tr>
		<td>SNS 주소</td>
		<td><sec:authentication property="principal.sns"/></td>
		</tr>
		<tr>
		<td>후원계좌</td>
		<td><sec:authentication property="principal.account"/></td>
		</tr>
		<tr>
		<td>소개글</td>
		<td><sec:authentication property="principal.artistInfo"/></td>
		</tr>
	</table>
	<a href="${pageContext.request.contextPath}/removeMemberForm.do">회원탈퇴</a>
	<a href="${pageContext.request.contextPath}/updateArtistForm.do">회원정보수정</a>
	<a href="${pageContext.request.contextPath}/artistCheckEventList.do">이벤트신청현황</a>




