<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<br><br>
<span id="manageFormTitle">MANAGE</span><br><br><br><br><br>
<div class="container">
<a href="${pageContext.request.contextPath}/manageMemberForm.do" id="manageFormBtn">회원 관리</a> 
<a href="${pageContext.request.contextPath}/getManageShowList.do" id="manageFormBtn">게시물 관리</a> 
<a href="${pageContext.request.contextPath}/getCheckArtistList.do" id="manageFormBtn">아티스트 승인</a>
<a href="${pageContext.request.contextPath}/getCheckEventList.do" id="manageFormBtn">이벤트 승인</a> 
</div>