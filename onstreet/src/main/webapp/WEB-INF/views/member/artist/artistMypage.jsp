<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<style>
.artistmypage{
	width: 100%;
}	
</style>

<div class="container">
  <h2>Table Head Colors</h2>
  <p>The .thead-dark class adds a black background to table headers, and the .thead-light class adds a grey background to table headers:</p>
  <table class="table">
    <thead class="thead-dark">
      <tr>
        <td>아이디</td>
		<td><sec:authentication property="principal.memberVO.id"/></td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
      </tr>
      <tr>
        <td>Mary</td>
        <td>Moe</td>
        <td>mary@example.com</td>
      </tr>
      <tr>
        <td>July</td>
        <td>Dooley</td>
        <td>july@example.com</td>
      </tr>
    </tbody>
  </table>

















<div class="container">
	<table class="artistmypage">
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
        <th>현재온도</th>
        <td>${requestScope.map.AVGLIKE}</td>
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
	<a href="${pageContext.request.contextPath}/removeMemberForm.do">회원탈퇴</a><br>
	<a href="${pageContext.request.contextPath}/updateArtistForm.do">회원정보수정</a><br>
	<a href="${pageContext.request.contextPath}/artistCheckEventList.do">이벤트신청현황</a><br>
	<a href="${pageContext.request.contextPath}/updatePasswordForm.do">비밀번호수정</a><br>
	<a href="${pageContext.request.contextPath}/followingList.do">팔로우리스트</a>
	
</div>



