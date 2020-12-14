<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<div class="container">
  <h2>My page</h2>
  
  
  <table class="table">
    <thead>
    
      <tr>
        <th>아이디</th>
        <th>이름</th>
        <th>닉네임</th>
        <th>휴대폰 번호</th>
        <th>주소</th>
        <th>이메일</th>
      </tr>
      
      </thead>
      
      <tbody>
  <tr>    
        <td><sec:authentication property="principal.memberVO.id"/></td>
        <td><sec:authentication property="principal.memberVO.name"/></td>
        <td><sec:authentication property="principal.memberVO.nickName"/></td>
        <td><sec:authentication property="principal.memberVO.phone"/></td>
        <td><sec:authentication property="principal.memberVO.address"/></td>
        <td><sec:authentication property="principal.memberVO.email"/></td>
  </tr>
      </tbody>
  </table>
  
        <a href="${pageContext.request.contextPath}/removeMemberForm.do">회원탈퇴</a><br>
        <a href="${pageContext.request.contextPath}/updateMemberForm.do">회원정보수정</a><br>
        <a href="${pageContext.request.contextPath}/followingList.do">팔로잉목록보기</a><br>
        <a href="${pageContext.request.contextPath}/updatePasswordForm.do">비밀번호수정</a>
</div>










	
	