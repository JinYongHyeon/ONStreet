<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
   <sec:authentication property="principal.memberVO" var="member" />

<div class="container">
<sec:csrfMetaTags/>
   
   <div id="passwordUpdate">
    <div class="passwordUpdateTitle">
         <h2>
            비밀번호 변경 
         </h2>
      </div>
      <form action="${pageContext.request.contextPath}" method="post" id="passwordUpdateForm">
      <sec:csrfInput/>
         <table>
            <tr>
               <th>ID</th>
               <td>${member.id}</td>
            </tr>
            <tr>
               <th>현재 비밀번호</th>
               <td><input type="password" name="password" required="required" placeholder="현재 비밀번호를 입력해주세요"></td>
            </tr>
            <tr>
               <th>변경 비밀번호</th>
               <td><input type="password" name="passwordChange" required="required" placeholder="변경 비밀번호를 입력해주세요"></td>
            </tr>
            <tr>
               <th>변경 비밀번호 재확인</th>
               <td><input type="password" name="passwordCheck" required="required" placeholder="변경 비밀번호를 재입력해주세요"></td>
            </tr>
         </table>   
         <button type="button">확인</button>   
      </form>
   </div>
</div>