<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>



<div class="container">
  <h2>My page</h2>
  <p>The .table-bordered class adds borders to a table:</p>            
  <table class="table table-bordered" align="center">
    <thead align="center">
      <tr>
        <th>아이디</th>
        <td><sec:authentication property="principal.memberVO.id"/></td>
      </tr>
      <tr>
        <th>이름</th>
        <td><sec:authentication property="principal.memberVO.name"/></td>
      </tr>
      <tr>
        <th>닉네임</th>
        <td><sec:authentication property="principal.memberVO.nickName"/></td>
      </tr>
      <tr>
        <th>휴대폰 번호</th>
        <td><sec:authentication property="principal.memberVO.phone"/></td>
      </tr>
      <tr>
        <th>주소</th>
        <td><sec:authentication property="principal.memberVO.address"/></td>
      </tr>
      <tr>
        <th>이메일</th>
        <td><sec:authentication property="principal.memberVO.email"/></td>
      </tr>

        
  </table>
        <a href="${pageContext.request.contextPath}/removeMemberForm.do">회원탈퇴</a><br>
        <a href="${pageContext.request.contextPath}/updateMemberForm.do">회원정보수정</a><br>
        <a href="${pageContext.request.contextPath}/followingList.do">팔로잉목록보기</a><br>
        <a href="${pageContext.request.contextPath}/updatePasswordForm.do">비밀번호수정</a>
</div>










	
	